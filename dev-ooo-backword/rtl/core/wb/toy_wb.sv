module toy_wb
    import toy_pack::*;
(
    input  logic                                clk                         ,
    input  logic                                rst_n                       ,
    input  logic [2                     :0]     v_lsu_reg_wr_en             ,
    input  logic [2                     :0]     v_lsu_reg_wr_forward_en     ,
    input  logic [2                     :0]     v_lsu_fp_reg_wr_en          , 
    input  logic [2                     :0]     v_lsu_fp_reg_wr_forward_en  , 
    input  logic [REG_WIDTH-1           :0]     v_lsu_reg_val               [2                  :0],
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_lsu_reg_index             [2                  :0],
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_lsu_reg_forward_index     [2                  :0],

    input  logic [INST_ALU_NUM-1        :0]     v_alu_reg_wr_en             ,
    input  logic [INST_ALU_NUM-1        :0]     v_alu_reg_wr_forward_en     ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_alu_reg_index             [INST_ALU_NUM-1     :0],
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_alu_reg_forward_index     [INST_ALU_NUM-1     :0],
    input  logic [REG_WIDTH-1           :0]     v_alu_reg_val               [INST_ALU_NUM-1     :0],

    input  logic [PHY_REG_ID_WIDTH-1    :0]     mext_reg_index              ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     mext_reg_forward_index      ,
    input  logic                                mext_reg_wr_en              ,
    input  logic                                mext_reg_wr_forward_en      ,
    input  logic [REG_WIDTH-1           :0]     mext_reg_val                ,

    input  logic [PHY_REG_ID_WIDTH-1    :0]     float_reg_index             ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     float_reg_forward_index     ,
    input  logic                                float_reg_wr_en             ,
    input  logic                                float_reg_wr_forward_en     ,
    input  logic                                float_fp_reg_wr_en          ,
    input  logic                                float_fp_reg_wr_forward_en  ,
    input  logic [REG_WIDTH-1           :0]     float_reg_val               ,

    input  logic [PHY_REG_ID_WIDTH-1    :0]     csr_reg_index               ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     csr_reg_forward_index       ,
    input  logic                                csr_reg_wr_en               ,
    input  logic                                csr_reg_wr_forward_en       ,
    input  logic [REG_WIDTH-1           :0]     csr_reg_val                 ,
    // forward data
    output logic [REG_WIDTH-1           :0]     v_forward_data              [EU_NUM-1           :0],

    // wr back status
    output logic [EU_NUM-1              :0]     v_int_wr_en                 ,
    output logic [EU_NUM-1              :0]     v_fp_wr_en                  ,
    output logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_index              [EU_NUM-1           :0],
    output logic [REG_WIDTH-1           :0]     v_wr_reg_data               [EU_NUM-1           :0],

    // wr back forward status
    output logic [EU_NUM-1              :0]     v_int_wr_forward_en         ,
    output logic [EU_NUM-1              :0]     v_fp_wr_forward_en          ,
    output logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_forward_index      [EU_NUM-1           :0]
   
    
    );



    //##############################################
    // wr back normal
    //############################################## 
    assign v_int_wr_en = {v_lsu_reg_wr_en[2],v_lsu_reg_wr_en[1],v_lsu_reg_wr_en[0],float_reg_wr_en,csr_reg_wr_en,mext_reg_wr_en,v_alu_reg_wr_en};
    assign v_fp_wr_en  = {v_lsu_fp_reg_wr_en[2],v_lsu_fp_reg_wr_en[1],v_lsu_fp_reg_wr_en[0],float_fp_reg_wr_en,6'b0};

    assign v_wr_reg_index[9] =  v_lsu_reg_index[2];
    assign v_wr_reg_index[8] =  v_lsu_reg_index[1];
    assign v_wr_reg_index[7] =  v_lsu_reg_index[0];
    assign v_wr_reg_index[6] =  float_reg_index;
    assign v_wr_reg_index[5] =  csr_reg_index;
    assign v_wr_reg_index[4] =  mext_reg_index;
    assign v_wr_reg_index[3] =  v_alu_reg_index[3];
    assign v_wr_reg_index[2] =  v_alu_reg_index[2];
    assign v_wr_reg_index[1] =  v_alu_reg_index[1];
    assign v_wr_reg_index[0] =  v_alu_reg_index[0];

    assign v_wr_reg_data[9] =  v_lsu_reg_val[2];
    assign v_wr_reg_data[8] =  v_lsu_reg_val[1];
    assign v_wr_reg_data[7] =  v_lsu_reg_val[0];
    assign v_wr_reg_data[6] =  float_reg_val;
    assign v_wr_reg_data[5] =  csr_reg_val;
    assign v_wr_reg_data[4] =  mext_reg_val;
    assign v_wr_reg_data[3] =  v_alu_reg_val[3];
    assign v_wr_reg_data[2] =  v_alu_reg_val[2];
    assign v_wr_reg_data[1] =  v_alu_reg_val[1];
    assign v_wr_reg_data[0] =  v_alu_reg_val[0];
    //##############################################
    // wr back forward status 
    //############################################## 
    assign v_int_wr_forward_en = {v_lsu_reg_wr_forward_en[2],v_lsu_reg_wr_forward_en[1],v_lsu_reg_wr_forward_en[0],float_reg_wr_forward_en,csr_reg_wr_forward_en,mext_reg_wr_forward_en,v_alu_reg_wr_forward_en};
    assign v_fp_wr_forward_en  = {v_lsu_fp_reg_wr_forward_en[2],v_lsu_fp_reg_wr_forward_en[1],v_lsu_fp_reg_wr_forward_en[0],float_fp_reg_wr_forward_en,6'b0};
    assign v_wr_reg_forward_index[9] =  v_lsu_reg_forward_index[2];
    assign v_wr_reg_forward_index[8] =  v_lsu_reg_forward_index[1];
    assign v_wr_reg_forward_index[7] =  v_lsu_reg_forward_index[0];
    assign v_wr_reg_forward_index[6] =  float_reg_forward_index;
    assign v_wr_reg_forward_index[5] =  csr_reg_forward_index;
    assign v_wr_reg_forward_index[4] =  mext_reg_forward_index;
    assign v_wr_reg_forward_index[3] =  v_alu_reg_forward_index[3];
    assign v_wr_reg_forward_index[2] =  v_alu_reg_forward_index[2];
    assign v_wr_reg_forward_index[1] =  v_alu_reg_forward_index[1];
    assign v_wr_reg_forward_index[0] =  v_alu_reg_forward_index[0];
    //##############################################
    // wr back forward data
    //############################################## 
    toy_forward_data u_toy_forward_data(
        .clk            (clk           ),
        .rst_n          (rst_n         ),
        .v_wr_reg_data  (v_wr_reg_data ),
        .v_forward_data (v_forward_data)
    );

endmodule