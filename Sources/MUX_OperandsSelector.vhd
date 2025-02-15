----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2025 11:36:58 AM
-- Design Name: 
-- Module Name: MUX_OpSel - arch_OperandsSelector
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
use libriscp.inst_types.all;
use libriscp.inst_defs.all;

entity MUX_OpSel is
    Port (
        -- OpCode
        i_OpCode : in t_OpCode;
        -- Operands Inputs from RegF
        i_rs1 : in std_logic_vector(XLENM1 downto 0);
        i_rs2 : in std_logic_vector(XLENM1 downto 0);
        -- Operand Input from ImmU
        i_Imm : in std_logic_vector(XLENM1 downto 0);
        -- Operands Outputs to ALU
        o_OpA : out std_logic_vector(XLENM1 downto 0);
        o_OpB : out std_logic_vector(XLENM1 downto 0)
    );
end MUX_OpSel;

architecture arch_OperandsSelector of MUX_OpSel is

begin

    o_OpA <= i_rs1;

    with i_OpCode select

        o_OpB <=    i_rs2       when OPCODE_R_OPE,
                    i_Imm       when OPCODE_I_OPE,
                    X32_NULL    when others;

end arch_OperandsSelector;
