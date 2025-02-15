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

entity Adder_Full is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end Adder_Full;

architecture arch_Adder_Full of Adder_Full is
    
    signal s_A_xor_B        : std_logic;
    signal s_AxorB_and_Cin  : std_logic;
    signal s_A_and_B        : std_logic;
    
begin

    -- First Gate XOR
    s_A_xor_B <= A xor B;
    
    -- Last Gate XOR to S  
    S <= s_A_xor_B xor Cin;
    
    -- AND Gates to OR Gate
    s_AxorB_and_Cin <= s_A_xor_B and Cin;
    s_A_and_B       <= A and B;
    
    -- OR Gate to Cout
    Cout <= s_AxorB_and_Cin or s_A_and_B;
    
end arch_Adder_Full;