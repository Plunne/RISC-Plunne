----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2025 05:22:28 PM
-- Design Name: 
-- Module Name: Sub_32 - arch_Sub_32bits
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
use libarith.Sub_Full;

entity Sub_32 is
    Port (
        A32 : in std_logic_vector(31 downto 0);
        B32 : in std_logic_vector(31 downto 0);
        Bin : in std_logic;
        D32 : out std_logic_vector(31 downto 0);
        Bout : out std_logic
    );
end Sub_32;

architecture arch_Sub_32bits of Sub_32 is

    ----------------
    -- COMPONENTS --
    ----------------
    
    component Sub_Full is
    Port (
        A : in std_logic;
        B : in std_logic;
        Bin : in std_logic;
        D : out std_logic;
        Bout : out std_logic
    );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    signal s_Borrow : std_logic_vector(31 downto 0);
    
begin

-- Subs Chain
SF0  : Sub_Full port map(A => A32(0),     B => B32(0),    Bin => Bin,           D => D32(0),    Bout => s_Borrow(0));
SF1  : Sub_Full port map(A => A32(1),     B => B32(1),    Bin => s_Borrow(0),   D => D32(1),    Bout => s_Borrow(1));
SF2  : Sub_Full port map(A => A32(2),     B => B32(2),    Bin => s_Borrow(1),   D => D32(2),    Bout => s_Borrow(2));
SF3  : Sub_Full port map(A => A32(3),     B => B32(3),    Bin => s_Borrow(2),   D => D32(3),    Bout => s_Borrow(3));
SF4  : Sub_Full port map(A => A32(4),     B => B32(4),    Bin => s_Borrow(3),   D => D32(4),    Bout => s_Borrow(4));
SF5  : Sub_Full port map(A => A32(5),     B => B32(5),    Bin => s_Borrow(4),   D => D32(5),    Bout => s_Borrow(5));
SF6  : Sub_Full port map(A => A32(6),     B => B32(6),    Bin => s_Borrow(5),   D => D32(6),    Bout => s_Borrow(6));
SF7  : Sub_Full port map(A => A32(7),     B => B32(7),    Bin => s_Borrow(6),   D => D32(7),    Bout => s_Borrow(7));
SF8  : Sub_Full port map(A => A32(8),     B => B32(8),    Bin => s_Borrow(7),   D => D32(8),    Bout => s_Borrow(8));
SF9  : Sub_Full port map(A => A32(9),     B => B32(9),    Bin => s_Borrow(8),   D => D32(9),    Bout => s_Borrow(9));
SF10 : Sub_Full port map(A => A32(10),    B => B32(10),   Bin => s_Borrow(9),   D => D32(10),   Bout => s_Borrow(10));
SF11 : Sub_Full port map(A => A32(11),    B => B32(11),   Bin => s_Borrow(10),  D => D32(11),   Bout => s_Borrow(11));
SF12 : Sub_Full port map(A => A32(12),    B => B32(12),   Bin => s_Borrow(11),  D => D32(12),   Bout => s_Borrow(12));
SF13 : Sub_Full port map(A => A32(13),    B => B32(13),   Bin => s_Borrow(12),  D => D32(13),   Bout => s_Borrow(13));
SF14 : Sub_Full port map(A => A32(14),    B => B32(14),   Bin => s_Borrow(13),  D => D32(14),   Bout => s_Borrow(14));
SF15 : Sub_Full port map(A => A32(15),    B => B32(15),   Bin => s_Borrow(14),  D => D32(15),   Bout => s_Borrow(15));
SF16 : Sub_Full port map(A => A32(16),    B => B32(16),   Bin => s_Borrow(15),  D => D32(16),   Bout => s_Borrow(16));
SF17 : Sub_Full port map(A => A32(17),    B => B32(17),   Bin => s_Borrow(16),  D => D32(17),   Bout => s_Borrow(17));
SF18 : Sub_Full port map(A => A32(18),    B => B32(18),   Bin => s_Borrow(17),  D => D32(18),   Bout => s_Borrow(18));
SF19 : Sub_Full port map(A => A32(19),    B => B32(19),   Bin => s_Borrow(18),  D => D32(19),   Bout => s_Borrow(19));
SF20 : Sub_Full port map(A => A32(20),    B => B32(20),   Bin => s_Borrow(19),  D => D32(20),   Bout => s_Borrow(20));
SF21 : Sub_Full port map(A => A32(21),    B => B32(21),   Bin => s_Borrow(20),  D => D32(21),   Bout => s_Borrow(21));
SF22 : Sub_Full port map(A => A32(22),    B => B32(22),   Bin => s_Borrow(21),  D => D32(22),   Bout => s_Borrow(22));
SF23 : Sub_Full port map(A => A32(23),    B => B32(23),   Bin => s_Borrow(22),  D => D32(23),   Bout => s_Borrow(23));
SF24 : Sub_Full port map(A => A32(24),    B => B32(24),   Bin => s_Borrow(23),  D => D32(24),   Bout => s_Borrow(24));
SF25 : Sub_Full port map(A => A32(25),    B => B32(25),   Bin => s_Borrow(24),  D => D32(25),   Bout => s_Borrow(25));
SF26 : Sub_Full port map(A => A32(26),    B => B32(26),   Bin => s_Borrow(25),  D => D32(26),   Bout => s_Borrow(26));
SF27 : Sub_Full port map(A => A32(27),    B => B32(27),   Bin => s_Borrow(26),  D => D32(27),   Bout => s_Borrow(27));
SF28 : Sub_Full port map(A => A32(28),    B => B32(28),   Bin => s_Borrow(27),  D => D32(28),   Bout => s_Borrow(28));
SF29 : Sub_Full port map(A => A32(29),    B => B32(29),   Bin => s_Borrow(28),  D => D32(29),   Bout => s_Borrow(29));
SF30 : Sub_Full port map(A => A32(30),    B => B32(30),   Bin => s_Borrow(29),  D => D32(30),   Bout => s_Borrow(30));
SF31 : Sub_Full port map(A => A32(31),    B => B32(31),   Bin => s_Borrow(30),  D => D32(31),   Bout => s_Borrow(31));

-- Last Borrow
Bout <= s_Borrow(31);

end arch_Sub_32bits;