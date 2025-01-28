----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: IDcd - arch_InstructionDecoder
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
use work.riscp_common.all;

entity IDcd is
    Port (
        -----------------------------------
        -- Unified Instruction from IMem --
        -----------------------------------
        -- Instruction from IMem
        i_IDcd_Instruction : in std_logic_vector (XLENM1 to 0);

        ------------------------------------
        -- Decoded Instruction to Outputs --
        ------------------------------------
        -- OpCode
        o_OpCode : out std_logic_vector (2 downto 0);
        -- Rd (Destination Register Address)
        o_rd : out integer;
        -- Operands Outputs to RegF
        o_rs1 : out integer;
        o_rs2 : out integer;
        o_funct3 : out integer;
        o_funct7 : out integer;
        -- ImmU related
        o_imm : out integer
        
        -- Clock
        i_CLK : std_logic

    );
end IDcd;

architecture arch_InstructionDecoder of IDcd is

begin


end arch_InstructionDecoder;
