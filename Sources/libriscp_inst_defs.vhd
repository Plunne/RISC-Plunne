----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:27:10 PM
-- Design Name: 
-- Module Name: libriscp_inst_defs - Behavioral
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
use work.libriscp_inst_types.all;

package libriscp_inst_defs is

---------------------------
-- REGISTER INSTRUCTIONS --
---------------------------

-- ADD
constant ADD_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant ADD_FUNCT3     : t_Funct3  := FUNCT3_X0;
constant ADD_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- SUB
constant SUB_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant SUB_FUNCT3     : t_Funct3  := FUNCT3_X0;
constant SUB_FUNCT7     : t_Funct7  := FUNCT7_X20;
-- XOR
constant XOR_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant XOR_FUNCT3     : t_Funct3  := FUNCT3_X4;
constant XOR_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- OR
constant OR_OPCODE      : t_OpCode  := OPCODE_R_TYPE;
constant OR_FUNCT3      : t_Funct3  := FUNCT3_X6;
constant OR_FUNCT7      : t_Funct7  := FUNCT7_X00;
-- AND
constant AND_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant AND_FUNCT3     : t_Funct3  := FUNCT3_X7;
constant AND_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- SLL
constant SLL_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant SLL_FUNCT3     : t_Funct3  := FUNCT3_X1;
constant SLL_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- SRL
constant SRL_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant SRL_FUNCT3     : t_Funct3  := FUNCT3_X5;
constant SRL_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- SRA
constant SRA_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant SRA_FUNCT3     : t_Funct3  := FUNCT3_X5;
constant SRA_FUNCT7     : t_Funct7  := FUNCT7_X20;
-- SLT
constant SLT_OPCODE     : t_OpCode  := OPCODE_R_TYPE;
constant SLT_FUNCT3     : t_Funct3  := FUNCT3_X2;
constant SLT_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- SLT
constant SLTU_OPCODE    : t_OpCode  := OPCODE_R_TYPE;
constant SLTU_FUNCT3    : t_Funct3  := FUNCT3_X3;
constant SLTU_FUNCT7    : t_Funct7  := FUNCT7_X00;

----------------------------
-- IMMEDIATE INSTRUCTIONS --
----------------------------

-- ADDI
constant ADDI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant ADDI_FUNCT3    : t_Funct3  := FUNCT3_X0;
constant ADDI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- XORI
constant XORI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant XORI_FUNCT3    : t_Funct3  := FUNCT3_X4;
constant XORI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- ORI
constant ORI_OPCODE     : t_OpCode  := OPCODE_I_TYPE;
constant ORI_FUNCT3     : t_Funct3  := FUNCT3_X6;
constant ORI_FUNCT7     : t_Funct7  := FUNCT7_X00;
-- ANDI
constant ANDI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant ANDI_FUNCT3    : t_Funct3  := FUNCT3_X7;
constant ANDI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- SLLI
constant SLLI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant SLLI_FUNCT3    : t_Funct3  := FUNCT3_X1;
constant SLLI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- SRLI
constant SRLI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant SRLI_FUNCT3    : t_Funct3  := FUNCT3_X5;
constant SRLI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- SRAI
constant SRAI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant SRAI_FUNCT3    : t_Funct3  := FUNCT3_X5;
constant SRAI_FUNCT7    : t_Funct7  := FUNCT7_X20;
-- SLTI
constant SLTI_OPCODE    : t_OpCode  := OPCODE_I_TYPE;
constant SLTI_FUNCT3    : t_Funct3  := FUNCT3_X2;
constant SLTI_FUNCT7    : t_Funct7  := FUNCT7_X00;
-- SLTI
constant SLTUI_OPCODE   : t_OpCode  := OPCODE_I_TYPE;
constant SLTUI_FUNCT3   : t_Funct3  := FUNCT3_X3;
constant SLTUI_FUNCT7   : t_Funct7  := FUNCT7_X00;

-----------------------
-- LOAD INSTRUCTIONS --
-----------------------

-- LB
constant LB_OPCODE      : t_OpCode  := OPCODE_I_LOAD;
constant LB_FUNCT3      : t_Funct3  := FUNCT3_X0;
-- LH
constant LH_OPCODE      : t_OpCode  := OPCODE_I_LOAD;
constant LH_FUNCT3      : t_Funct3  := FUNCT3_X1;
-- LW
constant LW_OPCODE      : t_OpCode  := OPCODE_I_LOAD;
constant LW_FUNCT3      : t_Funct3  := FUNCT3_X2;
-- LBU
constant LBU_OPCODE     : t_OpCode  := OPCODE_I_LOAD;
constant LBU_FUNCT3     : t_Funct3  := FUNCT3_X4;
-- LHU
constant LHU_OPCODE     : t_OpCode  := OPCODE_I_LOAD;
constant LHU_FUNCT3     : t_Funct3  := FUNCT3_X5;

------------------------
-- STORE INSTRUCTIONS --
------------------------

-- SB
constant SB_OPCODE      : t_OpCode  := OPCODE_S_TYPE;
constant SB_FUNCT3      : t_Funct3  := FUNCT3_X0;
-- SH
constant SH_OPCODE      : t_OpCode  := OPCODE_S_TYPE;
constant SH_FUNCT3      : t_Funct3  := FUNCT3_X1;
-- SW
constant SW_OPCODE      : t_OpCode  := OPCODE_S_TYPE;
constant SW_FUNCT3      : t_Funct3  := FUNCT3_X2;

-------------------------
-- BRANCH INSTRUCTIONS --
-------------------------

-- BEQ
constant BEQ_OPCODE     : t_OpCode  := OPCODE_B_TYPE;
constant BEQ_FUNCT3     : t_Funct3  := FUNCT3_X0;
-- BNE
constant BNE_OPCODE     : t_OpCode  := OPCODE_B_TYPE;
constant BNE_FUNCT3     : t_Funct3  := FUNCT3_X1;
-- BLT
constant BLT_OPCODE     : t_OpCode  := OPCODE_B_TYPE;
constant BLT_FUNCT3     : t_Funct3  := FUNCT3_X4;
-- BGE
constant BGE_OPCODE     : t_OpCode  := OPCODE_B_TYPE;
constant BGE_FUNCT3     : t_Funct3  := FUNCT3_X5;
-- BLTU
constant BLTU_OPCODE    : t_OpCode  := OPCODE_B_TYPE;
constant BLTU_FUNCT3    : t_Funct3  := FUNCT3_X6;
-- BGEU
constant BGEU_OPCODE    : t_OpCode  := OPCODE_B_TYPE;
constant BGEU_FUNCT3    : t_Funct3  := FUNCT3_X7;

-----------------------
-- JUMP INSTRUCTIONS --
-----------------------

-- JAL
constant JAL_OPCODE     : t_OpCode  := OPCODE_J_JAL;
-- JALR
constant JALR_OPCODE    : t_OpCode  := OPCODE_I_JALR;
constant JALR_FUNCT3    : t_Funct3  := FUNCT3_X0;

------------------------
-- UPPER INSTRUCTIONS --
------------------------

-- LUI
constant LUI_OPCODE     : t_OpCode  := OPCODE_U_LUI;
-- AUIPC
constant AUIPC_OPCODE   : t_OpCode  := OPCODE_U_AUIPC;

-------------------------------
-- ENVIRONEMENT INSTRUCTIONS --
-------------------------------

-- ECALL
constant ECALL_OPCODE   : t_OpCode  := OPCODE_I_ENV;
constant ECALL_FUNCT3   : t_Funct3  := FUNCT3_X0;
constant ECALL_FUNCT7   : t_Funct7  := FUNCT7_X00;
-- EBREAK
constant EBREAK_OPCODE  : t_OpCode  := OPCODE_I_ENV;
constant EBREAK_FUNCT3  : t_Funct3  := FUNCT3_X0;
constant EBREAK_FUNCT7  : t_Funct7  := FUNCT7_X01;

end package libriscp_inst_defs;

package body libriscp_inst_defs is
end package body libriscp_inst_defs;