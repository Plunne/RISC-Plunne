----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2025 02:25:56 PM
-- Design Name: 
-- Module Name: tb_pc - arch_tb_pc
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.tb_common_pkg.all;
use work.tb_helpers_pkg.all;

entity tb_pc is
end tb_pc;

architecture arch_tb_pc of tb_pc is

    constant TB_PC_INCR : std_logic_vector(TB_XLENM1 downto 0) := X"00000004";
    
    signal s_CLK        : std_logic := '0';
    signal s_RST        : std_logic := '0';
    signal s_INCR       : std_logic := '0';
    signal s_SP_EN      : std_logic := '0';
    signal s_SP_ADDR    : tbt_Word := TB_X32_NULL;
    signal s_PC         : tbt_Word := TB_X32_NULL;

begin

    uut: entity work.pc port map (
            CLK     => s_CLK,
            RST     => s_RST,
            INCR    => s_INCR,
            SP_EN   => s_SP_EN,
            SP_ADDR => s_SP_ADDR,
            PC      => s_PC
    );



end arch_tb_pc;
