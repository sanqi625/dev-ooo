from uhdl.uhdl import *
from rvc_decode import *

AlignWidth = 5
OffsetWidth = 3+1
CHANNEL_NUM = 16
SUB_CHANNEL_NUM = int(CHANNEL_NUM/2)
HALF_SUB_NUM    = int(CHANNEL_NUM/4)
MAX_OFFSET = int(2**OffsetWidth-1)


# 128 max 8, min 4
class filter_subpredecoder(Component):
    def __init__(self, type='first'):
        super().__init__()
        self.pred_pc        = Input(UInt(32))
        self.v_vld          = Input(UInt(SUB_CHANNEL_NUM+1))
        self.v_ena          = Input(UInt(SUB_CHANNEL_NUM+1))
        self.data           = Input(UInt((SUB_CHANNEL_NUM+1)*16))
        # self.taken          = Input(UInt(1))
        self.v_dec_inst     = Output(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_ena      = Output(UInt(SUB_CHANNEL_NUM))
        self.v_dec_vld      = Output(UInt(SUB_CHANNEL_NUM))
        self.v_dec_pc       = Output(UInt(SUB_CHANNEL_NUM*32))
        self.v_dec_nxt_pc   = Output(UInt(SUB_CHANNEL_NUM*32))
        self.use_last       = Output(UInt(1))
        # self.last_pc        = Output(UInt(32))
        # self.last_inst      = Output(UInt(16))
        if "first" in type:     self.need_last_buf       = Output(UInt(1))

        if "first" in type or 'second_half' in type:   self.use_last_w     = Wire(UInt(1))

        ###########################################################################
        # decode 16/32 bit instruction
        ###########################################################################
        self.inst_type_extra  = Wire(UInt(1))
        self.inst_type        = Wire(UInt(SUB_CHANNEL_NUM))
        v_type_lst            = []

        for chnl in range(0,SUB_CHANNEL_NUM+1):
            setattr(self, f'v_type_{chnl}', Wire(UInt(1)))
            type_chnl = getattr(self, f'v_type_{chnl}')
            empty_ena = EmptyWhen()
            empty_ena.when(Equal(self.data[chnl*16+1:chnl*16], UInt(2,3))).then(UInt(1,1)).otherwise(UInt(1,0))
            type_chnl += empty_ena
            v_type_lst.append(type_chnl)

        v_type_lst.reverse()
        self.inst_type += Combine(*(v_type_lst[1:]))
        self.inst_type_extra += type_chnl

        ###########################################################################
        # Case Decoder
        ###########################################################################
        v_dec_inst_lst      = []
        v_dec_ena_lst       = []
        v_dec_vld_lst       = []
        v_dec_pc_add_lst    = []
        v_dec_pc_lst        = []

        case_last_lst       = []
        case_last_sel_lst   = []
        
        for chnl in range(0,SUB_CHANNEL_NUM):
            print('Output Channel %s' % chnl)

            setattr(self, f'v_dec_inst_{chnl}', Wire(UInt(32)))
            setattr(self, f'v_dec_ena_{chnl}', Wire(UInt(1)))
            setattr(self, f'v_dec_vld_{chnl}', Wire(UInt(1)))
            setattr(self, f'v_dec_pc_add_{chnl}', Wire(UInt(32)))
 
            comb            = generate_comb(SUB_CHANNEL_NUM)
            case_inst_lst   = [ [] for i in range(SUB_CHANNEL_NUM) ]
            case_ena_lst    = [ [] for i in range(SUB_CHANNEL_NUM) ]
            case_vld_lst    = [ [] for i in range(SUB_CHANNEL_NUM) ]
            case_pc_add_lst = [ [] for i in range(SUB_CHANNEL_NUM) ]
            case_sel_lst    = []

            inst_case = getattr(self, f'v_dec_inst_{chnl}')
            ena_case  = getattr(self, f'v_dec_ena_{chnl}')
            vld_case  = getattr(self, f'v_dec_vld_{chnl}')
            pc_case   = getattr(self, f'v_dec_pc_add_{chnl}')
            v_dec_inst_lst.append(inst_case)
            v_dec_ena_lst.append(ena_case)
            v_dec_vld_lst.append(vld_case)
            v_dec_pc_add_lst.append(pc_case)

            for i in comb:
                i.reverse()
                mask_res  = get_mask(i)
                start_ptr = find_nth_non_zero(mask_res,chnl+1)
                result    = 0

                inst_is_32   = mask_res[start_ptr] if start_ptr is not None else 0
                sum_before_i = sum(mask_res[:start_ptr])
                sum_i        = sum_before_i + inst_is_32

                for j, num in enumerate(i):         result |= (1 if num == 2 else 0) << j
                if start_ptr is not None:           result = result & (2**(SUB_CHANNEL_NUM)-1)
                
                if start_ptr == None:                                                       pass
                elif start_ptr > (SUB_CHANNEL_NUM-1):                                       pass
                elif start_ptr == (SUB_CHANNEL_NUM-1) and mask_res[start_ptr] == 2:
                    if result not in case_sel_lst:
                        case_sel_lst.append(result)
                        # for instruction 
                        if inst_is_32 == 2:     case_inst_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.data[16*sum_before_i + 16*inst_is_32 - 1 : 16*sum_before_i]))
                        else:                   case_inst_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), Combine(UInt(16,0), self.data[16*sum_before_i + 16*inst_is_32 - 1 : 16*sum_before_i])))
                        # for instruction enable 
                        case_ena_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.v_ena[sum_before_i]))
                        # for instruction high 16 bit valid
                        case_vld_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.v_vld[sum_before_i+inst_is_32-1]))
                        # for instruction pc add 
                        case_pc_add_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), UInt(32, sum_i*2)))
                    # for use last
                    if 'first' in type:
                        if result not in case_last_sel_lst and sum_i == SUB_CHANNEL_NUM+1:
                            case_last_sel_lst.append(result)
                            case_last_lst.append((UInt(SUB_CHANNEL_NUM, result), UInt(1,1)))
                    elif 'second_half' in type:
                        if result not in case_last_sel_lst and sum_i == SUB_CHANNEL_NUM:
                            case_last_sel_lst.append(result)
                            case_last_lst.append((UInt(SUB_CHANNEL_NUM, result), UInt(1,1)))

                else:
                    if result not in case_sel_lst:
                        case_sel_lst.append(result)
                        # for instruction 
                        if inst_is_32 == 2:     case_inst_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.data[16*sum_before_i + 16*inst_is_32 - 1 : 16*sum_before_i]))
                        else:                   case_inst_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), Combine(UInt(16,0), self.data[16*sum_before_i + 16*inst_is_32 - 1 : 16*sum_before_i])))
                        # for instruction enable 
                        case_ena_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.v_ena[sum_before_i])) 
                        # for instruction high 16 bit valid
                        case_vld_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), self.v_vld[sum_before_i+inst_is_32-1]))
                        # for instruction pc add 
                        case_pc_add_lst[chnl].append((UInt(SUB_CHANNEL_NUM, result), UInt(32, sum_i*2)))
                    # for use last
                    if 'first' in type:
                        if result not in case_last_sel_lst and sum_i == SUB_CHANNEL_NUM+1:
                            case_last_sel_lst.append(result)
                            case_last_lst.append((UInt(SUB_CHANNEL_NUM, result), UInt(1,1)))
                    elif 'second_half' in type:
                        if result not in case_last_sel_lst and sum_i == SUB_CHANNEL_NUM:
                            case_last_sel_lst.append(result)
                            case_last_lst.append((UInt(SUB_CHANNEL_NUM, result), UInt(1,1)))


            inst_case   += Case(self.inst_type, case_inst_lst[chnl], UInt(32,0))
            ena_case    += Case(self.inst_type, case_ena_lst[chnl], UInt(1,0))
            vld_case    += Case(self.inst_type, case_vld_lst[chnl], UInt(1,0))
            pc_case     += Case(self.inst_type, case_pc_add_lst[chnl], UInt(32,0))

        v_dec_inst_lst.reverse()
        v_dec_ena_lst.reverse()
        v_dec_vld_lst.reverse()
        self.v_dec_inst += Combine(*v_dec_inst_lst)
        self.v_dec_ena  += Combine(*v_dec_ena_lst)
        self.v_dec_vld  += Combine(*v_dec_vld_lst)

        if 'first' in type:     self.need_last_buf += And(SelfOr(And(self.v_dec_ena, BitXor(self.v_dec_vld, self.v_dec_ena))), Not(SelfAnd(self.v_vld)))
        
        if "first" in type or 'second_half' in type:    self.use_last_w += Case(self.inst_type, case_last_lst, UInt(1,0))

        if "first" in type:    
            self.use_last += self.use_last_w
        elif 'second_half' in type:
            self.use_last += when(self.use_last_w).then(self.v_vld[SUB_CHANNEL_NUM]).otherwise(UInt(1,0))
        else:
            self.use_last += SelfOr(And(self.v_dec_ena, BitXor(self.v_dec_vld, self.v_dec_ena)))

        ###########################################################################
        # Generate next pc
        ###########################################################################
        for chnl in range(0,SUB_CHANNEL_NUM):
            setattr(self, f'v_dec_pc_{chnl}', Wire(UInt(33)))
            dec_pc = getattr(self, f'v_dec_pc_{chnl}')
            dec_pc += Add(self.pred_pc, v_dec_pc_add_lst[chnl])
            v_dec_pc_lst.append(dec_pc[31:0])

        v_dec_pc_lst.reverse()
        self.v_dec_nxt_pc += Combine(*v_dec_pc_lst)
        self.v_dec_pc += Combine(*(v_dec_pc_lst[1:]), self.pred_pc)