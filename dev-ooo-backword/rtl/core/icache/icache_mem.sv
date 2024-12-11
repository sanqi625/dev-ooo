module icache_mem 
    import toy_pack::*;
    (
        input  logic                                clk             ,
        input  logic                                rst_n           ,
        input  logic                                tagram_en       ,
        input  logic                                tag_array0_wr_en,
        input  logic [ICACHE_INDEX_WIDTH-1      :0] tag_array0_addr ,
        input  logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_array0_din  ,
        output logic [ICACHE_TAG_RAM_WIDTH-1    :0] tag_array0_dout ,

        input  logic                                dataram_en      ,
        input  logic                                data_array_wr_en,
        input  logic [ICACHE_INDEX_WIDTH        :0] data_array_addr ,

        input  logic [ICACHE_DATA_WIDTH/2-1     :0] data_array0_din ,
        output logic [ICACHE_DATA_WIDTH/2-1     :0] data_array0_dout,

        input  logic [ICACHE_DATA_WIDTH/2-1     :0] data_array1_din ,
        output logic [ICACHE_DATA_WIDTH/2-1     :0] data_array1_dout
    );

    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH   ),
        .DATA_WIDTH(ICACHE_TAG_RAM_WIDTH )
    ) u_icache_tag_array0(
        .clk        (clk                 ),
        .en         (tagram_en           ),
        .wr_en      (tag_array0_wr_en    ),
        .addr       (tag_array0_addr     ),
        .rd_data    (tag_array0_dout     ),
        .wr_data    (tag_array0_din      )
    );

    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1  ),
        .DATA_WIDTH(ICACHE_DATA_WIDTH/2   )
    )u_icache_data_array0 (
        .clk        (clk                  ),
        .en         (dataram_en           ),    
        .wr_en      (data_array_wr_en     ),
        .addr       (data_array_addr      ),
        .rd_data    (data_array0_dout     ),
        .wr_data    (data_array0_din      )
    );

    //256bit cacheline[511:256]
    toy_mem_model_bit #(
        .ADDR_WIDTH(ICACHE_INDEX_WIDTH+1  ),
        .DATA_WIDTH(ICACHE_DATA_WIDTH/2   )
    ) u_icache_data_array1 (
        .clk        (clk                  ),
        .en         (dataram_en           ),    
        .wr_en      (data_array_wr_en     ),
        .addr       (data_array_addr      ),
        .rd_data    (data_array1_dout     ),
        .wr_data    (data_array1_din      )
    );

endmodule

