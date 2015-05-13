-------------------------------------------------------------------------------
-- ppc405_0_docm_cntlr_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library dsbram_if_cntlr_v3_00_b;
use dsbram_if_cntlr_v3_00_b.all;

entity ppc405_0_docm_cntlr_wrapper is
  port (
    BRAMDSOCMCLK : in std_logic;
    DSBRAMRST : in std_logic;
    DSOCMBRAMABUS : in std_logic_vector(8 to 29);
    DSOCMBRAMBYTEWRITE : in std_logic_vector(0 to 3);
    DSOCMBRAMEN : in std_logic;
    DSOCMBRAMWRDBUS : in std_logic_vector(0 to 31);
    S_BRAMDSOCMRDDBUS : out std_logic_vector(0 to 31);
    S_DSOCMRWCOMPLETE : out std_logic;
    S_DSOCMSLAVESELECT : out std_logic;
    BRAM_Rst_A : out std_logic;
    BRAM_Clk_A : out std_logic;
    BRAM_EN_A : out std_logic;
    BRAM_WEN_A : out std_logic_vector(0 to 3);
    BRAM_Addr_A : out std_logic_vector(0 to 31);
    BRAM_Din_A : in std_logic_vector(0 to 31);
    BRAM_Dout_A : out std_logic_vector(0 to 31)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of ppc405_0_docm_cntlr_wrapper : entity is "dsbram_if_cntlr_v3_00_b";

end ppc405_0_docm_cntlr_wrapper;

architecture STRUCTURE of ppc405_0_docm_cntlr_wrapper is

  component dsbram_if_cntlr is
    generic (
      C_BASEADDR : std_logic_vector(0 to 31);
      C_HIGHADDR : std_logic_vector(0 to 31);
      C_BRAM_EN : integer;
      C_RANGECHECK : integer
    );
    port (
      BRAMDSOCMCLK : in std_logic;
      DSBRAMRST : in std_logic;
      DSOCMBRAMABUS : in std_logic_vector(8 to 29);
      DSOCMBRAMBYTEWRITE : in std_logic_vector(0 to 3);
      DSOCMBRAMEN : in std_logic;
      DSOCMBRAMWRDBUS : in std_logic_vector(0 to 31);
      S_BRAMDSOCMRDDBUS : out std_logic_vector(0 to 31);
      S_DSOCMRWCOMPLETE : out std_logic;
      S_DSOCMSLAVESELECT : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31)
    );
  end component;

begin

  ppc405_0_docm_cntlr : dsbram_if_cntlr
    generic map (
      C_BASEADDR => X"40a04000",
      C_HIGHADDR => X"40a07fff",
      C_BRAM_EN => 0,
      C_RANGECHECK => 0
    )
    port map (
      BRAMDSOCMCLK => BRAMDSOCMCLK,
      DSBRAMRST => DSBRAMRST,
      DSOCMBRAMABUS => DSOCMBRAMABUS,
      DSOCMBRAMBYTEWRITE => DSOCMBRAMBYTEWRITE,
      DSOCMBRAMEN => DSOCMBRAMEN,
      DSOCMBRAMWRDBUS => DSOCMBRAMWRDBUS,
      S_BRAMDSOCMRDDBUS => S_BRAMDSOCMRDDBUS,
      S_DSOCMRWCOMPLETE => S_DSOCMRWCOMPLETE,
      S_DSOCMSLAVESELECT => S_DSOCMSLAVESELECT,
      BRAM_Rst_A => BRAM_Rst_A,
      BRAM_Clk_A => BRAM_Clk_A,
      BRAM_EN_A => BRAM_EN_A,
      BRAM_WEN_A => BRAM_WEN_A,
      BRAM_Addr_A => BRAM_Addr_A,
      BRAM_Din_A => BRAM_Din_A,
      BRAM_Dout_A => BRAM_Dout_A
    );

end architecture STRUCTURE;

