-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    fpga_0_RS232_Uart_RX_pin : in std_logic;
    fpga_0_RS232_Uart_TX_pin : out std_logic;
    fpga_0_ORGate_1_Res_pin : out std_logic;
    fpga_0_ORGate_1_Res_1_pin : out std_logic;
    fpga_0_ORGate_1_Res_2_pin : out std_logic;
    sys_clk_pin : in std_logic;
    sys_rst_pin : in std_logic;
    led_pin : out std_logic
  );
end system;

architecture STRUCTURE of system is

  component ppc405_0_wrapper is
    port (
      C405CPMCORESLEEPREQ : out std_logic;
      C405CPMMSRCE : out std_logic;
      C405CPMMSREE : out std_logic;
      C405CPMTIMERIRQ : out std_logic;
      C405CPMTIMERRESETREQ : out std_logic;
      C405XXXMACHINECHECK : out std_logic;
      CPMC405CLOCK : in std_logic;
      CPMC405CORECLKINACTIVE : in std_logic;
      CPMC405CPUCLKEN : in std_logic;
      CPMC405JTAGCLKEN : in std_logic;
      CPMC405TIMERCLKEN : in std_logic;
      CPMC405TIMERTICK : in std_logic;
      MCBCPUCLKEN : in std_logic;
      MCBTIMEREN : in std_logic;
      MCPPCRST : in std_logic;
      DCRCLK : in std_logic;
      C405RSTCHIPRESETREQ : out std_logic;
      C405RSTCORERESETREQ : out std_logic;
      C405RSTSYSRESETREQ : out std_logic;
      RSTC405RESETCHIP : in std_logic;
      RSTC405RESETCORE : in std_logic;
      RSTC405RESETSYS : in std_logic;
      IPLB0_PLB_Clk : in std_logic;
      IPLB0_PLB_Rst : in std_logic;
      IPLB0_PLB_MBusy : in std_logic;
      IPLB0_PLB_MRdErr : in std_logic;
      IPLB0_PLB_MWrErr : in std_logic;
      IPLB0_PLB_MWrBTerm : in std_logic;
      IPLB0_PLB_MWrDAck : in std_logic;
      IPLB0_PLB_MAddrAck : in std_logic;
      IPLB0_PLB_MRdBTerm : in std_logic;
      IPLB0_PLB_MRdDAck : in std_logic;
      IPLB0_PLB_MRdDBus : in std_logic_vector(0 to 63);
      IPLB0_PLB_MRearbitrate : in std_logic;
      IPLB0_PLB_MSSize : in std_logic_vector(0 to 1);
      IPLB0_PLB_MTimeout : in std_logic;
      IPLB0_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB0_M_ABus : out std_logic_vector(0 to 31);
      IPLB0_M_BE : out std_logic_vector(0 to 7);
      IPLB0_M_MSize : out std_logic_vector(0 to 1);
      IPLB0_M_rdBurst : out std_logic;
      IPLB0_M_request : out std_logic;
      IPLB0_M_RNW : out std_logic;
      IPLB0_M_size : out std_logic_vector(0 to 3);
      IPLB0_M_wrBurst : out std_logic;
      IPLB0_M_wrDBus : out std_logic_vector(0 to 63);
      IPLB0_M_abort : out std_logic;
      IPLB0_M_UABus : out std_logic_vector(0 to 31);
      IPLB0_M_busLock : out std_logic;
      IPLB0_M_lockErr : out std_logic;
      IPLB0_M_priority : out std_logic_vector(0 to 1);
      IPLB0_M_type : out std_logic_vector(0 to 2);
      IPLB0_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB0_PLB_Clk : in std_logic;
      DPLB0_PLB_Rst : in std_logic;
      DPLB0_PLB_MBusy : in std_logic;
      DPLB0_PLB_MRdErr : in std_logic;
      DPLB0_PLB_MWrErr : in std_logic;
      DPLB0_PLB_MWrBTerm : in std_logic;
      DPLB0_PLB_MWrDAck : in std_logic;
      DPLB0_PLB_MAddrAck : in std_logic;
      DPLB0_PLB_MRdBTerm : in std_logic;
      DPLB0_PLB_MRdDAck : in std_logic;
      DPLB0_PLB_MRdDBus : in std_logic_vector(0 to 63);
      DPLB0_PLB_MRearbitrate : in std_logic;
      DPLB0_PLB_MSSize : in std_logic_vector(0 to 1);
      DPLB0_PLB_MTimeout : in std_logic;
      DPLB0_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB0_M_ABus : out std_logic_vector(0 to 31);
      DPLB0_M_BE : out std_logic_vector(0 to 7);
      DPLB0_M_MSize : out std_logic_vector(0 to 1);
      DPLB0_M_rdBurst : out std_logic;
      DPLB0_M_request : out std_logic;
      DPLB0_M_RNW : out std_logic;
      DPLB0_M_size : out std_logic_vector(0 to 3);
      DPLB0_M_wrBurst : out std_logic;
      DPLB0_M_wrDBus : out std_logic_vector(0 to 63);
      DPLB0_M_abort : out std_logic;
      DPLB0_M_UABus : out std_logic_vector(0 to 31);
      DPLB0_M_busLock : out std_logic;
      DPLB0_M_lockErr : out std_logic;
      DPLB0_M_priority : out std_logic_vector(0 to 1);
      DPLB0_M_type : out std_logic_vector(0 to 2);
      DPLB0_M_TAttribute : out std_logic_vector(0 to 15);
      IPLB1_PLB_Clk : in std_logic;
      IPLB1_PLB_Rst : in std_logic;
      IPLB1_PLB_MBusy : in std_logic;
      IPLB1_PLB_MRdErr : in std_logic;
      IPLB1_PLB_MWrErr : in std_logic;
      IPLB1_PLB_MWrBTerm : in std_logic;
      IPLB1_PLB_MWrDAck : in std_logic;
      IPLB1_PLB_MAddrAck : in std_logic;
      IPLB1_PLB_MRdBTerm : in std_logic;
      IPLB1_PLB_MRdDAck : in std_logic;
      IPLB1_PLB_MRdDBus : in std_logic_vector(0 to 63);
      IPLB1_PLB_MRearbitrate : in std_logic;
      IPLB1_PLB_MSSize : in std_logic_vector(0 to 1);
      IPLB1_PLB_MTimeout : in std_logic;
      IPLB1_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB1_M_ABus : out std_logic_vector(0 to 31);
      IPLB1_M_BE : out std_logic_vector(0 to 7);
      IPLB1_M_MSize : out std_logic_vector(0 to 1);
      IPLB1_M_rdBurst : out std_logic;
      IPLB1_M_request : out std_logic;
      IPLB1_M_RNW : out std_logic;
      IPLB1_M_size : out std_logic_vector(0 to 3);
      IPLB1_M_wrBurst : out std_logic;
      IPLB1_M_wrDBus : out std_logic_vector(0 to 63);
      IPLB1_M_abort : out std_logic;
      IPLB1_M_UABus : out std_logic_vector(0 to 31);
      IPLB1_M_busLock : out std_logic;
      IPLB1_M_lockErr : out std_logic;
      IPLB1_M_priority : out std_logic_vector(0 to 1);
      IPLB1_M_type : out std_logic_vector(0 to 2);
      IPLB1_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB1_PLB_Clk : in std_logic;
      DPLB1_PLB_Rst : in std_logic;
      DPLB1_PLB_MBusy : in std_logic;
      DPLB1_PLB_MRdErr : in std_logic;
      DPLB1_PLB_MWrErr : in std_logic;
      DPLB1_PLB_MWrBTerm : in std_logic;
      DPLB1_PLB_MWrDAck : in std_logic;
      DPLB1_PLB_MAddrAck : in std_logic;
      DPLB1_PLB_MRdBTerm : in std_logic;
      DPLB1_PLB_MRdDAck : in std_logic;
      DPLB1_PLB_MRdDBus : in std_logic_vector(0 to 63);
      DPLB1_PLB_MRearbitrate : in std_logic;
      DPLB1_PLB_MSSize : in std_logic_vector(0 to 1);
      DPLB1_PLB_MTimeout : in std_logic;
      DPLB1_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB1_M_ABus : out std_logic_vector(0 to 31);
      DPLB1_M_BE : out std_logic_vector(0 to 7);
      DPLB1_M_MSize : out std_logic_vector(0 to 1);
      DPLB1_M_rdBurst : out std_logic;
      DPLB1_M_request : out std_logic;
      DPLB1_M_RNW : out std_logic;
      DPLB1_M_size : out std_logic_vector(0 to 3);
      DPLB1_M_wrBurst : out std_logic;
      DPLB1_M_wrDBus : out std_logic_vector(0 to 63);
      DPLB1_M_abort : out std_logic;
      DPLB1_M_UABus : out std_logic_vector(0 to 31);
      DPLB1_M_busLock : out std_logic;
      DPLB1_M_lockErr : out std_logic;
      DPLB1_M_priority : out std_logic_vector(0 to 1);
      DPLB1_M_type : out std_logic_vector(0 to 2);
      DPLB1_M_TAttribute : out std_logic_vector(0 to 15);
      BRAMDSOCMCLK : in std_logic;
      BRAMDSOCMRDDBUS : in std_logic_vector(0 to 31);
      DSARCVALUE : in std_logic_vector(0 to 7);
      DSCNTLVALUE : in std_logic_vector(0 to 7);
      DSOCMBRAMABUS : out std_logic_vector(8 to 29);
      DSOCMBRAMBYTEWRITE : out std_logic_vector(0 to 3);
      DSOCMBRAMEN : out std_logic;
      DSOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      DSOCMBUSY : out std_logic;
      BRAMISOCMCLK : in std_logic;
      BRAMISOCMRDDBUS : in std_logic_vector(0 to 63);
      ISARCVALUE : in std_logic_vector(0 to 7);
      ISCNTLVALUE : in std_logic_vector(0 to 7);
      ISOCMBRAMEN : out std_logic;
      ISOCMBRAMEVENWRITEEN : out std_logic;
      ISOCMBRAMODDWRITEEN : out std_logic;
      ISOCMBRAMRDABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      C405DCRABUS : out std_logic_vector(0 to 9);
      C405DCRDBUSOUT : out std_logic_vector(0 to 31);
      C405DCRREAD : out std_logic;
      C405DCRWRITE : out std_logic;
      DCRC405ACK : in std_logic;
      DCRC405DBUSIN : in std_logic_vector(0 to 31);
      EICC405CRITINPUTIRQ : in std_logic;
      EICC405EXTINPUTIRQ : in std_logic;
      C405JTGCAPTUREDR : out std_logic;
      C405JTGEXTEST : out std_logic;
      C405JTGPGMOUT : out std_logic;
      C405JTGSHIFTDR : out std_logic;
      C405JTGTDO : out std_logic;
      C405JTGTDOEN : out std_logic;
      C405JTGUPDATEDR : out std_logic;
      MCBJTAGEN : in std_logic;
      JTGC405BNDSCANTDO : in std_logic;
      JTGC405TCK : in std_logic;
      JTGC405TDI : in std_logic;
      JTGC405TMS : in std_logic;
      JTGC405TRSTNEG : in std_logic;
      C405DBGMSRWE : out std_logic;
      C405DBGSTOPACK : out std_logic;
      C405DBGWBCOMPLETE : out std_logic;
      C405DBGWBFULL : out std_logic;
      C405DBGWBIAR : out std_logic_vector(0 to 29);
      DBGC405DEBUGHALT : in std_logic;
      DBGC405DEBUGHALTNEG : in std_logic;
      DBGC405EXTBUSHOLDACK : in std_logic;
      DBGC405UNCONDDEBUGEVENT : in std_logic;
      C405TRCCYCLE : out std_logic;
      C405TRCEVENEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCODDEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCTRACESTATUS : out std_logic_vector(0 to 3);
      C405TRCTRIGGEREVENTOUT : out std_logic;
      C405TRCTRIGGEREVENTTYPE : out std_logic_vector(0 to 10);
      TRCC405TRACEDISABLE : in std_logic;
      TRCC405TRIGGEREVENTIN : in std_logic
    );
  end component;

  component jtagppc_cntlr_0_wrapper is
    port (
      TRSTNEG : in std_logic;
      HALTNEG0 : in std_logic;
      DBGC405DEBUGHALT0 : out std_logic;
      HALTNEG1 : in std_logic;
      DBGC405DEBUGHALT1 : out std_logic;
      C405JTGTDO0 : in std_logic;
      C405JTGTDOEN0 : in std_logic;
      JTGC405TCK0 : out std_logic;
      JTGC405TDI0 : out std_logic;
      JTGC405TMS0 : out std_logic;
      JTGC405TRSTNEG0 : out std_logic;
      C405JTGTDO1 : in std_logic;
      C405JTGTDOEN1 : in std_logic;
      JTGC405TCK1 : out std_logic;
      JTGC405TDI1 : out std_logic;
      JTGC405TMS1 : out std_logic;
      JTGC405TRSTNEG1 : out std_logic
    );
  end component;

  component plb0_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 2);
      MPLB_Rst : out std_logic_vector(0 to 1);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_UABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 15);
      M_RNW : in std_logic_vector(0 to 1);
      M_abort : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_TAttribute : in std_logic_vector(0 to 31);
      M_lockErr : in std_logic_vector(0 to 1);
      M_MSize : in std_logic_vector(0 to 3);
      M_priority : in std_logic_vector(0 to 3);
      M_rdBurst : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_size : in std_logic_vector(0 to 7);
      M_type : in std_logic_vector(0 to 5);
      M_wrBurst : in std_logic_vector(0 to 1);
      M_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : in std_logic_vector(0 to 2);
      Sl_MRdErr : in std_logic_vector(0 to 5);
      Sl_MWrErr : in std_logic_vector(0 to 5);
      Sl_MBusy : in std_logic_vector(0 to 5);
      Sl_rdBTerm : in std_logic_vector(0 to 2);
      Sl_rdComp : in std_logic_vector(0 to 2);
      Sl_rdDAck : in std_logic_vector(0 to 2);
      Sl_rdDBus : in std_logic_vector(0 to 191);
      Sl_rdWdAddr : in std_logic_vector(0 to 11);
      Sl_rearbitrate : in std_logic_vector(0 to 2);
      Sl_SSize : in std_logic_vector(0 to 5);
      Sl_wait : in std_logic_vector(0 to 2);
      Sl_wrBTerm : in std_logic_vector(0 to 2);
      Sl_wrComp : in std_logic_vector(0 to 2);
      Sl_wrDAck : in std_logic_vector(0 to 2);
      Sl_MIRQ : in std_logic_vector(0 to 5);
      PLB_MIRQ : out std_logic_vector(0 to 1);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 1);
      PLB_MTimeout : out std_logic_vector(0 to 1);
      PLB_MBusy : out std_logic_vector(0 to 1);
      PLB_MRdErr : out std_logic_vector(0 to 1);
      PLB_MWrErr : out std_logic_vector(0 to 1);
      PLB_MRdBTerm : out std_logic_vector(0 to 1);
      PLB_MRdDAck : out std_logic_vector(0 to 1);
      PLB_MRdDBus : out std_logic_vector(0 to 127);
      PLB_MRdWdAddr : out std_logic_vector(0 to 7);
      PLB_MRearbitrate : out std_logic_vector(0 to 1);
      PLB_MWrBTerm : out std_logic_vector(0 to 1);
      PLB_MWrDAck : out std_logic_vector(0 to 1);
      PLB_MSSize : out std_logic_vector(0 to 3);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 2);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic_vector(0 to 2);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 1);
      PLB_SMWrErr : out std_logic_vector(0 to 1);
      PLB_SMBusy : out std_logic_vector(0 to 1);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component xps_bram_if_cntlr_1_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      BRAM_Rst : out std_logic;
      BRAM_Clk : out std_logic;
      BRAM_EN : out std_logic;
      BRAM_WEN : out std_logic_vector(0 to 7);
      BRAM_Addr : out std_logic_vector(0 to 31);
      BRAM_Din : in std_logic_vector(0 to 63);
      BRAM_Dout : out std_logic_vector(0 to 63)
    );
  end component;

  component plb_bram_if_cntlr_1_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 7);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 63);
      BRAM_Dout_A : in std_logic_vector(0 to 63);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 7);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 63);
      BRAM_Dout_B : in std_logic_vector(0 to 63)
    );
  end component;

  component rs232_uart_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      RX : in std_logic;
      TX : out std_logic;
      Interrupt : out std_logic
    );
  end component;

  component xps_bram_if_cntlr_2_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      BRAM_Rst : out std_logic;
      BRAM_Clk : out std_logic;
      BRAM_EN : out std_logic;
      BRAM_WEN : out std_logic_vector(0 to 3);
      BRAM_Addr : out std_logic_vector(0 to 31);
      BRAM_Din : in std_logic_vector(0 to 31);
      BRAM_Dout : out std_logic_vector(0 to 31)
    );
  end component;

  component xps_bram_if_cntlr_2_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 3);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 31);
      BRAM_Dout_A : in std_logic_vector(0 to 31);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component orgate_1_wrapper is
    port (
      Op1 : in std_logic_vector(0 to 1);
      Res : out std_logic
    );
  end component;

  component clock_generator_0_wrapper is
    port (
      CLKIN : in std_logic;
      CLKFBIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBOUT : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

  component proc_sys_reset_0_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      MB_Debug_Sys_Rst : in std_logic;
      Core_Reset_Req_0 : in std_logic;
      Chip_Reset_Req_0 : in std_logic;
      System_Reset_Req_0 : in std_logic;
      Core_Reset_Req_1 : in std_logic;
      Chip_Reset_Req_1 : in std_logic;
      System_Reset_Req_1 : in std_logic;
      Dcm_locked : in std_logic;
      RstcPPCresetcore_0 : out std_logic;
      RstcPPCresetchip_0 : out std_logic;
      RstcPPCresetsys_0 : out std_logic;
      RstcPPCresetcore_1 : out std_logic;
      RstcPPCresetchip_1 : out std_logic;
      RstcPPCresetsys_1 : out std_logic;
      MB_Reset : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0)
    );
  end component;

  component blinker_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 2);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 7);
      Sl_MWrErr : out std_logic_vector(0 to 7);
      Sl_MRdErr : out std_logic_vector(0 to 7);
      Sl_MIRQ : out std_logic_vector(0 to 7);
      led : out std_logic;
      user_clk : in std_logic;
      user_reset : in std_logic
    );
  end component;

  -- Internal signals

  signal Dcm_all_locked : std_logic;
  signal dcm_clk_s : std_logic;
  signal fpga_0_ORGate_1_Res : std_logic;
  signal fpga_0_RS232_Uart_RX : std_logic;
  signal fpga_0_RS232_Uart_TX : std_logic;
  signal jtagppc_cntlr_0_0_C405JTGTDO : std_logic;
  signal jtagppc_cntlr_0_0_C405JTGTDOEN : std_logic;
  signal jtagppc_cntlr_0_0_JTGC405TCK : std_logic;
  signal jtagppc_cntlr_0_0_JTGC405TDI : std_logic;
  signal jtagppc_cntlr_0_0_JTGC405TMS : std_logic;
  signal jtagppc_cntlr_0_0_JTGC405TRSTNEG : std_logic;
  signal led_blinker : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd8 : std_logic_vector(0 to 7);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd16 : std_logic_vector(0 to 15);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_gnd64 : std_logic_vector(0 to 63);
  signal net_gnd128 : std_logic_vector(0 to 127);
  signal net_vcc0 : std_logic;
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 1);
  signal plb0_MPLB_Rst : std_logic_vector(0 to 1);
  signal plb0_M_ABus : std_logic_vector(0 to 63);
  signal plb0_M_BE : std_logic_vector(0 to 15);
  signal plb0_M_MSize : std_logic_vector(0 to 3);
  signal plb0_M_RNW : std_logic_vector(0 to 1);
  signal plb0_M_TAttribute : std_logic_vector(0 to 31);
  signal plb0_M_UABus : std_logic_vector(0 to 63);
  signal plb0_M_abort : std_logic_vector(0 to 1);
  signal plb0_M_busLock : std_logic_vector(0 to 1);
  signal plb0_M_lockErr : std_logic_vector(0 to 1);
  signal plb0_M_priority : std_logic_vector(0 to 3);
  signal plb0_M_rdBurst : std_logic_vector(0 to 1);
  signal plb0_M_request : std_logic_vector(0 to 1);
  signal plb0_M_size : std_logic_vector(0 to 7);
  signal plb0_M_type : std_logic_vector(0 to 5);
  signal plb0_M_wrBurst : std_logic_vector(0 to 1);
  signal plb0_M_wrDBus : std_logic_vector(0 to 127);
  signal plb0_PLB_ABus : std_logic_vector(0 to 31);
  signal plb0_PLB_BE : std_logic_vector(0 to 7);
  signal plb0_PLB_MAddrAck : std_logic_vector(0 to 1);
  signal plb0_PLB_MBusy : std_logic_vector(0 to 1);
  signal plb0_PLB_MRdBTerm : std_logic_vector(0 to 1);
  signal plb0_PLB_MRdDAck : std_logic_vector(0 to 1);
  signal plb0_PLB_MRdDBus : std_logic_vector(0 to 127);
  signal plb0_PLB_MRdErr : std_logic_vector(0 to 1);
  signal plb0_PLB_MRdWdAddr : std_logic_vector(0 to 7);
  signal plb0_PLB_MRearbitrate : std_logic_vector(0 to 1);
  signal plb0_PLB_MSSize : std_logic_vector(0 to 3);
  signal plb0_PLB_MSize : std_logic_vector(0 to 1);
  signal plb0_PLB_MTimeout : std_logic_vector(0 to 1);
  signal plb0_PLB_MWrBTerm : std_logic_vector(0 to 1);
  signal plb0_PLB_MWrDAck : std_logic_vector(0 to 1);
  signal plb0_PLB_MWrErr : std_logic_vector(0 to 1);
  signal plb0_PLB_PAValid : std_logic;
  signal plb0_PLB_RNW : std_logic;
  signal plb0_PLB_SAValid : std_logic;
  signal plb0_PLB_TAttribute : std_logic_vector(0 to 15);
  signal plb0_PLB_UABus : std_logic_vector(0 to 31);
  signal plb0_PLB_abort : std_logic;
  signal plb0_PLB_busLock : std_logic;
  signal plb0_PLB_lockErr : std_logic;
  signal plb0_PLB_masterID : std_logic_vector(0 to 0);
  signal plb0_PLB_rdBurst : std_logic;
  signal plb0_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal plb0_PLB_rdPendReq : std_logic;
  signal plb0_PLB_rdPrim : std_logic_vector(0 to 2);
  signal plb0_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb0_PLB_size : std_logic_vector(0 to 3);
  signal plb0_PLB_type : std_logic_vector(0 to 2);
  signal plb0_PLB_wrBurst : std_logic;
  signal plb0_PLB_wrDBus : std_logic_vector(0 to 63);
  signal plb0_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal plb0_PLB_wrPendReq : std_logic;
  signal plb0_PLB_wrPrim : std_logic_vector(0 to 2);
  signal plb0_SPLB_Rst : std_logic_vector(0 to 2);
  signal plb0_Sl_MBusy : std_logic_vector(0 to 5);
  signal plb0_Sl_MIRQ : std_logic_vector(0 to 5);
  signal plb0_Sl_MRdErr : std_logic_vector(0 to 5);
  signal plb0_Sl_MWrErr : std_logic_vector(0 to 5);
  signal plb0_Sl_SSize : std_logic_vector(0 to 5);
  signal plb0_Sl_addrAck : std_logic_vector(0 to 2);
  signal plb0_Sl_rdBTerm : std_logic_vector(0 to 2);
  signal plb0_Sl_rdComp : std_logic_vector(0 to 2);
  signal plb0_Sl_rdDAck : std_logic_vector(0 to 2);
  signal plb0_Sl_rdDBus : std_logic_vector(0 to 191);
  signal plb0_Sl_rdWdAddr : std_logic_vector(0 to 11);
  signal plb0_Sl_rearbitrate : std_logic_vector(0 to 2);
  signal plb0_Sl_wait : std_logic_vector(0 to 2);
  signal plb0_Sl_wrBTerm : std_logic_vector(0 to 2);
  signal plb0_Sl_wrComp : std_logic_vector(0 to 2);
  signal plb0_Sl_wrDAck : std_logic_vector(0 to 2);
  signal ppc_reset_bus_Chip_Reset_Req : std_logic;
  signal ppc_reset_bus_Core_Reset_Req : std_logic;
  signal ppc_reset_bus_RstcPPCresetcore : std_logic;
  signal ppc_reset_bus_RstcPPCresetsys : std_logic;
  signal ppc_reset_bus_RstsPPCresetchip : std_logic;
  signal ppc_reset_bus_System_Reset_Req : std_logic;
  signal sys_bus_reset : std_logic_vector(0 to 0);
  signal sys_clk_s : std_logic;
  signal sys_rst_s : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_1_port_BRAM_Clk : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Din : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_Dout : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_EN : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Rst : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_WEN : std_logic_vector(0 to 7);
  signal xps_bram_if_cntlr_2_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_2_port_BRAM_Clk : std_logic;
  signal xps_bram_if_cntlr_2_port_BRAM_Din : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_2_port_BRAM_Dout : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_2_port_BRAM_EN : std_logic;
  signal xps_bram_if_cntlr_2_port_BRAM_Rst : std_logic;
  signal xps_bram_if_cntlr_2_port_BRAM_WEN : std_logic_vector(0 to 3);

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of ppc405_0_wrapper : component is "black_box";
  attribute BOX_TYPE of jtagppc_cntlr_0_wrapper : component is "black_box";
  attribute BOX_TYPE of plb0_wrapper : component is "black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_1_wrapper : component is "black_box";
  attribute BOX_TYPE of plb_bram_if_cntlr_1_bram_wrapper : component is "black_box";
  attribute BOX_TYPE of rs232_uart_wrapper : component is "black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_2_wrapper : component is "black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_2_bram_wrapper : component is "black_box";
  attribute BOX_TYPE of orgate_1_wrapper : component is "black_box";
  attribute BOX_TYPE of clock_generator_0_wrapper : component is "black_box";
  attribute BOX_TYPE of proc_sys_reset_0_wrapper : component is "black_box";
  attribute BOX_TYPE of blinker_0_wrapper : component is "black_box";

begin

  -- Internal assignments

  fpga_0_RS232_Uart_RX <= fpga_0_RS232_Uart_RX_pin;
  fpga_0_RS232_Uart_TX_pin <= fpga_0_RS232_Uart_TX;
  fpga_0_ORGate_1_Res_pin <= fpga_0_ORGate_1_Res;
  fpga_0_ORGate_1_Res_1_pin <= fpga_0_ORGate_1_Res;
  fpga_0_ORGate_1_Res_2_pin <= fpga_0_ORGate_1_Res;
  dcm_clk_s <= sys_clk_pin;
  sys_rst_s <= sys_rst_pin;
  led_pin <= led_blinker;
  pgassign1(0 to 0) <= B"0";
  pgassign2(0) <= sys_rst_s;
  pgassign2(1 to 1) <= B"0";
  net_gnd0 <= '0';
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd128(0 to 127) <= B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  net_gnd16(0 to 15) <= B"0000000000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd64(0 to 63) <= B"0000000000000000000000000000000000000000000000000000000000000000";
  net_gnd8(0 to 7) <= B"00000000";
  net_vcc0 <= '1';

  ppc405_0 : ppc405_0_wrapper
    port map (
      C405CPMCORESLEEPREQ => open,
      C405CPMMSRCE => open,
      C405CPMMSREE => open,
      C405CPMTIMERIRQ => open,
      C405CPMTIMERRESETREQ => open,
      C405XXXMACHINECHECK => open,
      CPMC405CLOCK => sys_clk_s,
      CPMC405CORECLKINACTIVE => net_gnd0,
      CPMC405CPUCLKEN => net_vcc0,
      CPMC405JTAGCLKEN => net_vcc0,
      CPMC405TIMERCLKEN => net_vcc0,
      CPMC405TIMERTICK => net_vcc0,
      MCBCPUCLKEN => net_vcc0,
      MCBTIMEREN => net_vcc0,
      MCPPCRST => net_vcc0,
      DCRCLK => net_vcc0,
      C405RSTCHIPRESETREQ => ppc_reset_bus_Chip_Reset_Req,
      C405RSTCORERESETREQ => ppc_reset_bus_Core_Reset_Req,
      C405RSTSYSRESETREQ => ppc_reset_bus_System_Reset_Req,
      RSTC405RESETCHIP => ppc_reset_bus_RstsPPCresetchip,
      RSTC405RESETCORE => ppc_reset_bus_RstcPPCresetcore,
      RSTC405RESETSYS => ppc_reset_bus_RstcPPCresetsys,
      IPLB0_PLB_Clk => sys_clk_s,
      IPLB0_PLB_Rst => plb0_MPLB_Rst(1),
      IPLB0_PLB_MBusy => plb0_PLB_MBusy(1),
      IPLB0_PLB_MRdErr => plb0_PLB_MRdErr(1),
      IPLB0_PLB_MWrErr => plb0_PLB_MWrErr(1),
      IPLB0_PLB_MWrBTerm => plb0_PLB_MWrBTerm(1),
      IPLB0_PLB_MWrDAck => plb0_PLB_MWrDAck(1),
      IPLB0_PLB_MAddrAck => plb0_PLB_MAddrAck(1),
      IPLB0_PLB_MRdBTerm => plb0_PLB_MRdBTerm(1),
      IPLB0_PLB_MRdDAck => plb0_PLB_MRdDAck(1),
      IPLB0_PLB_MRdDBus => plb0_PLB_MRdDBus(64 to 127),
      IPLB0_PLB_MRearbitrate => plb0_PLB_MRearbitrate(1),
      IPLB0_PLB_MSSize => plb0_PLB_MSSize(2 to 3),
      IPLB0_PLB_MTimeout => plb0_PLB_MTimeout(1),
      IPLB0_PLB_MRdWdAddr => plb0_PLB_MRdWdAddr(4 to 7),
      IPLB0_M_ABus => plb0_M_ABus(32 to 63),
      IPLB0_M_BE => plb0_M_BE(8 to 15),
      IPLB0_M_MSize => plb0_M_MSize(2 to 3),
      IPLB0_M_rdBurst => plb0_M_rdBurst(1),
      IPLB0_M_request => plb0_M_request(1),
      IPLB0_M_RNW => plb0_M_RNW(1),
      IPLB0_M_size => plb0_M_size(4 to 7),
      IPLB0_M_wrBurst => plb0_M_wrBurst(1),
      IPLB0_M_wrDBus => plb0_M_wrDBus(64 to 127),
      IPLB0_M_abort => plb0_M_abort(1),
      IPLB0_M_UABus => plb0_M_UABus(32 to 63),
      IPLB0_M_busLock => plb0_M_busLock(1),
      IPLB0_M_lockErr => plb0_M_lockErr(1),
      IPLB0_M_priority => plb0_M_priority(2 to 3),
      IPLB0_M_type => plb0_M_type(3 to 5),
      IPLB0_M_TAttribute => plb0_M_TAttribute(16 to 31),
      DPLB0_PLB_Clk => sys_clk_s,
      DPLB0_PLB_Rst => plb0_MPLB_Rst(0),
      DPLB0_PLB_MBusy => plb0_PLB_MBusy(0),
      DPLB0_PLB_MRdErr => plb0_PLB_MRdErr(0),
      DPLB0_PLB_MWrErr => plb0_PLB_MWrErr(0),
      DPLB0_PLB_MWrBTerm => plb0_PLB_MWrBTerm(0),
      DPLB0_PLB_MWrDAck => plb0_PLB_MWrDAck(0),
      DPLB0_PLB_MAddrAck => plb0_PLB_MAddrAck(0),
      DPLB0_PLB_MRdBTerm => plb0_PLB_MRdBTerm(0),
      DPLB0_PLB_MRdDAck => plb0_PLB_MRdDAck(0),
      DPLB0_PLB_MRdDBus => plb0_PLB_MRdDBus(0 to 63),
      DPLB0_PLB_MRearbitrate => plb0_PLB_MRearbitrate(0),
      DPLB0_PLB_MSSize => plb0_PLB_MSSize(0 to 1),
      DPLB0_PLB_MTimeout => plb0_PLB_MTimeout(0),
      DPLB0_PLB_MRdWdAddr => plb0_PLB_MRdWdAddr(0 to 3),
      DPLB0_M_ABus => plb0_M_ABus(0 to 31),
      DPLB0_M_BE => plb0_M_BE(0 to 7),
      DPLB0_M_MSize => plb0_M_MSize(0 to 1),
      DPLB0_M_rdBurst => plb0_M_rdBurst(0),
      DPLB0_M_request => plb0_M_request(0),
      DPLB0_M_RNW => plb0_M_RNW(0),
      DPLB0_M_size => plb0_M_size(0 to 3),
      DPLB0_M_wrBurst => plb0_M_wrBurst(0),
      DPLB0_M_wrDBus => plb0_M_wrDBus(0 to 63),
      DPLB0_M_abort => plb0_M_abort(0),
      DPLB0_M_UABus => plb0_M_UABus(0 to 31),
      DPLB0_M_busLock => plb0_M_busLock(0),
      DPLB0_M_lockErr => plb0_M_lockErr(0),
      DPLB0_M_priority => plb0_M_priority(0 to 1),
      DPLB0_M_type => plb0_M_type(0 to 2),
      DPLB0_M_TAttribute => plb0_M_TAttribute(0 to 15),
      IPLB1_PLB_Clk => net_gnd0,
      IPLB1_PLB_Rst => net_gnd0,
      IPLB1_PLB_MBusy => net_gnd0,
      IPLB1_PLB_MRdErr => net_gnd0,
      IPLB1_PLB_MWrErr => net_gnd0,
      IPLB1_PLB_MWrBTerm => net_gnd0,
      IPLB1_PLB_MWrDAck => net_gnd0,
      IPLB1_PLB_MAddrAck => net_gnd0,
      IPLB1_PLB_MRdBTerm => net_gnd0,
      IPLB1_PLB_MRdDAck => net_gnd0,
      IPLB1_PLB_MRdDBus => net_gnd64,
      IPLB1_PLB_MRearbitrate => net_gnd0,
      IPLB1_PLB_MSSize => net_gnd2,
      IPLB1_PLB_MTimeout => net_gnd0,
      IPLB1_PLB_MRdWdAddr => net_gnd4,
      IPLB1_M_ABus => open,
      IPLB1_M_BE => open,
      IPLB1_M_MSize => open,
      IPLB1_M_rdBurst => open,
      IPLB1_M_request => open,
      IPLB1_M_RNW => open,
      IPLB1_M_size => open,
      IPLB1_M_wrBurst => open,
      IPLB1_M_wrDBus => open,
      IPLB1_M_abort => open,
      IPLB1_M_UABus => open,
      IPLB1_M_busLock => open,
      IPLB1_M_lockErr => open,
      IPLB1_M_priority => open,
      IPLB1_M_type => open,
      IPLB1_M_TAttribute => open,
      DPLB1_PLB_Clk => net_gnd0,
      DPLB1_PLB_Rst => net_gnd0,
      DPLB1_PLB_MBusy => net_gnd0,
      DPLB1_PLB_MRdErr => net_gnd0,
      DPLB1_PLB_MWrErr => net_gnd0,
      DPLB1_PLB_MWrBTerm => net_gnd0,
      DPLB1_PLB_MWrDAck => net_gnd0,
      DPLB1_PLB_MAddrAck => net_gnd0,
      DPLB1_PLB_MRdBTerm => net_gnd0,
      DPLB1_PLB_MRdDAck => net_gnd0,
      DPLB1_PLB_MRdDBus => net_gnd64,
      DPLB1_PLB_MRearbitrate => net_gnd0,
      DPLB1_PLB_MSSize => net_gnd2,
      DPLB1_PLB_MTimeout => net_gnd0,
      DPLB1_PLB_MRdWdAddr => net_gnd4,
      DPLB1_M_ABus => open,
      DPLB1_M_BE => open,
      DPLB1_M_MSize => open,
      DPLB1_M_rdBurst => open,
      DPLB1_M_request => open,
      DPLB1_M_RNW => open,
      DPLB1_M_size => open,
      DPLB1_M_wrBurst => open,
      DPLB1_M_wrDBus => open,
      DPLB1_M_abort => open,
      DPLB1_M_UABus => open,
      DPLB1_M_busLock => open,
      DPLB1_M_lockErr => open,
      DPLB1_M_priority => open,
      DPLB1_M_type => open,
      DPLB1_M_TAttribute => open,
      BRAMDSOCMCLK => net_vcc0,
      BRAMDSOCMRDDBUS => net_gnd32,
      DSARCVALUE => net_gnd8,
      DSCNTLVALUE => net_gnd8,
      DSOCMBRAMABUS => open,
      DSOCMBRAMBYTEWRITE => open,
      DSOCMBRAMEN => open,
      DSOCMBRAMWRDBUS => open,
      DSOCMBUSY => open,
      BRAMISOCMCLK => net_vcc0,
      BRAMISOCMRDDBUS => net_gnd64,
      ISARCVALUE => net_gnd8,
      ISCNTLVALUE => net_gnd8,
      ISOCMBRAMEN => open,
      ISOCMBRAMEVENWRITEEN => open,
      ISOCMBRAMODDWRITEEN => open,
      ISOCMBRAMRDABUS => open,
      ISOCMBRAMWRABUS => open,
      ISOCMBRAMWRDBUS => open,
      C405DCRABUS => open,
      C405DCRDBUSOUT => open,
      C405DCRREAD => open,
      C405DCRWRITE => open,
      DCRC405ACK => net_gnd0,
      DCRC405DBUSIN => net_gnd32,
      EICC405CRITINPUTIRQ => net_gnd0,
      EICC405EXTINPUTIRQ => net_gnd0,
      C405JTGCAPTUREDR => open,
      C405JTGEXTEST => open,
      C405JTGPGMOUT => open,
      C405JTGSHIFTDR => open,
      C405JTGTDO => jtagppc_cntlr_0_0_C405JTGTDO,
      C405JTGTDOEN => jtagppc_cntlr_0_0_C405JTGTDOEN,
      C405JTGUPDATEDR => open,
      MCBJTAGEN => net_vcc0,
      JTGC405BNDSCANTDO => net_gnd0,
      JTGC405TCK => jtagppc_cntlr_0_0_JTGC405TCK,
      JTGC405TDI => jtagppc_cntlr_0_0_JTGC405TDI,
      JTGC405TMS => jtagppc_cntlr_0_0_JTGC405TMS,
      JTGC405TRSTNEG => jtagppc_cntlr_0_0_JTGC405TRSTNEG,
      C405DBGMSRWE => open,
      C405DBGSTOPACK => open,
      C405DBGWBCOMPLETE => open,
      C405DBGWBFULL => open,
      C405DBGWBIAR => open,
      DBGC405DEBUGHALT => net_gnd0,
      DBGC405DEBUGHALTNEG => net_vcc0,
      DBGC405EXTBUSHOLDACK => net_gnd0,
      DBGC405UNCONDDEBUGEVENT => net_gnd0,
      C405TRCCYCLE => open,
      C405TRCEVENEXECUTIONSTATUS => open,
      C405TRCODDEXECUTIONSTATUS => open,
      C405TRCTRACESTATUS => open,
      C405TRCTRIGGEREVENTOUT => open,
      C405TRCTRIGGEREVENTTYPE => open,
      TRCC405TRACEDISABLE => net_gnd0,
      TRCC405TRIGGEREVENTIN => net_gnd0
    );

  jtagppc_cntlr_0 : jtagppc_cntlr_0_wrapper
    port map (
      TRSTNEG => net_vcc0,
      HALTNEG0 => net_vcc0,
      DBGC405DEBUGHALT0 => open,
      HALTNEG1 => net_vcc0,
      DBGC405DEBUGHALT1 => open,
      C405JTGTDO0 => jtagppc_cntlr_0_0_C405JTGTDO,
      C405JTGTDOEN0 => jtagppc_cntlr_0_0_C405JTGTDOEN,
      JTGC405TCK0 => jtagppc_cntlr_0_0_JTGC405TCK,
      JTGC405TDI0 => jtagppc_cntlr_0_0_JTGC405TDI,
      JTGC405TMS0 => jtagppc_cntlr_0_0_JTGC405TMS,
      JTGC405TRSTNEG0 => jtagppc_cntlr_0_0_JTGC405TRSTNEG,
      C405JTGTDO1 => net_gnd0,
      C405JTGTDOEN1 => net_gnd0,
      JTGC405TCK1 => open,
      JTGC405TDI1 => open,
      JTGC405TMS1 => open,
      JTGC405TRSTNEG1 => open
    );

  plb0 : plb0_wrapper
    port map (
      PLB_Clk => sys_clk_s,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => open,
      SPLB_Rst => plb0_SPLB_Rst,
      MPLB_Rst => plb0_MPLB_Rst,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb0_M_ABus,
      M_UABus => plb0_M_UABus,
      M_BE => plb0_M_BE,
      M_RNW => plb0_M_RNW,
      M_abort => plb0_M_abort,
      M_busLock => plb0_M_busLock,
      M_TAttribute => plb0_M_TAttribute,
      M_lockErr => plb0_M_lockErr,
      M_MSize => plb0_M_MSize,
      M_priority => plb0_M_priority,
      M_rdBurst => plb0_M_rdBurst,
      M_request => plb0_M_request,
      M_size => plb0_M_size,
      M_type => plb0_M_type,
      M_wrBurst => plb0_M_wrBurst,
      M_wrDBus => plb0_M_wrDBus,
      Sl_addrAck => plb0_Sl_addrAck,
      Sl_MRdErr => plb0_Sl_MRdErr,
      Sl_MWrErr => plb0_Sl_MWrErr,
      Sl_MBusy => plb0_Sl_MBusy,
      Sl_rdBTerm => plb0_Sl_rdBTerm,
      Sl_rdComp => plb0_Sl_rdComp,
      Sl_rdDAck => plb0_Sl_rdDAck,
      Sl_rdDBus => plb0_Sl_rdDBus,
      Sl_rdWdAddr => plb0_Sl_rdWdAddr,
      Sl_rearbitrate => plb0_Sl_rearbitrate,
      Sl_SSize => plb0_Sl_SSize,
      Sl_wait => plb0_Sl_wait,
      Sl_wrBTerm => plb0_Sl_wrBTerm,
      Sl_wrComp => plb0_Sl_wrComp,
      Sl_wrDAck => plb0_Sl_wrDAck,
      Sl_MIRQ => plb0_Sl_MIRQ,
      PLB_MIRQ => open,
      PLB_ABus => plb0_PLB_ABus,
      PLB_UABus => plb0_PLB_UABus,
      PLB_BE => plb0_PLB_BE,
      PLB_MAddrAck => plb0_PLB_MAddrAck,
      PLB_MTimeout => plb0_PLB_MTimeout,
      PLB_MBusy => plb0_PLB_MBusy,
      PLB_MRdErr => plb0_PLB_MRdErr,
      PLB_MWrErr => plb0_PLB_MWrErr,
      PLB_MRdBTerm => plb0_PLB_MRdBTerm,
      PLB_MRdDAck => plb0_PLB_MRdDAck,
      PLB_MRdDBus => plb0_PLB_MRdDBus,
      PLB_MRdWdAddr => plb0_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb0_PLB_MRearbitrate,
      PLB_MWrBTerm => plb0_PLB_MWrBTerm,
      PLB_MWrDAck => plb0_PLB_MWrDAck,
      PLB_MSSize => plb0_PLB_MSSize,
      PLB_PAValid => plb0_PLB_PAValid,
      PLB_RNW => plb0_PLB_RNW,
      PLB_SAValid => plb0_PLB_SAValid,
      PLB_abort => plb0_PLB_abort,
      PLB_busLock => plb0_PLB_busLock,
      PLB_TAttribute => plb0_PLB_TAttribute,
      PLB_lockErr => plb0_PLB_lockErr,
      PLB_masterID => plb0_PLB_masterID(0 to 0),
      PLB_MSize => plb0_PLB_MSize,
      PLB_rdPendPri => plb0_PLB_rdPendPri,
      PLB_wrPendPri => plb0_PLB_wrPendPri,
      PLB_rdPendReq => plb0_PLB_rdPendReq,
      PLB_wrPendReq => plb0_PLB_wrPendReq,
      PLB_rdBurst => plb0_PLB_rdBurst,
      PLB_rdPrim => plb0_PLB_rdPrim,
      PLB_reqPri => plb0_PLB_reqPri,
      PLB_size => plb0_PLB_size,
      PLB_type => plb0_PLB_type,
      PLB_wrBurst => plb0_PLB_wrBurst,
      PLB_wrDBus => plb0_PLB_wrDBus,
      PLB_wrPrim => plb0_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  xps_bram_if_cntlr_1 : xps_bram_if_cntlr_1_wrapper
    port map (
      SPLB_Clk => sys_clk_s,
      SPLB_Rst => plb0_SPLB_Rst(0),
      PLB_ABus => plb0_PLB_ABus,
      PLB_UABus => plb0_PLB_UABus,
      PLB_PAValid => plb0_PLB_PAValid,
      PLB_SAValid => plb0_PLB_SAValid,
      PLB_rdPrim => plb0_PLB_rdPrim(0),
      PLB_wrPrim => plb0_PLB_wrPrim(0),
      PLB_masterID => plb0_PLB_masterID(0 to 0),
      PLB_abort => plb0_PLB_abort,
      PLB_busLock => plb0_PLB_busLock,
      PLB_RNW => plb0_PLB_RNW,
      PLB_BE => plb0_PLB_BE,
      PLB_MSize => plb0_PLB_MSize,
      PLB_size => plb0_PLB_size,
      PLB_type => plb0_PLB_type,
      PLB_lockErr => plb0_PLB_lockErr,
      PLB_wrDBus => plb0_PLB_wrDBus,
      PLB_wrBurst => plb0_PLB_wrBurst,
      PLB_rdBurst => plb0_PLB_rdBurst,
      PLB_wrPendReq => plb0_PLB_wrPendReq,
      PLB_rdPendReq => plb0_PLB_rdPendReq,
      PLB_wrPendPri => plb0_PLB_wrPendPri,
      PLB_rdPendPri => plb0_PLB_rdPendPri,
      PLB_reqPri => plb0_PLB_reqPri,
      PLB_TAttribute => plb0_PLB_TAttribute,
      Sl_addrAck => plb0_Sl_addrAck(0),
      Sl_SSize => plb0_Sl_SSize(0 to 1),
      Sl_wait => plb0_Sl_wait(0),
      Sl_rearbitrate => plb0_Sl_rearbitrate(0),
      Sl_wrDAck => plb0_Sl_wrDAck(0),
      Sl_wrComp => plb0_Sl_wrComp(0),
      Sl_wrBTerm => plb0_Sl_wrBTerm(0),
      Sl_rdDBus => plb0_Sl_rdDBus(0 to 63),
      Sl_rdWdAddr => plb0_Sl_rdWdAddr(0 to 3),
      Sl_rdDAck => plb0_Sl_rdDAck(0),
      Sl_rdComp => plb0_Sl_rdComp(0),
      Sl_rdBTerm => plb0_Sl_rdBTerm(0),
      Sl_MBusy => plb0_Sl_MBusy(0 to 1),
      Sl_MWrErr => plb0_Sl_MWrErr(0 to 1),
      Sl_MRdErr => plb0_Sl_MRdErr(0 to 1),
      Sl_MIRQ => plb0_Sl_MIRQ(0 to 1),
      BRAM_Rst => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout => xps_bram_if_cntlr_1_port_BRAM_Dout
    );

  plb_bram_if_cntlr_1_bram : plb_bram_if_cntlr_1_bram_wrapper
    port map (
      BRAM_Rst_A => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk_A => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN_A => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN_A => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr_A => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din_A => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout_A => xps_bram_if_cntlr_1_port_BRAM_Dout,
      BRAM_Rst_B => net_gnd0,
      BRAM_Clk_B => net_gnd0,
      BRAM_EN_B => net_gnd0,
      BRAM_WEN_B => net_gnd8,
      BRAM_Addr_B => net_gnd32,
      BRAM_Din_B => open,
      BRAM_Dout_B => net_gnd64
    );

  RS232_Uart : rs232_uart_wrapper
    port map (
      SPLB_Clk => sys_clk_s,
      SPLB_Rst => plb0_SPLB_Rst(1),
      PLB_ABus => plb0_PLB_ABus,
      PLB_PAValid => plb0_PLB_PAValid,
      PLB_masterID => plb0_PLB_masterID(0 to 0),
      PLB_RNW => plb0_PLB_RNW,
      PLB_BE => plb0_PLB_BE,
      PLB_size => plb0_PLB_size,
      PLB_type => plb0_PLB_type,
      PLB_wrDBus => plb0_PLB_wrDBus,
      PLB_UABus => plb0_PLB_UABus,
      PLB_SAValid => plb0_PLB_SAValid,
      PLB_rdPrim => plb0_PLB_rdPrim(1),
      PLB_wrPrim => plb0_PLB_wrPrim(1),
      PLB_abort => plb0_PLB_abort,
      PLB_busLock => plb0_PLB_busLock,
      PLB_MSize => plb0_PLB_MSize,
      PLB_lockErr => plb0_PLB_lockErr,
      PLB_wrBurst => plb0_PLB_wrBurst,
      PLB_rdBurst => plb0_PLB_rdBurst,
      PLB_wrPendReq => plb0_PLB_wrPendReq,
      PLB_rdPendReq => plb0_PLB_rdPendReq,
      PLB_wrPendPri => plb0_PLB_wrPendPri,
      PLB_rdPendPri => plb0_PLB_rdPendPri,
      PLB_reqPri => plb0_PLB_reqPri,
      PLB_TAttribute => plb0_PLB_TAttribute,
      Sl_addrAck => plb0_Sl_addrAck(1),
      Sl_SSize => plb0_Sl_SSize(2 to 3),
      Sl_wait => plb0_Sl_wait(1),
      Sl_rearbitrate => plb0_Sl_rearbitrate(1),
      Sl_wrDAck => plb0_Sl_wrDAck(1),
      Sl_wrComp => plb0_Sl_wrComp(1),
      Sl_rdDBus => plb0_Sl_rdDBus(64 to 127),
      Sl_rdDAck => plb0_Sl_rdDAck(1),
      Sl_rdComp => plb0_Sl_rdComp(1),
      Sl_MBusy => plb0_Sl_MBusy(2 to 3),
      Sl_MWrErr => plb0_Sl_MWrErr(2 to 3),
      Sl_MRdErr => plb0_Sl_MRdErr(2 to 3),
      Sl_wrBTerm => plb0_Sl_wrBTerm(1),
      Sl_rdWdAddr => plb0_Sl_rdWdAddr(4 to 7),
      Sl_rdBTerm => plb0_Sl_rdBTerm(1),
      Sl_MIRQ => plb0_Sl_MIRQ(2 to 3),
      RX => fpga_0_RS232_Uart_RX,
      TX => fpga_0_RS232_Uart_TX,
      Interrupt => open
    );

  xps_bram_if_cntlr_2 : xps_bram_if_cntlr_2_wrapper
    port map (
      SPLB_Clk => sys_clk_s,
      SPLB_Rst => plb0_SPLB_Rst(2),
      PLB_ABus => plb0_PLB_ABus,
      PLB_UABus => plb0_PLB_UABus,
      PLB_PAValid => plb0_PLB_PAValid,
      PLB_SAValid => plb0_PLB_SAValid,
      PLB_rdPrim => plb0_PLB_rdPrim(2),
      PLB_wrPrim => plb0_PLB_wrPrim(2),
      PLB_masterID => plb0_PLB_masterID(0 to 0),
      PLB_abort => plb0_PLB_abort,
      PLB_busLock => plb0_PLB_busLock,
      PLB_RNW => plb0_PLB_RNW,
      PLB_BE => plb0_PLB_BE,
      PLB_MSize => plb0_PLB_MSize,
      PLB_size => plb0_PLB_size,
      PLB_type => plb0_PLB_type,
      PLB_lockErr => plb0_PLB_lockErr,
      PLB_wrDBus => plb0_PLB_wrDBus,
      PLB_wrBurst => plb0_PLB_wrBurst,
      PLB_rdBurst => plb0_PLB_rdBurst,
      PLB_wrPendReq => plb0_PLB_wrPendReq,
      PLB_rdPendReq => plb0_PLB_rdPendReq,
      PLB_wrPendPri => plb0_PLB_wrPendPri,
      PLB_rdPendPri => plb0_PLB_rdPendPri,
      PLB_reqPri => plb0_PLB_reqPri,
      PLB_TAttribute => plb0_PLB_TAttribute,
      Sl_addrAck => plb0_Sl_addrAck(2),
      Sl_SSize => plb0_Sl_SSize(4 to 5),
      Sl_wait => plb0_Sl_wait(2),
      Sl_rearbitrate => plb0_Sl_rearbitrate(2),
      Sl_wrDAck => plb0_Sl_wrDAck(2),
      Sl_wrComp => plb0_Sl_wrComp(2),
      Sl_wrBTerm => plb0_Sl_wrBTerm(2),
      Sl_rdDBus => plb0_Sl_rdDBus(128 to 191),
      Sl_rdWdAddr => plb0_Sl_rdWdAddr(8 to 11),
      Sl_rdDAck => plb0_Sl_rdDAck(2),
      Sl_rdComp => plb0_Sl_rdComp(2),
      Sl_rdBTerm => plb0_Sl_rdBTerm(2),
      Sl_MBusy => plb0_Sl_MBusy(4 to 5),
      Sl_MWrErr => plb0_Sl_MWrErr(4 to 5),
      Sl_MRdErr => plb0_Sl_MRdErr(4 to 5),
      Sl_MIRQ => plb0_Sl_MIRQ(4 to 5),
      BRAM_Rst => xps_bram_if_cntlr_2_port_BRAM_Rst,
      BRAM_Clk => xps_bram_if_cntlr_2_port_BRAM_Clk,
      BRAM_EN => xps_bram_if_cntlr_2_port_BRAM_EN,
      BRAM_WEN => xps_bram_if_cntlr_2_port_BRAM_WEN,
      BRAM_Addr => xps_bram_if_cntlr_2_port_BRAM_Addr,
      BRAM_Din => xps_bram_if_cntlr_2_port_BRAM_Din,
      BRAM_Dout => xps_bram_if_cntlr_2_port_BRAM_Dout
    );

  xps_bram_if_cntlr_2_bram : xps_bram_if_cntlr_2_bram_wrapper
    port map (
      BRAM_Rst_A => xps_bram_if_cntlr_2_port_BRAM_Rst,
      BRAM_Clk_A => xps_bram_if_cntlr_2_port_BRAM_Clk,
      BRAM_EN_A => xps_bram_if_cntlr_2_port_BRAM_EN,
      BRAM_WEN_A => xps_bram_if_cntlr_2_port_BRAM_WEN,
      BRAM_Addr_A => xps_bram_if_cntlr_2_port_BRAM_Addr,
      BRAM_Din_A => xps_bram_if_cntlr_2_port_BRAM_Din,
      BRAM_Dout_A => xps_bram_if_cntlr_2_port_BRAM_Dout,
      BRAM_Rst_B => net_gnd0,
      BRAM_Clk_B => net_gnd0,
      BRAM_EN_B => net_gnd0,
      BRAM_WEN_B => net_gnd4,
      BRAM_Addr_B => net_gnd32,
      BRAM_Din_B => open,
      BRAM_Dout_B => net_gnd32
    );

  ORGate_1 : orgate_1_wrapper
    port map (
      Op1 => pgassign2,
      Res => fpga_0_ORGate_1_Res
    );

  clock_generator_0 : clock_generator_0_wrapper
    port map (
      CLKIN => dcm_clk_s,
      CLKFBIN => net_gnd0,
      CLKOUT0 => sys_clk_s,
      CLKOUT1 => open,
      CLKOUT2 => open,
      CLKOUT3 => open,
      CLKOUT4 => open,
      CLKOUT5 => open,
      CLKOUT6 => open,
      CLKOUT7 => open,
      CLKOUT8 => open,
      CLKOUT9 => open,
      CLKOUT10 => open,
      CLKOUT11 => open,
      CLKOUT12 => open,
      CLKOUT13 => open,
      CLKOUT14 => open,
      CLKOUT15 => open,
      CLKFBOUT => open,
      RST => net_gnd0,
      LOCKED => Dcm_all_locked
    );

  proc_sys_reset_0 : proc_sys_reset_0_wrapper
    port map (
      Slowest_sync_clk => sys_clk_s,
      Ext_Reset_In => sys_rst_s,
      Aux_Reset_In => net_gnd0,
      MB_Debug_Sys_Rst => net_gnd0,
      Core_Reset_Req_0 => ppc_reset_bus_Core_Reset_Req,
      Chip_Reset_Req_0 => ppc_reset_bus_Chip_Reset_Req,
      System_Reset_Req_0 => ppc_reset_bus_System_Reset_Req,
      Core_Reset_Req_1 => net_gnd0,
      Chip_Reset_Req_1 => net_gnd0,
      System_Reset_Req_1 => net_gnd0,
      Dcm_locked => Dcm_all_locked,
      RstcPPCresetcore_0 => ppc_reset_bus_RstcPPCresetcore,
      RstcPPCresetchip_0 => ppc_reset_bus_RstsPPCresetchip,
      RstcPPCresetsys_0 => ppc_reset_bus_RstcPPCresetsys,
      RstcPPCresetcore_1 => open,
      RstcPPCresetchip_1 => open,
      RstcPPCresetsys_1 => open,
      MB_Reset => open,
      Bus_Struct_Reset => sys_bus_reset(0 to 0),
      Peripheral_Reset => open
    );

  blinker_0 : blinker_0_wrapper
    port map (
      SPLB_Clk => net_gnd0,
      SPLB_Rst => net_gnd0,
      PLB_ABus => net_gnd32,
      PLB_UABus => net_gnd32,
      PLB_PAValid => net_gnd0,
      PLB_SAValid => net_gnd0,
      PLB_rdPrim => net_gnd0,
      PLB_wrPrim => net_gnd0,
      PLB_masterID => net_gnd3,
      PLB_abort => net_gnd0,
      PLB_busLock => net_gnd0,
      PLB_RNW => net_gnd0,
      PLB_BE => net_gnd16,
      PLB_MSize => net_gnd2,
      PLB_size => net_gnd4,
      PLB_type => net_gnd3,
      PLB_lockErr => net_gnd0,
      PLB_wrDBus => net_gnd128,
      PLB_wrBurst => net_gnd0,
      PLB_rdBurst => net_gnd0,
      PLB_wrPendReq => net_gnd0,
      PLB_rdPendReq => net_gnd0,
      PLB_wrPendPri => net_gnd2,
      PLB_rdPendPri => net_gnd2,
      PLB_reqPri => net_gnd2,
      PLB_TAttribute => net_gnd16,
      Sl_addrAck => open,
      Sl_SSize => open,
      Sl_wait => open,
      Sl_rearbitrate => open,
      Sl_wrDAck => open,
      Sl_wrComp => open,
      Sl_wrBTerm => open,
      Sl_rdDBus => open,
      Sl_rdWdAddr => open,
      Sl_rdDAck => open,
      Sl_rdComp => open,
      Sl_rdBTerm => open,
      Sl_MBusy => open,
      Sl_MWrErr => open,
      Sl_MRdErr => open,
      Sl_MIRQ => open,
      led => led_blinker,
      user_clk => sys_clk_s,
      user_reset => sys_rst_s
    );

end architecture STRUCTURE;

