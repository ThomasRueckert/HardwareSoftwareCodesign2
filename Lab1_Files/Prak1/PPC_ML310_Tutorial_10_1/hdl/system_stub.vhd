-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    fpga_0_RS232_Uart_RX_pin : in std_logic;
    fpga_0_RS232_Uart_TX_pin : out std_logic;
    fpga_0_LEDs_8Bit_GPIO_IO_pin : inout std_logic_vector(0 to 7);
    fpga_0_ORGate_1_Res_pin : out std_logic;
    fpga_0_ORGate_1_Res_1_pin : out std_logic;
    fpga_0_ORGate_1_Res_2_pin : out std_logic;
    sys_clk_pin : in std_logic;
    sys_rst_pin : in std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      fpga_0_RS232_Uart_RX_pin : in std_logic;
      fpga_0_RS232_Uart_TX_pin : out std_logic;
      fpga_0_LEDs_8Bit_GPIO_IO_pin : inout std_logic_vector(0 to 7);
      fpga_0_ORGate_1_Res_pin : out std_logic;
      fpga_0_ORGate_1_Res_1_pin : out std_logic;
      fpga_0_ORGate_1_Res_2_pin : out std_logic;
      sys_clk_pin : in std_logic;
      sys_rst_pin : in std_logic
    );
  end component;

begin

  system_i : system
    port map (
      fpga_0_RS232_Uart_RX_pin => fpga_0_RS232_Uart_RX_pin,
      fpga_0_RS232_Uart_TX_pin => fpga_0_RS232_Uart_TX_pin,
      fpga_0_LEDs_8Bit_GPIO_IO_pin => fpga_0_LEDs_8Bit_GPIO_IO_pin,
      fpga_0_ORGate_1_Res_pin => fpga_0_ORGate_1_Res_pin,
      fpga_0_ORGate_1_Res_1_pin => fpga_0_ORGate_1_Res_1_pin,
      fpga_0_ORGate_1_Res_2_pin => fpga_0_ORGate_1_Res_2_pin,
      sys_clk_pin => sys_clk_pin,
      sys_rst_pin => sys_rst_pin
    );

end architecture STRUCTURE;

