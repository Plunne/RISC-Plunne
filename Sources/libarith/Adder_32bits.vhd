----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2025 12:02:18 PM
-- Design Name: 
-- Module Name: Adder_32 - arch_Adder_32bits
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
use libarith.Adder_Full;

entity Adder_32 is
    Port (
        A32 : in std_logic_vector(31 downto 0);
        B32 : in std_logic_vector(31 downto 0);
        Cin : in std_logic;
        S: out std_logic_vector(31 downto 0);
        Cout : out std_logic
    );
end Adder_32;

architecture arch_Adder_32bits of Adder_32 is
    
    ----------------
    -- COMPONENTS --
    ----------------
    
    component Adder_Full is
        port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Cin : in STD_LOGIC;
            S : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    signal s_Carry : std_logic_vector(31 downto 0);

begin

-- Adders Chain
AF0  : Adder_Full port map(A => A32(0),     B => B32(0),    Cin => Cin,         S => S(0),  Cout => s_Carry(0));
AF1  : Adder_Full port map(A => A32(1),     B => B32(1),    Cin => s_Carry(0),  S => S(1),  Cout => s_Carry(1));
AF2  : Adder_Full port map(A => A32(2),     B => B32(2),    Cin => s_Carry(1),  S => S(2),  Cout => s_Carry(2));
AF3  : Adder_Full port map(A => A32(3),     B => B32(3),    Cin => s_Carry(2),  S => S(3),  Cout => s_Carry(3));
AF4  : Adder_Full port map(A => A32(4),     B => B32(4),    Cin => s_Carry(3),  S => S(4),  Cout => s_Carry(4));
AF5  : Adder_Full port map(A => A32(5),     B => B32(5),    Cin => s_Carry(4),  S => S(5),  Cout => s_Carry(5));
AF6  : Adder_Full port map(A => A32(6),     B => B32(6),    Cin => s_Carry(5),  S => S(6),  Cout => s_Carry(6));
AF7  : Adder_Full port map(A => A32(7),     B => B32(7),    Cin => s_Carry(6),  S => S(7),  Cout => s_Carry(7));
AF8  : Adder_Full port map(A => A32(8),     B => B32(8),    Cin => s_Carry(7),  S => S(8),  Cout => s_Carry(8));
AF9  : Adder_Full port map(A => A32(9),     B => B32(9),    Cin => s_Carry(8),  S => S(9),  Cout => s_Carry(9));
AF10 : Adder_Full port map(A => A32(10),    B => B32(10),   Cin => s_Carry(9),  S => S(10), Cout => s_Carry(10));
AF11 : Adder_Full port map(A => A32(11),    B => B32(11),   Cin => s_Carry(10), S => S(11), Cout => s_Carry(11));
AF12 : Adder_Full port map(A => A32(12),    B => B32(12),   Cin => s_Carry(11), S => S(12), Cout => s_Carry(12));
AF13 : Adder_Full port map(A => A32(13),    B => B32(13),   Cin => s_Carry(12), S => S(13), Cout => s_Carry(13));
AF14 : Adder_Full port map(A => A32(14),    B => B32(14),   Cin => s_Carry(13), S => S(14), Cout => s_Carry(14));
AF15 : Adder_Full port map(A => A32(15),    B => B32(15),   Cin => s_Carry(14), S => S(15), Cout => s_Carry(15));
AF16 : Adder_Full port map(A => A32(16),    B => B32(16),   Cin => s_Carry(15), S => S(16), Cout => s_Carry(16));
AF17 : Adder_Full port map(A => A32(17),    B => B32(17),   Cin => s_Carry(16), S => S(17), Cout => s_Carry(17));
AF18 : Adder_Full port map(A => A32(18),    B => B32(18),   Cin => s_Carry(17), S => S(18), Cout => s_Carry(18));
AF19 : Adder_Full port map(A => A32(19),    B => B32(19),   Cin => s_Carry(18), S => S(19), Cout => s_Carry(19));
AF20 : Adder_Full port map(A => A32(20),    B => B32(20),   Cin => s_Carry(19), S => S(20), Cout => s_Carry(20));
AF21 : Adder_Full port map(A => A32(21),    B => B32(21),   Cin => s_Carry(20), S => S(21), Cout => s_Carry(21));
AF22 : Adder_Full port map(A => A32(22),    B => B32(22),   Cin => s_Carry(21), S => S(22), Cout => s_Carry(22));
AF23 : Adder_Full port map(A => A32(23),    B => B32(23),   Cin => s_Carry(22), S => S(23), Cout => s_Carry(23));
AF24 : Adder_Full port map(A => A32(24),    B => B32(24),   Cin => s_Carry(23), S => S(24), Cout => s_Carry(24));
AF25 : Adder_Full port map(A => A32(25),    B => B32(25),   Cin => s_Carry(24), S => S(25), Cout => s_Carry(25));
AF26 : Adder_Full port map(A => A32(26),    B => B32(26),   Cin => s_Carry(25), S => S(26), Cout => s_Carry(26));
AF27 : Adder_Full port map(A => A32(27),    B => B32(27),   Cin => s_Carry(26), S => S(27), Cout => s_Carry(27));
AF28 : Adder_Full port map(A => A32(28),    B => B32(28),   Cin => s_Carry(27), S => S(28), Cout => s_Carry(28));
AF29 : Adder_Full port map(A => A32(29),    B => B32(29),   Cin => s_Carry(28), S => S(29), Cout => s_Carry(29));
AF30 : Adder_Full port map(A => A32(30),    B => B32(30),   Cin => s_Carry(29), S => S(30), Cout => s_Carry(30));
AF31 : Adder_Full port map(A => A32(31),    B => B32(31),   Cin => s_Carry(30), S => S(31), Cout => s_Carry(31));

-- Last Carry
Cout <= s_Carry(31);

end arch_Adder_32bits;
