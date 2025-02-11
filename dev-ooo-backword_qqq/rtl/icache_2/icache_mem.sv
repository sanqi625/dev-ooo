module icache_mem 
    import toy_pack::*;
    (
        input  logic                                clk             ,
        input  logic                                rst_n           ,
        input  logic                                tagram_en       ,
        input  logic                                tag_arrayA_wr_en,
        input  logic [ICACHE_INDEX_WIDTH-1      :0] tag_arrayA_addr ,
        input  logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_arrayA_din  ,
        output logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_arrayA_dout ,
        input  logic                                tag_arrayB_wr_en,
        input  logic [ICACHE_INDEX_WIDTH-1      :0] tag_arrayB_addr ,
        input  logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_arrayB_din  ,
        output logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_arrayB_dout ,


        input  logic                                dataram_en      ,
        input  logic                                A_data_array_wr_en,
        input  logic [ICACHE_INDEX_WIDTH        :0] A_data_array_addr ,
        input  logic                                B_data_array_wr_en,
        input  logic [ICACHE_INDEX_WIDTH        :0] B_data_array_addr ,

        input  logic [ICACHE_DATA_WIDTH/2-1     :0] A_data_array_din ,
        output logic [ICACHE_DATA_WIDTH/2-1     :0] A_data_array_dout,
        input  logic [ICACHE_DATA_WIDTH/2-1     :0] B_data_array_din ,
        output logic [ICACHE_DATA_WIDTH/2-1     :0] B_data_array_dout

        //input  logic [ICACHE_DATA_WIDTH/2-1     :0] data_array1_din ,
        //output logic [ICACHE_DATA_WIDTH/2-1     :0] data_array1_dout
    );

    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH   ),
        .DATA_WIDTH(ICACHE_TAG_RAM_WIDTH )
    ) u_icache_tag_array0(
        .clk        (clk                 ),
        .en         (tagram_en           ),
        .wr_en      (tag_arrayA_wr_en    ),
        .addr       (tag_arrayA_addr     ),
        .rd_data    (tag_arrayA_dout     ),
        .wr_data    (tag_arrayA_din      )
    );
    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH   ),
        .DATA_WIDTH(ICACHE_TAG_RAM_WIDTH )
    ) u_icache_tag_array1(
        .clk        (clk                  ),
        .en         (tagram_en            ),
        .wr_en      (tag_arrayB_wr_en    ),
        .addr       (tag_arrayB_addr     ),
        .rd_data    (tag_arrayB_dout     ),
        .wr_data    (tag_arrayB_din      )
    );

    
    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1        ),
        .DATA_WIDTH(ICACHE_DATA_WIDTH/2         ) 
    )u_icache_data_arrayA_0 (
        .clk        (clk                        ),
        .en         (dataram_en                 ),    
        .wr_en      (A_data_array_wr_en         ),
        .addr       (A_data_array_addr          ),
        .rd_data    (A_data_array_dout[ICACHE_DATA_WIDTH/2-1:0]   ),
        .wr_data    (A_data_array_din[ICACHE_DATA_WIDTH/2-1:0]    )
    );
    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1        ),
        .DATA_WIDTH(ICACHE_DATA_WIDTH/2         )
    ) u_icache_data_arrayB_0 (
        .clk        (clk                        ),
        .en         (dataram_en                 ),    
        .wr_en      (B_data_array_wr_en         ),
        .addr       (B_data_array_addr          ),
        .rd_data    (B_data_array_dout[ICACHE_DATA_WIDTH/2-1:0]   ),
        .wr_data    (B_data_array_din[ICACHE_DATA_WIDTH/2-1:0]    )
    );

    

endmodule

