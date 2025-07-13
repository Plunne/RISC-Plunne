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

library libriscp;
use libriscp.common.all;

entity IMem is
    Port (
        -- Clock
        i_CLK : in std_logic;
        
        -- Program Counter
        i_PC : std_logic_vector (XLENM1 to 0);
        
        -- IMem Instruction Fetch
        i_IMem_Data : in std_logic_vector (XLENM1 downto 0);
        o_IMem_Addr : out std_logic_vector (XLENM1 downto 0);
        
        -- Instruction Fetched
        o_Instruction : out std_logic_vector (XLENM1 downto 0)
    );
end IMem;

architecture arch_InstructionMemory of IMem is

begin

    p_IMem: process(i_CLK)
    begin

        if rising_edge(i_CLK) then
        
            o_IMem_Addr <= i_PC;
            o_Instruction <= i_IMem_Data;
            
        end if;

    end process p_IMem;

end arch_InstructionMemory;
