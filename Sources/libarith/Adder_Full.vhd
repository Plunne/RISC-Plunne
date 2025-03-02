----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2025 09:18:37 PM
-- Design Name: 
-- Module Name: Adder_Full - arch_Adder_Full
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
use libarith.Adder_Half;

entity Adder_Full is
    Port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        S : out std_logic;
        Cout : out std_logic
    );
end Adder_Full;

architecture arch_Adder_Full of Adder_Full is
    
    ----------------
    -- COMPONENTS --
    ----------------
    
    component Adder_Half is
    port (
        A : in std_logic;
        B : in std_logic;
        S : out std_logic;
        Cout : out std_logic
    );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    signal s_S1_to_A2       : std_logic;
    signal s_Cout1_to_Or1   : std_logic;
    signal s_Cout2_to_Or2   : std_logic;
    
begin

AH1 : Adder_Half port map(A => A,           B => B,     S => s_S1_to_A2,    Cout => s_Cout1_to_Or1);
AH2 : Adder_Half port map(A => s_S1_to_A2,  B => Cin,   S => S,             Cout => s_Cout2_to_Or2);

-- Last Carry
Cout <= s_Cout1_to_Or1 or s_Cout2_to_Or2;
    
end arch_Adder_Full;