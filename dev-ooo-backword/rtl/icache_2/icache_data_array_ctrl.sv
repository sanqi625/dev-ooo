module icache_data_array_ctrl 
    import toy_pack::*;
    (
    input  logic                                        clk                                     ,
    input  logic                                        rst_n                                   ,
    input  mshr_entry_t                                 vv_mshr_entry_array_msg[MSHR_ENTRY_NUM-1:0],

    output logic                                        dataram_rd_rdy                          ,
    input  logic                                        dataramA_rd_vld                         , 
    input  logic                                        dataramA_rd_way                         ,
    input  logic  [ICACHE_INDEX_WIDTH-1         :0]     dataramA_rd_index                       ,
    input  logic  [ICACHE_REQ_TXNID_WIDTH-1     :0]     dataramA_rd_txnid                       ,
    input  logic                                        dataramB_rd_vld                         , 
    input  logic                                        dataramB_rd_way                         ,
    input  logic  [ICACHE_INDEX_WIDTH-1         :0]     dataramB_rd_index                       ,
    input  logic  [ICACHE_REQ_TXNID_WIDTH-1     :0]     dataramB_rd_txnid                       ,
    input  logic                                        downstream_rxdat_vld                    ,
    output logic                                        downstream_rxdat_rdy                    ,
    input  downstream_rxdat_t                           downstream_rxdat_pld                    ,  //downstream_rxdat_pld 
    output logic [MSHR_ENTRY_INDEX_WIDTH        :0]     linefill_ack_entry_idx                  ,
    output logic                                        linefillA_done                          ,
    output logic                                        linefillB_done                          ,
    output logic [ICACHE_UPSTREAM_DATA_WIDTH-1  :0]     upstream_txdat_data                     ,
    output logic                                        upstream_txdat_vld                      ,
    output logic [ICACHE_REQ_TXNID_WIDTH-1      :0]     upstream_txdat_txnid                    ,

    output logic [ICACHE_INDEX_WIDTH             :0]    A_data_array_addr                       ,
    output logic [ICACHE_INDEX_WIDTH             :0]    B_data_array_addr                       ,
    input  logic [ICACHE_DATA_WIDTH/2-1          :0]    A_data_array_dout                       ,
    input  logic [ICACHE_DATA_WIDTH/2-1          :0]    B_data_array_dout                       ,
    output logic [ICACHE_DATA_WIDTH/2-1          :0]    A_data_array_din                        ,
    output logic [ICACHE_DATA_WIDTH/2-1          :0]    B_data_array_din                        ,
    output logic                                        A_data_array_wr_en                      ,   
    output logic                                        B_data_array_wr_en                      ,
    output logic                                        mem_en                                   

    );


    //logic       [ICACHE_INDEX_WIDTH             :0]     A_data_array_addr                       ;
    //logic       [ICACHE_INDEX_WIDTH             :0]     B_data_array_addr                       ;
    //logic       [ICACHE_DATA_WIDTH/2-1          :0]     A_data_array_dout                       ;
    //logic       [ICACHE_DATA_WIDTH/2-1          :0]     B_data_array_dout                       ;
    //logic       [ICACHE_DATA_WIDTH/2-1          :0]     A_data_array_din                        ;
    //logic       [ICACHE_DATA_WIDTH/2-1          :0]     B_data_array_din                        ;
    //logic                                               mem_en                                  ; 
    //logic                                               A_data_array_wr_en                      ;   
    //logic                                               B_data_array_wr_en                      ;

    logic       [MSHR_ENTRY_INDEX_WIDTH-1       :0]     downstream_rxdat_entry_idx              ;
    logic       [ICACHE_DATA_WIDTH-1            :0]     linefill_data                           ;
    logic       [ICACHE_REQ_TXNID_WIDTH-1       :0]     linefill_done_txnid                     ;
    logic       [ICACHE_REQ_TXNID_WIDTH-1       :0]     dataram_rd_txnid_out                    ;
    logic                                               dout_vld                                ;
    logic                                               uptxdat_en                              ; 
    logic                                               linefill_done                           ;
    logic                                               linefill_data_vld                       ;
    logic       [ICACHE_INDEX_WIDTH           :0]       linefill_wr_addr                        ;
    logic                                               flag;
    assign flag = (dataramA_rd_index !== dataramB_rd_index);

    assign uptxdat_en                  = downstream_rxdat_pld.downstream_rxdat_opcode == UPSTREAM_OPCODE         ;
    assign mem_en                      = (dataramA_rd_vld && dataram_rd_rdy) | linefill_done    ;
    assign downstream_rxdat_entry_idx  = downstream_rxdat_pld.entry_idx                         ;
    assign dataram_rd_rdy              = (linefill_done == 1'b0)                                ;
    
    //always_ff@(posedge clk or negedge rst_n) begin
    //    if(!rst_n)                      downstream_rxdat_rdy     <= 1'b0;
    //    else if(downstream_rxdat_vld )  downstream_rxdat_rdy     <= 1'b1;
    //    else                            downstream_rxdat_rdy     <= 1'b0;
    //end
    always_comb begin
        downstream_rxdat_rdy     = 1'b0;
        if(downstream_rxdat_vld )  downstream_rxdat_rdy     = 1'b1;
    end

    assign linefill_done          = downstream_rxdat_vld && downstream_rxdat_rdy;
    assign linefillA_done         = linefill_done && (downstream_rxdat_pld.lineA==1'b1) ;
    assign linefillB_done         = (linefill_done && (downstream_rxdat_pld.lineA==1'b0) ) ||(linefillA_done && vv_mshr_entry_array_msg[downstream_rxdat_entry_idx].align==1'b1);
    assign linefill_ack_entry_idx = downstream_rxdat_pld.entry_idx;
    
    always_ff @(posedge clk or negedge rst_n)begin   
        if(~rst_n)begin
            linefill_data_vld <= 1'b0;
            linefill_data     <= 'b0;
        end
        else if(linefill_done)begin
            linefill_data_vld <= 1'b1;
            linefill_data     <= downstream_rxdat_pld.downstream_rxdat_data;
        end
        else begin
            linefill_data_vld <= 1'b0;
            linefill_data     <= 'b0;
        end
    end
    
    assign B_data_array_din      = downstream_rxdat_pld.downstream_rxdat_data[ICACHE_DATA_WIDTH/2-1:0];
    assign A_data_array_din      = downstream_rxdat_pld.downstream_rxdat_data[ICACHE_DATA_WIDTH-1:ICACHE_DATA_WIDTH/2];
    assign A_data_array_wr_en    = linefill_done;
    assign B_data_array_wr_en    = linefill_done;

    assign linefill_wr_addr  = downstream_rxdat_pld.lineA ? {vv_mshr_entry_array_msg[downstream_rxdat_entry_idx].pld.pldA.addr.index,vv_mshr_entry_array_msg[downstream_rxdat_entry_idx].dest_wayA}
                                                          : {vv_mshr_entry_array_msg[downstream_rxdat_entry_idx].pld.pldB.addr.index,vv_mshr_entry_array_msg[downstream_rxdat_entry_idx].dest_wayB};
    assign A_data_array_addr = linefill_done ? linefill_wr_addr  : {dataramA_rd_index,dataramA_rd_way};
    assign B_data_array_addr = linefill_done ? linefill_wr_addr  : {dataramB_rd_index,dataramB_rd_way};

    
    always_ff@(posedge clk)begin
        dataram_rd_txnid_out <= dataramA_rd_txnid;
    end
    always_ff@(posedge clk or negedge rst_n) begin
        if(!rst_n)                                  dout_vld <= 1'b0  ;   
        else if(dataramA_rd_vld && dataram_rd_rdy)  dout_vld <= 1'b1  ;
        else                                        dout_vld <= 1'b0  ;
    end

    always_ff@(posedge clk ) begin
        if(linefill_done)begin
            linefill_done_txnid <= downstream_rxdat_pld.downstream_rxdat_txnid;
        end
    end

    //toy_mem_model_bit #(
    //    .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1  ),
    //    .DATA_WIDTH(ICACHE_DATA_WIDTH/2      ) //64bit
    //)u_icache_data_arrayA_0 (
    //    .clk        (clk                  ),
    //    .en         (mem_en               ),    
    //    .wr_en      (A_data_array_wr_en   ),
    //    .addr       (A_data_array_addr    ),
    //    .rd_data    (A_data_array_dout[127:0]    ),
    //    .wr_data    (A_data_array_din[127:0]     )
    //);
//
    //toy_mem_model_bit #(
    //    .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1  ),
    //    .DATA_WIDTH(ICACHE_DATA_WIDTH/2      )//64bit
    //) u_icache_data_arrayB_0 (
    //    .clk        (clk                  ),
    //    .en         (mem_en               ),    
    //    .wr_en      (B_data_array_wr_en   ),
    //    .addr       (B_data_array_addr    ),
    //    .rd_data    (B_data_array_dout[127:0]    ),
    //    .wr_data    (B_data_array_din[127:0]     )
    //);
    

    logic flag_vld;
    always_ff@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            flag_vld <= 1'b0;
        end
        else begin
            flag_vld <= flag;
        end
    end
    assign upstream_txdat_data     = flag_vld ? {B_data_array_dout, A_data_array_dout} : {A_data_array_dout, B_data_array_dout}   ;
    assign upstream_txdat_txnid    = dataram_rd_txnid_out                      ;
    assign upstream_txdat_vld      = dout_vld                                  ;        


endmodule





        

