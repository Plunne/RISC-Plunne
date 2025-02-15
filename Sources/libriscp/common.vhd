----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2025 09:59:11 PM
-- Design Name: 
-- Module Name: common - Behavioral
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

package common is

---------------
-- ARCH SIZE --
---------------

constant XLEN   : integer := 32;
constant XLENM1 : integer := XLEN -1;

----------
-- NULL --
----------

constant X32_NULL : std_logic_vector(XLENM1 downto 0) := X"00000000";

-------------
-- BOOLEAN --
-------------

constant X32_TRUE   : std_logic_vector(XLENM1 downto 0) := X"00000001";
constant X32_FALSE  : std_logic_vector(XLENM1 downto 0) := X"00000000";

end package common;

package body common is
end package body common;