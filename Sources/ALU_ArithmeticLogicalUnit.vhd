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

entity ALU is
    Port (
        -- Operands
        i_OpA : in integer; -- rs1
        i_OpB : in integer; -- rs2
        -- OpCode
        i_OpCode : in std_logic_vector (2 downto 0);
        -- Output Data
        o_Result : out std_logic_vector (XLENM1 downto 0);
        -- Flags
        i_Flags : out std_logic_vector (2 downto 0); -- input status (ex. carry)
        o_Flags : out std_logic_vector (2 downto 0); -- output status (ex. carry)
        -- Clock
        i_CLK : std_logic
    );
end ALU;

architecture arch_ArithmeticLogicalUnit of ALU is

begin


end arch_ArithmeticLogicalUnit;
