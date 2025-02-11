module toy_backup_rename_regfile_entry
    import toy_pack::*;
#(
    parameter   int unsigned ARCH_REG_ID    = 31 ,
    parameter   int unsigned MODE           = 0
)
(
    input  logic                                    clk                  ,
    input  logic                                    rst_n                ,

    input  logic                                    commit_en            , 
    input  logic    [PHY_REG_ID_WIDTH-1     :0]     commit_phy_index     ,
    
    output logic    [PHY_REG_ID_WIDTH-1     :0]     reg_phy_id            //rel entry

);
 
    //==============================================
    // update arch reg file
    //==============================================
    generate if((MODE == 0) && (ARCH_REG_ID==0))begin
        assign reg_phy_id = ARCH_REG_ID;
    end
    else begin
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                reg_phy_id <= ARCH_REG_ID;
            end
            else if(commit_en)begin
                reg_phy_id <= commit_phy_index;
            end
        end
    end
    endgenerate


endmodule