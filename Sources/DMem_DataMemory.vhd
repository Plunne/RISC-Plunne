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

library work;
use work.libriscp_common.all;
use work.libriscp_inst_types.all;

entity DMem is
    Port (
        -- Clock
        i_CLK : std_logic;
        
        -- Rd (Destination Register Address)
        i_rd : out t_Rd;
        
        -- Write-Back
        o_WriteBack : std_logic_vector (XLENM1 to 0);
        
        -----------------
        -- DATA MEMORY --
        -----------------
        
        -- Data Address
        o_DataAddr  : in std_logic_vector (XLENM1 downto 0);
        -- Data Ports
        i_RData      : in std_logic_vector (XLENM1 downto 0);
        o_WData      : out std_logic_vector (XLENM1 downto 0);
        -- Data Write Enable
        o_DataWr    : out std_logic
    );
end DMem;

architecture arch_DataMemory of DMem is

begin


end arch_DataMemory;
