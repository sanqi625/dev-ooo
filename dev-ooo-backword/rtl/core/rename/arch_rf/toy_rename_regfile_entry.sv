module toy_rename_regfile_entry
    import toy_pack::*;
#(
    parameter   int unsigned ARCH_REG_ID    = 31 ,
    parameter   int unsigned MODE           = 0
)
(
    input  logic                                clk                  ,
    input  logic                                rst_n                ,

    input  logic    [PHY_REG_ID_WIDTH-1  :0]    reg_rd_allocate_id   ,
    input  logic                                reg_rd_en            , 
    
    input  logic                                cancel_edge_en                                   ,
    input  logic    [PHY_REG_ID_WIDTH-1  :0]    reg_backup_phy_id                                ,           
    output logic    [PHY_REG_ID_WIDTH-1  :0]    reg_phy_id           

);

    generate if((MODE == 0) && (ARCH_REG_ID==0))begin
        assign reg_phy_id = ARCH_REG_ID;
    end
    else begin
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                reg_phy_id <= ARCH_REG_ID;
            end
            else if(cancel_edge_en)begin
                reg_phy_id <= reg_backup_phy_id;
            end
            else if(reg_rd_en)begin
                reg_phy_id <= reg_rd_allocate_id;
            end
        end
    end
    endgenerate









endmodule