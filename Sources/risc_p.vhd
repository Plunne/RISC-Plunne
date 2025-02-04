----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2025 09:33:04 PM
-- Design Name: 
-- Module Name: RISC_Plunne - arch_RISC_Plunne
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

entity RISC_Plunne is

    Port (
        -- Clock
        i_CLK : in std_logic;
        
        ------------------
        -- Memory Ports --
        ------------------
        -- Instruction Memory
        i_IMem_port : std_logic_vector (XLENM1 downto 0);
        o_IMem_addr : std_logic_vector (XLENM1 downto 0);
        -- Data Memory
        o_DMem_port : std_logic_vector (XLENM1 downto 0);
        o_DMem_addr : std_logic_vector (XLENM1 downto 0)
        --io_XregsMemory
    );

end RISC_Plunne;

architecture arch_RISC_Plunne of RISC_Plunne is

begin


end arch_RISC_Plunne;
