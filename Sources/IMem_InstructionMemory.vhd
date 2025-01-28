----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: IMem - arch_InstructionMemory
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
use work.riscp_common.all;

entity IMem is
    Port (
        -- Instruction Address
        i_IMem_InstAddr : in std_logic_vector (XLENM1 downto 0);
        -- Instruction Ports
        i_IMem_Instruction : in std_logic_vector (XLENM1 downto 0);
        o_IDcd_Instruction : out std_logic_vector (XLENM1 downto 0);
        -- Program Counter
        i_PC : std_logic_vector (XLENM1 to 0);
        -- Clock
        i_CLK : std_logic

    );
end IMem;

architecture arch_InstructionMemory of IMem is

begin


end arch_InstructionMemory;
