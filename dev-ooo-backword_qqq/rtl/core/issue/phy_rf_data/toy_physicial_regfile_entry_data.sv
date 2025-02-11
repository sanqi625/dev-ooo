module toy_physicial_regfile_entry_data
    import toy_pack::*; 
#(
    parameter   int unsigned PHY_REG_ID    = 95,
    parameter   int unsigned MODE          = 0  //0-INT 1-FP
)
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    input  logic                                wr_en                   ,                         
    input  logic   [REG_WIDTH-1         :0]     wr_reg_data             ,
    
    output logic   [REG_WIDTH-1         :0]     reg_phy_data            

);
    
    //##############################################
    // entry logic
    //############################################## 
    generate 
        if((PHY_REG_ID==0) && (MODE==0))begin //generate int 0
            assign reg_phy_data    =  {REG_WIDTH{1'b0}};
        end
        else begin 
            // data
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    reg_phy_data <= {REG_WIDTH{1'b0}};
                end
                else if(wr_en)begin
                    reg_phy_data <= wr_reg_data;
                end
            end
        end
    endgenerate

    

endmodule