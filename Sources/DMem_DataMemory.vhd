----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: DMem - arch_DataMemory
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
use libriscp.inst_types.all;

entity DMem is
    Port (
        -- Clock
        i_CLK : in std_logic;
        
        -- Rd (Destination Register Address)
        i_Rd : in t_Rd;
        
        -- Result
        i_Result : in std_logic_vector (XLENM1 downto 0);
        
        -- Write-Back
        o_WriteBack : out std_logic_vector (XLENM1 downto 0);
        
        -- Data Memory
        o_DMem_Addr     : out std_logic_vector (XLENM1 downto 0);
        io_DMem_Data    : inout std_logic_vector (XLENM1 downto 0)
    );
end DMem;

architecture arch_DataMemory of DMem is

begin

    -------------
    -- PROCESS --
    -------------
    
    p_DMem : process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
            
            o_DMem_Addr <= i_Rd;
            io_DMem_Data <= i_Result;
            o_WriteBack <= i_Result;
        
        end if;
        
    end process p_DMem;

end arch_DataMemory;
