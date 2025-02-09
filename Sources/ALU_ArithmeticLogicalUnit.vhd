----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: ALU - arch_ArithmeticLogicalUnit
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
use work.libriscp_inst_types.all;

entity ALU is
    Port (
        -- Clock
        i_CLK : std_logic;
        
        -- Operands (Content of Rs1 and Rs2)
        i_OpA : in std_logic_vector(XLENM1 downto 0); -- rs1
        i_OpB : in std_logic_vector(XLENM1 downto 0); -- rs2
        
        -- Function
        i_Funct3 : in t_Funct3;
        i_Funct7 : in t_Funct7;
        
        -- Flags
        i_Flags : out std_logic_vector (2 downto 0); -- input status (ex. carry)
        o_Flags : out std_logic_vector (2 downto 0); -- output status (ex. carry)
        
        -- Output Data
        o_Result : out std_logic_vector (XLENM1 downto 0)
    );
end ALU;

architecture arch_ArithmeticLogicalUnit of ALU is

begin

    p_ALU: process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
            -- ALU
        end if;
        
    end process p_ALU;

end arch_ArithmeticLogicalUnit;
