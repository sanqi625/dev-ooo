module toy_physicial_regfile_data
    import toy_pack::*; 
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    input  logic   [EU_NUM-1            :0]     v_int_wr_en             ,
    input  logic   [EU_NUM-1            :0]     v_fp_wr_en              ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_wr_reg_index          [EU_NUM-1   :0],
    input  logic   [REG_WIDTH-1         :0]     v_wr_reg_data           [EU_NUM-1   :0],

    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs1_index     [INST_DECODE_NUM-1:0] ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs2_index     [INST_DECODE_NUM-1:0] ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs3_index     [INST_DECODE_NUM-1:0] ,
    input  logic   [INST_DECODE_NUM-1   :0]     v_phy_int_rs1_en        ,
    input  logic   [INST_DECODE_NUM-1   :0]     v_phy_int_rs2_en        ,

    output logic   [REG_WIDTH-1         :0]     v_reg_rs1_data          [INST_DECODE_NUM-1:0] ,
    output logic   [REG_WIDTH-1         :0]     v_reg_rs2_data          [INST_DECODE_NUM-1:0] ,
    output logic   [REG_WIDTH-1         :0]     v_reg_rs3_data          [INST_DECODE_NUM-1:0] 


);
    //##############################################
    // logic  
    //############################################## 
    logic [PHY_REG_NUM-1        :0] v_int_bitmap_wr_en      ;
    logic [PHY_REG_NUM-1        :0] v_fp_bitmap_wr_en       ;
    logic [REG_WIDTH-1          :0] v_int_rs1_data          [INST_DECODE_NUM-1  :0];
    logic [REG_WIDTH-1          :0] v_int_rs2_data          [INST_DECODE_NUM-1  :0];
    logic [REG_WIDTH-1          :0] v_fp_rs1_data           [INST_DECODE_NUM-1  :0];
    logic [REG_WIDTH-1          :0] v_fp_rs2_data           [INST_DECODE_NUM-1  :0];
    logic [PHY_REG_NUM-1        :0] vv_int_bitmap_wr_en     [EU_NUM-1           :0];
    logic [PHY_REG_NUM-1        :0] vv_fp_bitmap_wr_en      [EU_NUM-1           :0];
    logic [REG_WIDTH-1          :0] v_int_bitmap_wr_data    [PHY_REG_NUM-1      :0];
    logic [REG_WIDTH-1          :0] v_fp_bitmap_wr_data     [PHY_REG_NUM-1      :0];
    logic [REG_WIDTH-1          :0] v_int_phy_data          [PHY_REG_NUM-1      :0];
    logic [REG_WIDTH-1          :0] v_fp_phy_data           [PHY_REG_NUM-1      :0];
    //##############################################
    // pre allocate 
    //############################################## 

    assign v_int_bitmap_wr_en = vv_int_bitmap_wr_en[0] | vv_int_bitmap_wr_en[1] | vv_int_bitmap_wr_en[2] | vv_int_bitmap_wr_en[3] | 
                                vv_int_bitmap_wr_en[4] | vv_int_bitmap_wr_en[5] | vv_int_bitmap_wr_en[6] | vv_int_bitmap_wr_en[7] | 
                                vv_int_bitmap_wr_en[8] | vv_int_bitmap_wr_en[9];
    assign v_fp_bitmap_wr_en  = vv_fp_bitmap_wr_en[0]  | vv_fp_bitmap_wr_en[1]  | vv_fp_bitmap_wr_en[2]  | vv_fp_bitmap_wr_en[3]  | 
                                vv_fp_bitmap_wr_en[4]  | vv_fp_bitmap_wr_en[5]  | vv_fp_bitmap_wr_en[6]  | vv_fp_bitmap_wr_en[7]  | 
                                vv_fp_bitmap_wr_en[8]  | vv_fp_bitmap_wr_en[9];


    generate
        for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin : PHY_REGFILE_
            assign v_int_rs1_data[i] = v_int_phy_data[v_phy_reg_rs1_index[i]];
            assign v_int_rs2_data[i] = v_int_phy_data[v_phy_reg_rs2_index[i]];
            assign v_fp_rs1_data[i]  = v_fp_phy_data[v_phy_reg_rs1_index[i]];
            assign v_fp_rs2_data[i]  = v_fp_phy_data[v_phy_reg_rs2_index[i]];

            assign v_reg_rs3_data[i]  = v_fp_phy_data[v_phy_reg_rs3_index[i]];
            assign v_reg_rs1_data[i] = v_phy_int_rs1_en[i] ? v_int_rs1_data[i] : v_fp_rs1_data[i];
            assign v_reg_rs2_data[i] = v_phy_int_rs2_en[i] ? v_int_rs2_data[i] : v_fp_rs2_data[i];
        end

        for(genvar j=0;j<PHY_REG_NUM;j=j+1)begin
            for(genvar i=0;i<EU_NUM;i=i+1)begin
                assign vv_int_bitmap_wr_en[i][j] = (j==v_wr_reg_index[i]) && v_int_wr_en[i];
                assign vv_fp_bitmap_wr_en[i][j] = (j==v_wr_reg_index[i]) && v_fp_wr_en[i];
            end
            assign v_int_bitmap_wr_data[j] =  vv_int_bitmap_wr_en[9][j] ? v_wr_reg_data[9]:
                                              vv_int_bitmap_wr_en[8][j] ? v_wr_reg_data[8]:
                                              vv_int_bitmap_wr_en[7][j] ? v_wr_reg_data[7]:
                                              vv_int_bitmap_wr_en[6][j] ? v_wr_reg_data[6]:
                                              vv_int_bitmap_wr_en[5][j] ? v_wr_reg_data[5]:
                                              vv_int_bitmap_wr_en[4][j] ? v_wr_reg_data[4]:     
                                              vv_int_bitmap_wr_en[3][j] ? v_wr_reg_data[3]:
                                              vv_int_bitmap_wr_en[2][j] ? v_wr_reg_data[2]:
                                              vv_int_bitmap_wr_en[1][j] ? v_wr_reg_data[1]:
                                              v_wr_reg_data[0];

            assign v_fp_bitmap_wr_data[j] =   vv_fp_bitmap_wr_en[9][j] ? v_wr_reg_data[9]:
                                              vv_fp_bitmap_wr_en[8][j] ? v_wr_reg_data[8]:
                                              vv_fp_bitmap_wr_en[7][j] ? v_wr_reg_data[7]:
                                              vv_fp_bitmap_wr_en[6][j] ? v_wr_reg_data[6]:
                                              vv_fp_bitmap_wr_en[5][j] ? v_wr_reg_data[5]:
                                              vv_fp_bitmap_wr_en[4][j] ? v_wr_reg_data[4]:     
                                              vv_fp_bitmap_wr_en[3][j] ? v_wr_reg_data[3]:
                                              vv_fp_bitmap_wr_en[2][j] ? v_wr_reg_data[2]:
                                              vv_fp_bitmap_wr_en[1][j] ? v_wr_reg_data[1]:
                                              v_wr_reg_data[0];
        
        end

    endgenerate


    //##############################################
    // entry
    //############################################## 
    generate
        for(genvar j=0;j<PHY_REG_NUM;j=j+1)begin
            toy_physicial_regfile_entry_data #(
                .PHY_REG_ID         (j                          ),
                .MODE               (0                          )
            )
            u_int_physicial_regfile_entry_data(
                .clk                (clk                        ),
                .rst_n              (rst_n                      ),
                .wr_reg_data        (v_int_bitmap_wr_data[j]    ),
                .wr_en              (v_int_bitmap_wr_en[j]      ),
                .reg_phy_data       (v_int_phy_data[j]          )
            );
            toy_physicial_regfile_entry_data #(
                .PHY_REG_ID         (j                          ),
                .MODE               (1                          )
            )
            u_fp_physicial_regfile_entry_data(
                .clk                (clk                        ),
                .rst_n              (rst_n                      ),
                .wr_reg_data        (v_fp_bitmap_wr_data[j]     ),
                .wr_en              (v_fp_bitmap_wr_en[j]       ),
                .reg_phy_data       (v_fp_phy_data[j]           )
            );

        end
    endgenerate

endmodule