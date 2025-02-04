----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:27:10 PM
-- Design Name: 
-- Module Name: libriscp_inst_types - Behavioral
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

package libriscp_inst_types is

-------------
-- OPCODES --
-------------

-- OpCode Size
constant OPCODE_SIZE    : integer := 7;
constant OPCODE_SIZEM1  : integer := OPCODE_SIZE -1;

-- OpCode Type
subtype t_OpCode is std_logic_vector(OPCODE_SIZEM1 downto 0);

-- Register
constant OPCODE_R_TYPE  : t_OpCode  := "0110011";
-- Immediate
constant OPCODE_I_TYPE  : t_OpCode  := "0010011";
-- Load
constant OPCODE_I_LOAD  : t_OpCode  := "0000011";
-- Store
constant OPCODE_S_TYPE  : t_OpCode  := "0100011";
-- Branch
constant OPCODE_B_TYPE  : t_OpCode  := "1100011";
-- Jump
constant OPCODE_J_JAL   : t_OpCode  := "1101111";
constant OPCODE_I_JALR  : t_OpCode  := "1100111";
-- Upper
constant OPCODE_U_LUI   : t_OpCode  := "0110111";
constant OPCODE_U_AUIPC : t_OpCode  := "0010111";
-- Environment
constant OPCODE_I_ENV   : t_OpCode  := "1110011";

------------
-- FUNCT3 --
------------

-- Funct3 Size
constant FUNCT3_SIZE    : integer := 3;
constant FUNCT3_SIZEM1  : integer := FUNCT3_SIZE -1;

-- Funct3 Type
subtype t_Funct3 is std_logic_vector(FUNCT3_SIZEM1 downto 0);

-- Funct3 Values
constant FUNCT3_X0      : t_Funct3  := X"0";
constant FUNCT3_X1      : t_Funct3  := X"1";
constant FUNCT3_X2      : t_Funct3  := X"2";
constant FUNCT3_X3      : t_Funct3  := X"3";
constant FUNCT3_X4      : t_Funct3  := X"4";
constant FUNCT3_X5      : t_Funct3  := X"5";
constant FUNCT3_X6      : t_Funct3  := X"6";
constant FUNCT3_X7      : t_Funct3  := X"7";

------------
-- FUNCT7 --
------------

-- Funct3 Size
constant FUNCT7_SIZE    : integer := 7;
constant FUNCT7_SIZEM1  : integer := FUNCT7_SIZE -1;

-- Funct3 Type
subtype t_Funct7 is std_logic_vector(FUNCT7_SIZEM1 downto 0);

-- Funct7 Values
constant FUNCT7_X00     : t_Funct7  := X"00";
constant FUNCT7_X01     : t_Funct7  := X"01";
constant FUNCT7_X20     : t_Funct7  := X"20";

-------------------------
-- INSTRUCTIONS RANGES --
-------------------------

-- OpCode Range
constant OPCODE_MIN     : integer := 0;
constant OPCODE_MAX     : integer := 6;
-- Registers Range
constant RD_MIN         : integer := 7;
constant RD_MAX         : integer := 11;
constant RS1_MIN        : integer := 15;
constant RS1_MAX        : integer := 19;
constant RS2_MIN        : integer := 20;
constant RS2_MAX        : integer := 24;
-- Funct3 Range
constant FUNCT3_MIN     : integer := 12;
constant FUNCT3_MAX     : integer := 14;
-- Funct7 Range
constant FUNCT7_MIN     : integer := 25;
constant FUNCT7_MAX     : integer := 31;

------------------------
-- INSTRUCTIONS TYPES --
------------------------

-- R-Type
type t_R_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    rd      : std_logic_vector(RD_MAX downto RD_MIN);
    funct3  : std_logic_vector(FUNCT3_MAX downto FUNCT3_MIN);
    rs1     : std_logic_vector(RS1_MAX downto RS1_MIN);
    rs2     : std_logic_vector(RS2_MAX downto RS2_MIN);
    funct7  : std_logic_vector(FUNCT7_MAX downto FUNCT7_MIN);  
end record t_R_Inst;

-- I-Type
type t_I_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    rd      : std_logic_vector(RD_MAX downto RD_MIN);
    funct3  : std_logic_vector(FUNCT3_MAX downto FUNCT3_MIN);
    rs1     : std_logic_vector(RS1_MAX downto RS1_MIN);
    imm  : std_logic_vector(FUNCT7_MAX downto RS2_MIN);
end record t_I_Inst;

-- S-Type
type t_S_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    imm1    : std_logic_vector(RD_MAX downto RD_MIN);
    funct3  : std_logic_vector(FUNCT3_MAX downto FUNCT3_MIN);
    rs1     : std_logic_vector(RS1_MAX downto RS1_MIN);
    rs2     : std_logic_vector(RS2_MAX downto RS2_MIN);
    imm2    : std_logic_vector(FUNCT7_MAX downto FUNCT7_MIN);  
end record t_S_Inst;

-- B-Type
type t_B_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    imm1    : std_logic_vector(RD_MAX downto RD_MIN);
    funct3  : std_logic_vector(FUNCT3_MAX downto FUNCT3_MIN);
    rs1     : std_logic_vector(RS1_MAX downto RS1_MIN);
    rs2     : std_logic_vector(RS2_MAX downto RS2_MIN);
    imm2    : std_logic_vector(FUNCT7_MAX downto FUNCT7_MIN);  
end record t_B_Inst;

-- U-Type
type t_U_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    rd      : std_logic_vector(RD_MAX downto RD_MIN);
    imm  : std_logic_vector(FUNCT7_MAX downto FUNCT3_MIN);
end record t_U_Inst;

-- J-Type
type t_J_Inst is record
    opcode  : std_logic_vector(OPCODE_MAX downto OPCODE_MIN);
    rd      : std_logic_vector(RD_MAX downto RD_MIN);
    imm     : std_logic_vector(FUNCT7_MAX downto FUNCT3_MIN);
end record t_J_Inst;

end package libriscp_inst_types;

package body libriscp_inst_types is
end package body libriscp_inst_types;