//author zhangchi
//2015/12/2
`define ENABLE_HPS

module soc_blinking_led(

    input         CLOCK_50,
    input  [3:0]  KEY,
    output [9:0]  LEDR,

`ifdef ENABLE_HPS
      ///////// HPS /////////
     // inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N

`endif /*ENABLE_HPS*/

);


blinking_led unit(
	 .CLOCK_50(CLOCK_50),
    .KEY(KEY),
    .LED(LEDR),
	 
	 .hps_memory_mem_a(HPS_DDR3_ADDR),
    .hps_memory_mem_ba(HPS_DDR3_BA),
    .hps_memory_mem_ck(HPS_DDR3_CK_P),
    .hps_memory_mem_ck_n(HPS_DDR3_CK_N),
    .hps_memory_mem_cke(HPS_DDR3_CKE),
    .hps_memory_mem_cs_n(HPS_DDR3_CS_N),
    .hps_memory_mem_ras_n(HPS_DDR3_RAS_N),
    .hps_memory_mem_cas_n(HPS_DDR3_CAS_N),
    .hps_memory_mem_we_n(HPS_DDR3_WE_N),
    .hps_memory_mem_reset_n(HPS_DDR3_RESET_N),
    .hps_memory_mem_dq(HPS_DDR3_DQ),
    .hps_memory_mem_dqs(HPS_DDR3_DQS_P),
    .hps_memory_mem_dqs_n(HPS_DDR3_DQS_N),
    .hps_memory_mem_odt(HPS_DDR3_ODT),
    .hps_memory_mem_dm(HPS_DDR3_DM),
    .hps_memory_oct_rzqin(HPS_DDR3_RZQ)
);

endmodule
