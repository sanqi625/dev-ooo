from uhdl.uhdl import *
from subpredecoder import *


class filter_predecoder(Component):
    def __init__(self):
        super().__init__()
        self.dec_pred_pc       = Input(UInt(32))
        self.dec_offset        = Input(UInt(OffsetWidth))
        self.dec_data          = Input(UInt(CHANNEL_NUM*16))
        self.dec_taken         = Input(UInt(1))
        self.dec_last_vld_in   = Input(UInt(1))
        self.dec_last_inst_in  = Input(UInt(16))
        self.dec_last_pc_in    = Input(UInt(32))
        self.v_dec_inst        = Output(UInt(CHANNEL_NUM*32))
        self.v_dec_ena         = Output(UInt(CHANNEL_NUM))
        self.v_dec_vld         = Output(UInt(CHANNEL_NUM))
        self.v_dec_pc          = Output(UInt(CHANNEL_NUM*32))
        self.v_dec_nxt_pc      = Output(UInt(CHANNEL_NUM*32))
        self.dec_last_vld_out  = Output(UInt(1))
        self.dec_last_inst_out = Output(UInt(16))
        self.dec_last_pc_out   = Output(UInt(32))

        ##########################################################################
        # shift invalid instruction & Valid Inst
        ##########################################################################
        align_type          = 2**(AlignWidth-1)
        self.inst           = Wire(UInt(CHANNEL_NUM*16))
        self.v_vld          = Wire(UInt(CHANNEL_NUM))
        self.align_pc_offset = Wire(UInt(32))
        case_align_inst_lst = []
        case_align_vld_lst  = []
        case_align_pc_lst   = []
        for i in range(1, align_type):
            case_align_inst_lst.append((UInt(AlignWidth-1, i), Combine(UInt(i*16, 0), self.dec_data[CHANNEL_NUM*16-1:i*16])))
            case_align_vld_lst.append((UInt(AlignWidth-1, i), Combine(UInt(i, 0), UInt(CHANNEL_NUM-i, 2**(CHANNEL_NUM-i)-1))))
            case_align_pc_lst.append((UInt(AlignWidth-1, i), Combine(UInt(32, 15*2-i*2))))

        self.inst  += Case(self.dec_pred_pc[AlignWidth-1:1], case_align_inst_lst, self.dec_data)
        self.v_vld += Case(self.dec_pred_pc[AlignWidth-1:1], case_align_vld_lst, UInt(CHANNEL_NUM, 2**CHANNEL_NUM-1))
        self.align_pc_offset += Case(self.dec_pred_pc[AlignWidth-1:1], case_align_pc_lst, UInt(32, 15*2))

        ###########################################################################
        # 16 Enable
        ###########################################################################
        self.v_ena          = Wire(UInt(CHANNEL_NUM))
        ena_lst             = []

        for chnl in range(0, CHANNEL_NUM):
            setattr(self, f'v_ena_{chnl}', Wire(UInt(1)))
            ena_chnl = getattr(self, f'v_ena_{chnl}')
            ena_chnl += GreaterEqual(self.dec_offset, UInt(OffsetWidth, chnl))
            ena_lst.append(ena_chnl)

        ena_lst.reverse()
        self.v_ena += Combine(*ena_lst)

        ###########################################################################
        # 16 Enable
        ###########################################################################
        self.inst_add_last  = Wire(UInt((CHANNEL_NUM+1)*16))
        self.v_vld_add_last = Wire(UInt(CHANNEL_NUM+1))
        self.v_ena_add_last = Wire(UInt(CHANNEL_NUM+1))
        self.v_pc_add_last  = Wire(UInt(32))

        self.inst_add_last  += when(self.dec_last_vld_in).then(Combine(self.inst, self.dec_last_inst_in)).otherwise(Combine(UInt(16,0), self.inst))
        self.v_vld_add_last += when(self.dec_last_vld_in).then(Combine(self.v_vld, UInt(1,1))).otherwise(Combine(UInt(1,0), self.v_vld))
        self.v_ena_add_last += when(self.dec_last_vld_in).then(Combine(self.v_ena, UInt(1,1))).otherwise(Combine(UInt(1,0), self.v_ena))
        self.v_pc_add_last  += when(self.dec_last_vld_in).then(self.dec_last_pc_in).otherwise(self.dec_pred_pc)

        ###########################################################################
        # first 16 + 128 subpredec level 1
        ###########################################################################
        self.v_dec_inst_first  = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_ena_first   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_vld_first   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_pc_first    = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_nxt_pc_first= Wire(UInt(SUB_CHANNEL_NUM*32))
        self.use_last_first    = Wire(UInt(1))
        self.need_last_buf_first = Wire(UInt(1))

        self.sub_first = filter_subpredecoder(type='first')

        self.sub_first.pred_pc += self.v_pc_add_last
        self.sub_first.v_vld   += self.v_vld_add_last[SUB_CHANNEL_NUM:0]
        self.sub_first.v_ena   += self.v_ena_add_last[SUB_CHANNEL_NUM:0]
        self.sub_first.data    += self.inst_add_last[(SUB_CHANNEL_NUM+1)*16-1:0]

        self.v_dec_inst_first  += self.sub_first.v_dec_inst
        self.v_dec_ena_first   += self.sub_first.v_dec_ena
        self.v_dec_vld_first   += self.sub_first.v_dec_vld
        self.v_dec_pc_first    += self.sub_first.v_dec_pc
        self.v_dec_nxt_pc_first+= self.sub_first.v_dec_nxt_pc
        self.use_last_first    += self.sub_first.use_last
        self.need_last_buf_first += self.sub_first.need_last_buf


        ###########################################################################
        # second 128 + 16 subpredec level 2 
        ###########################################################################
        self.second_pred_pc     = Wire(UInt(33))
        self.v_dec_inst_second  = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_ena_second   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_vld_second   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_pc_second    = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_nxt_pc_second= Wire(UInt(SUB_CHANNEL_NUM*32))
        self.use_last_second    = Wire(UInt(1))

        self.second_pred_pc     += Add(self.v_pc_add_last, UInt(32, 9*2))

        self.sub_second = filter_subpredecoder(type='second')

        self.sub_second.pred_pc += self.second_pred_pc[31:0]
        self.sub_second.v_vld   += Combine(UInt(1,0), self.v_vld_add_last[CHANNEL_NUM    : SUB_CHANNEL_NUM+1])
        self.sub_second.v_ena   += Combine(UInt(1,0), self.v_ena_add_last[CHANNEL_NUM    : SUB_CHANNEL_NUM+1])
        self.sub_second.data    += Combine(UInt(16,0), self.inst_add_last[(CHANNEL_NUM+1)*16-1 : (SUB_CHANNEL_NUM+1)*16])

        self.v_dec_inst_second  += self.sub_second.v_dec_inst
        self.v_dec_ena_second   += self.sub_second.v_dec_ena
        self.v_dec_vld_second   += self.sub_second.v_dec_vld
        self.v_dec_pc_second    += self.sub_second.v_dec_pc
        self.v_dec_nxt_pc_second+= self.sub_second.v_dec_nxt_pc
        self.use_last_second    += self.sub_second.use_last


        ###########################################################################
        # second 16 + 128 subpredec level 2 add half
        ###########################################################################
        self.second_pred_pc_hf     = Wire(UInt(33))
        self.v_dec_inst_second_hf  = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_ena_second_hf   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_vld_second_hf   = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_pc_second_hf    = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_nxt_pc_second_hf= Wire(UInt(SUB_CHANNEL_NUM*32))
        self.use_last_second_hf    = Wire(UInt(1))

        self.second_pred_pc_hf     += Add(self.v_pc_add_last, UInt(32, 8*2))

        self.sub_second_hf = filter_subpredecoder(type='second_half')

        self.sub_second_hf.pred_pc += self.second_pred_pc_hf[31:0]
        self.sub_second_hf.v_vld   += self.v_vld_add_last[CHANNEL_NUM          : SUB_CHANNEL_NUM]
        self.sub_second_hf.v_ena   += self.v_ena_add_last[CHANNEL_NUM          : SUB_CHANNEL_NUM]
        self.sub_second_hf.data    += self.inst_add_last [(CHANNEL_NUM+1)*16-1 : SUB_CHANNEL_NUM*16]

        self.v_dec_inst_second_hf  += self.sub_second_hf.v_dec_inst
        self.v_dec_ena_second_hf   += self.sub_second_hf.v_dec_ena
        self.v_dec_vld_second_hf   += self.sub_second_hf.v_dec_vld
        self.v_dec_pc_second_hf    += self.sub_second_hf.v_dec_pc
        self.v_dec_nxt_pc_second_hf+= self.sub_second_hf.v_dec_nxt_pc
        self.use_last_second_hf    += self.sub_second_hf.use_last

        ###########################################################################
        # merge first and second
        ###########################################################################
        self.v_dec_pc_merge        = Wire(UInt(CHANNEL_NUM*32)) 
        self.v_dec_nxt_pc_merge    = Wire(UInt(CHANNEL_NUM*32)) 
        self.v_dec_inst_merge      = Wire(UInt(CHANNEL_NUM*32))
        self.v_dec_ena_merge       = Wire(UInt(CHANNEL_NUM))
        self.v_dec_vld_merge       = Wire(UInt(CHANNEL_NUM))


        # sel second
        self.v_dec_inst_sel_second      = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_ena_sel_second       = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_vld_sel_second       = Wire(UInt(SUB_CHANNEL_NUM))
        self.v_dec_pc_sel_second        = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_nxt_pc_sel_second    = Wire(UInt(SUB_CHANNEL_NUM*32))
        self.use_last_sel_second        = Wire(UInt(1))

        self.v_dec_inst_sel_second      += when(self.use_last_first).then(self.v_dec_inst_second).otherwise(self.v_dec_inst_second_hf)
        self.v_dec_ena_sel_second       += when(self.use_last_first).then(self.v_dec_ena_second).otherwise(self.v_dec_ena_second_hf)
        self.v_dec_vld_sel_second       += when(self.use_last_first).then(self.v_dec_vld_second).otherwise(self.v_dec_vld_second_hf)
        self.v_dec_pc_sel_second        += when(self.use_last_first).then(self.v_dec_pc_second).otherwise(self.v_dec_pc_second_hf)
        self.v_dec_nxt_pc_sel_second    += when(self.use_last_first).then(self.v_dec_nxt_pc_second).otherwise(self.v_dec_nxt_pc_second_hf)
        self.use_last_sel_second        += when(self.use_last_first).then(self.use_last_second).otherwise(self.use_last_second_hf)

        # merge first and second
        pld_dict = {'pc': 32, 'nxt_pc': 32, 'inst':32, 'ena':1, 'vld':1}
        for key, value in pld_dict.items():
            pld_lst = []
            for i in range(0, CHANNEL_NUM):
                setattr(self, f'v_dec_{key}_merge_{i}', Wire(UInt(value)))    
                merge_pld  = getattr(self, f'v_dec_{key}_merge_{i}')  
                first_pld  = getattr(self, f'v_dec_{key}_first')  
                second_pld = getattr(self, f'v_dec_{key}_sel_second') 
                # first 4 slot 
                if i < HALF_SUB_NUM:
                    merge_pld += first_pld[(i+1)*value-1 : i*value]
                else:
                    empty = EmptyWhen()
                    # 4-7 slot select between first payload and second payload
                    if i < SUB_CHANNEL_NUM:
                        for j in range(HALF_SUB_NUM,i+1):
                            empty.when(Not(self.v_dec_ena_first[j])).then(second_pld[(i-j+1)*value-1:(i-j)*value]) # i is slot, j is sel, i-j is offset
                        empty.otherwise(first_pld[(j+1)*value-1 : j*value])
                        merge_pld += empty
                    # 8-11 slot select from second payload
                    elif i < 12:
                        for j in range(HALF_SUB_NUM, SUB_CHANNEL_NUM):
                            empty.when(Not(self.v_dec_ena_first[j])).then(second_pld[(i-j+1)*value-1:(i-j)*value]) # i-SUB is slot, j is sel, (i-SUB)+(SUB-j) = i-j
                        empty.otherwise(second_pld[(i-SUB_CHANNEL_NUM+1)*value-1 : (i-SUB_CHANNEL_NUM)*value])    
                        merge_pld += empty
                    # last 12-15 slot select from second payload or themselves
                    elif i < CHANNEL_NUM:
                        for j in range(HALF_SUB_NUM, SUB_CHANNEL_NUM):
                            if i-j < SUB_CHANNEL_NUM :
                                empty.when(Not(self.v_dec_ena_first[j])).then(second_pld[(i-j+1)*value-1:(i-j)*value]) # i-SUB is slot, j is sel, (i-SUB)+(SUB-j) = i-j
                            elif i-j >= SUB_CHANNEL_NUM:
                                empty.when(Not(self.v_dec_ena_first[j])).then(UInt(value, 0)) # i-SUB is slot, j is sel, (i-SUB)+(SUB-j) = i-j
                        empty.otherwise(second_pld[(i-SUB_CHANNEL_NUM+1)*value-1 : (i-SUB_CHANNEL_NUM)*value])    
                        merge_pld += empty

                pld_lst.append(merge_pld)
            
            pld_lst.reverse()
            merge_pld_final =  getattr(self, f'v_dec_{key}_merge')
            merge_pld_final += Combine(*pld_lst)
            merge_pld_port  =  getattr(self, f'v_dec_{key}')
            merge_pld_port  += merge_pld_final

        ###########################################################################
        # select last half ena/pc/inst
        ###########################################################################
        self.last_need_half          = Wire(UInt(1))
        self.dec_last_pc_w           = Wire(UInt(33))
        self.dec_last_inst_w         = Wire(UInt(16))

        self.last_need_half  += when(self.need_last_buf_first).then(UInt(1, 1)).when(self.use_last_first).then(self.use_last_second).otherwise(self.use_last_second_hf)
   
        self.dec_last_pc_w   += Add(Combine(self.dec_pred_pc[31:AlignWidth], UInt(AlignWidth, 0)), UInt(32, CHANNEL_NUM*2-2))
        self.dec_last_inst_w += self.dec_data[CHANNEL_NUM*16-1:(CHANNEL_NUM-1)*16]  

        self.dec_last_vld_out    += And(self.last_need_half, Not(self.dec_taken))
        self.dec_last_pc_out     += self.dec_last_pc_w[31:0]
        self.dec_last_inst_out   += self.dec_last_inst_w




u = filter_predecoder()
u.run_lint()
u.generate_verilog(iteration=True)
u.generate_filelist(abs_path=True)
