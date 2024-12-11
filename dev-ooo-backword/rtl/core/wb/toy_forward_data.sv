module toy_forward_data
    import toy_pack::*;
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,
    // wr back data
    input  logic [REG_WIDTH-1           :0]     v_wr_reg_data               [EU_NUM-1           :0],

    output logic [REG_WIDTH-1           :0]     v_forward_data              [EU_NUM-1           :0]
    );



    //##############################################
    // forward need imporve todo
    //############################################## 
    generate
        for(genvar i=0;i<EU_NUM;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_forward_data[i] <= 0;
                end
                else begin
                    v_forward_data[i] <= v_wr_reg_data[i] ;
                    
                end
            end
        end
    endgenerate

endmodule