----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: RegF - arch_RegisterFile
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

entity RegF is
    Port (
        -- Registers Storage for IDcd
        i_rs1 : in integer;
        i_rs2 : in integer;

        -- Operands to ALU
        o_OpA : in integer;
        o_OpB : in integer;

        -- Clock
        i_CLK : std_logic
    );
end RegF;

architecture arch_RegisterFile of RegF is

    type t_RegFile is array (0 to XLENM1) of std_logic_vector(XLENM1 downto 0);
    signal r_Xreg : t_RegFile;

begin


end arch_RegisterFile;
