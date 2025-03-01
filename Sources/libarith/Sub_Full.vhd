----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2025 05:22:28 PM
-- Design Name: 
-- Module Name: Sub_Full - arch_Sub_Full
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

library libarith;
use libarith.Sub_Half;

entity Sub_Full is
    Port (
        A : in std_logic;
        B : in std_logic;
        Bin : in std_logic;
        D : out std_logic;
        Bout : out std_logic
    );
end Sub_Full;

architecture arch_Sub_Full of Sub_Full is

    ----------------
    -- COMPONENTS --
    ----------------
    
    component Sub_Half is
        port (
            A : in std_logic;
            B : in std_logic;
            D : out std_logic;
            Bout : out std_logic
        );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    signal s_D1_to_A2       : std_logic;
    signal s_Bout1_to_Or1   : std_logic;
    signal s_Bout2_to_Or2   : std_logic;
    
begin

SH1 : Sub_Half port map(A => A,             B => B,     D => s_D1_to_A2,    Bout => s_Bout1_to_Or1);
SH2 : Sub_Half port map(A => s_D1_to_A2,    B => Bin,   D => D,             Bout => s_Bout2_to_Or2);

-- Last Borrow
Bout <= s_Bout1_to_Or1 and s_Bout2_to_Or2;

end arch_Sub_Full;