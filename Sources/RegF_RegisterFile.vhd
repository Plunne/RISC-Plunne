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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library libriscp;
use libriscp.common.all;
use libriscp.inst_types.all;

entity RegF is
    Port (
        -- Clock
        i_CLK : in std_logic;
    
        -- Registers Storage
        i_Rd    : in t_Rd;
        i_Rs1   : in t_Rs1;
        i_Rs2   : in t_Rs2;
        
        -- Write-Back
        i_WriteBack : in std_logic_vector(XLENM1 downto 0);
        
        -- Operands to ALU (Content of Rs1 and Rs2)
        o_XregA : out std_logic_vector(XLENM1 downto 0);
        o_XregB : out std_logic_vector(XLENM1 downto 0)
    );
end RegF;

architecture arch_RegisterFile of RegF is

    type t_RegFile is array (0 to XLENM1) of std_logic_vector(XLENM1 downto 0);
    signal s_Xreg : t_RegFile;

begin

    p_RegF: process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
            
            -- Get Rs1 and Rs2
            s_Xreg(to_integer(unsigned(i_Rs1))) <= i_Rs1;
            s_Xreg(to_integer(unsigned(i_Rs2))) <= i_Rs2;
            
            -- Fill Rd from Write-Back
            s_Xreg(to_integer(unsigned(i_Rd))) <= i_WriteBack;
            
            -- Send operands to ALU
            o_XregA <= s_Xreg(to_integer(unsigned(i_Rs1)));
            o_XregB <= s_Xreg(to_integer(unsigned(i_Rs2)));
            
        end if;
        
    end process p_RegF;

end arch_RegisterFile;
