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

library libriscp;
use libriscp.common.all;

entity PC is
    Port (
        -- Clock
        i_CLK : in std_logic;

        -- PC Increment
        i_INCR : in std_logic;
        
        -- PC Set
        i_SET : in std_logic_vector(XLENM1 downto 0);
        
        -- PC Write Enable
        i_WREN : in std_logic;
        
        -- PC Reset
        i_RST : in std_logic;

        -- PC Output
        o_PC : out std_logic_vector(XLENM1 downto 0)
    );
end PC;

architecture arch_ProgramCounter of PC is

    ----------------
    -- COMPONENTS --
    ----------------
    
    component Adder_32 is
        port (
            A32     : in std_logic_vector(XLENM1 downto 0);
            B32     : in std_logic_vector(XLENM1 downto 0);
            Cin     : in std_logic;
            S       : out std_logic_vector(XLENM1 downto 0);
            Cout    : out std_logic
        );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    signal s_ProgramCounter     : std_logic_vector(XLENM1 downto 0);
    signal s_AdderResult        : std_logic_vector(XLENM1 downto 0) := X32_NULL;

begin

    ----------------------------
    -- COMPONENTS DECLARATION --
    ----------------------------
    
    c_PC_Adder : Adder_32 port map (
        A32     => s_ProgramCounter,
        B32     => PC_INCREMENT,
        Cin     => BIT_FALSE,
        S       => s_AdderResult,
        Cout    => open
    );

    -------------
    -- PROCESS --
    -------------
    
    p_PC : process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
            
            if i_INCR = '1' then
                s_ProgramCounter <= s_AdderResult; -- Increment PC
            
            elsif i_WREN = '1' then
                s_ProgramCounter <= i_SET; -- Set PC
            
            elsif i_RST = '1' then
                s_ProgramCounter <= X32_NULL; -- Reset PC
                
            end if;
        
        end if;
        
    end process p_PC;
    
    -- Return ProgramCounter to PC Output
    o_PC <= s_ProgramCounter;

end arch_ProgramCounter;
