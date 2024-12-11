module toy_physicial_regfile_entry
    import toy_pack::*; 
#(
    parameter   int unsigned PHY_REG_ID    = 95,
    parameter   int unsigned MODE          = 0  //0-INT 1-FP
)
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    output logic                                reg_phy_rdy             ,
    output logic  [FORWARD_NUM-1       :0]      reg_phy_rdy_oh          ,
    output logic  [EU_NUM_WIDTH-1      :0]      reg_phy_forward_id      ,
    // backup rf
    input  logic                                phy_release_comb_en     , // comb commit same arch rf
    input  logic                                phy_release_en          , // commit release phy rf 
    input  logic                                phy_ref_en              , // commit enable ref

    input  logic                                cancel_edge_en          ,

    input  logic                                allocate_en             ,

    output logic                                entry_idle              ,
    
    input  logic                                wr_en_forward           ,
    input  logic  [EU_NUM_WIDTH-1      :0]      wr_forward_id           ,
    input  logic                                wr_en                                       
    

);
    
    //##############################################
    // logic
    //############################################## 
    logic                           entry_backup_ref        ;
    
    assign reg_phy_rdy          = |reg_phy_rdy_oh;
    //##############################################
    // entry logic
    //############################################## 
    generate 
        if((PHY_REG_ID==0) && (MODE==0))begin //generate int 0
            assign entry_idle           = 1'b0;
            assign entry_backup_ref     = 1'b1;
            assign reg_phy_rdy_oh       = {{(FORWARD_NUM-1){1'b0}},1'b1};
            assign reg_phy_forward_id   = 0;
        end
        else begin // generate 0-31 reg
            // 0-31 idle = 0 ,32-95 idle = 1
            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    entry_idle <= (PHY_REG_ID>=ARCH_ENTRY_NUM);
                end
                else if(phy_release_en | phy_release_comb_en)begin
                    entry_idle <= 1'b1;
                end
                else if(cancel_edge_en & ~entry_backup_ref & ~phy_ref_en)begin
                    entry_idle <= 1'b1;
                end
                else if(allocate_en)begin
                    entry_idle <= 1'b0;
                end
            end
            // back up 
            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    entry_backup_ref <= (PHY_REG_ID<ARCH_ENTRY_NUM);
                end
                else if(phy_release_en | phy_release_comb_en)begin
                    entry_backup_ref <= 1'b0;
                end
                else if(phy_ref_en)begin
                    entry_backup_ref <= 1'b1;
                end
            end      
            // forward id 

            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    reg_phy_forward_id <= 0;
                end
                else if(wr_en_forward)begin
                    reg_phy_forward_id <= wr_forward_id;
                end
            end      

            // commit
            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    reg_phy_rdy_oh <= {{(FORWARD_NUM-1){1'b0}},1'b1};
                end
                else if(cancel_edge_en & ~entry_backup_ref & ~phy_ref_en)begin
                    reg_phy_rdy_oh <= {{(FORWARD_NUM-1){1'b0}},1'b1};
                end
                else if(wr_en_forward)begin
                    reg_phy_rdy_oh <= {1'b1,{(FORWARD_NUM-1){1'b0}}};
                end
                else if(wr_en)begin
                    reg_phy_rdy_oh <= {{(FORWARD_NUM-1){1'b0}},1'b1};
                end
                else if(|reg_phy_rdy_oh && ~reg_phy_rdy_oh[0])begin
                    reg_phy_rdy_oh <= {1'b0,reg_phy_rdy_oh[FORWARD_NUM-1:1]};
                end
                else if(allocate_en)begin
                    reg_phy_rdy_oh <= {(FORWARD_NUM){1'b0}};
                end
            end
        end
    endgenerate

    

endmodule