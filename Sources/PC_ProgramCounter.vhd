----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: PC - arch_ProgramCounter
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
use work.libriscp_common.all;

entity PC is
    Port (
        -- Clock
        i_CLK : in std_logic;

        -- PC Increment
        i_INCR : in std_logic;

        -- PC Output
        o_PC : out std_logic_vector(XLENM1 downto 0);
    );
end PC;

architecture arch_ProgramCounter of PC is
    
    signal r_ProgramCounter : std_logic_vector(XLENM1 downto 0);

begin


end arch_ProgramCounter;
