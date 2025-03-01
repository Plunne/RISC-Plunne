----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2025 05:22:28 PM
-- Design Name: 
-- Module Name: Sub_Half - arch_Sub_Half
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

entity Sub_Half is
    Port (
        A : in std_logic;
        B : in std_logic;
        D : out std_logic;
        Bout : out std_logic
    );
end Sub_Half;

architecture arch_Sub_Half of Sub_Half is

begin

    D       <= A xor B;
    Bout    <= (not A) and B;

end arch_Sub_Half;