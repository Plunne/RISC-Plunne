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

library libriscp;
use libriscp.common.all;
use libriscp.inst_types.all;
use libriscp.inst_defs.all;

entity IDcd is
    Port (
        -- Clock
        i_CLK : in std_logic;
    
        -----------------------------------
        -- Unified Instruction from IMem --
        -----------------------------------
        
        -- Instruction from IMem
        i_Instruction : in std_logic_vector (XLENM1 to 0);

        ------------------------------------
        -- Decoded Instruction to Outputs --
        ------------------------------------
        
        -- OpCode
        o_OpCode : out t_OpCode;
        -- Rd (Destination Register Address)
        o_Rd : out t_rd;
        -- Operands Outputs to RegF
        o_Rs1 : out t_Rs1;
        o_Rs2 : out t_Rs2;
        -- Inst Funct
        o_Funct3 : out t_Funct3;
        o_Funct7 : out t_Funct7;
        -- Immediate
        o_imm : out std_logic_vector(XLENM1 downto 0)
    );
end IDcd;

architecture arch_InstructionDecoder of IDcd is

begin

    p_IDcd: process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
        
            -------------------
            -- OpCode Decode --
            -------------------
            
            o_OpCode <= i_Instruction(OPCODE_MAX downto OPCODE_MIN);
            
            ------------------------
            -- Instruction Decode --
            ------------------------
        
            case i_Instruction(OPCODE_MAX downto OPCODE_MIN) is
                
                -- R-Type
                when OPCODE_R_OPE =>
                    o_Rd        <= i_Instruction(RD_MAX downto RD_MIN);
                    o_Funct3    <= i_Instruction(FUNCT3_MAX downto FUNCT3_MIN);
                    o_Rs1       <= i_Instruction(RS1_MAX downto RS1_MIN);
                    o_Rs2       <= i_Instruction(RS2_MAX downto RS2_MIN);
                    o_Funct7    <= i_Instruction(FUNCT7_MAX downto FUNCT7_MIN);
                    
                -- I-Type
                when OPCODE_I_OPE | OPCODE_I_LOAD | OPCODE_I_JALR | OPCODE_I_ENV =>
                    o_Rd        <= i_Instruction(RD_MAX downto RD_MIN);
                    o_Funct3    <= i_Instruction(FUNCT3_MAX downto FUNCT3_MIN);
                    o_Rs1       <= i_Instruction(RS1_MAX downto RS1_MIN);
                    o_Imm       <= i_Instruction(IMM_I_MAX downto IMM_I_MIN);
                    
                -- S-Type
                when OPCODE_S_STORE =>
                    o_Imm(IMM_S_4_0_MAX downto IMM_S_4_0_MIN)   <= i_Instruction(IMM_S_4_0_MAX downto IMM_S_4_0_MIN);
                    o_Funct3                                    <= i_Instruction(FUNCT3_MAX downto FUNCT3_MIN);
                    o_Rs1                                       <= i_Instruction(RS1_MAX downto RS1_MIN);
                    o_Rs2                                       <= i_Instruction(RS2_MAX downto RS2_MIN);
                    o_Imm(IMM_S_11_5_MAX downto IMM_S_11_5_MIN) <= i_Instruction(IMM_S_11_5_MAX downto IMM_S_11_5_MIN);
                
                -- B-Type
                when OPCODE_B_BRANCH =>
                    o_Imm(IMM_B_11_BIT)                         <= i_Instruction(IMM_B_11_BIT);
                    o_Imm(IMM_B_4_1_MAX downto IMM_B_4_1_MIN)   <= i_Instruction(IMM_B_4_1_MAX downto IMM_B_4_1_MIN);
                    o_Funct3                                    <= i_Instruction(FUNCT3_MAX downto FUNCT3_MIN);
                    o_Rs1                                       <= i_Instruction(RS1_MAX downto RS1_MIN);
                    o_Rs2                                       <= i_Instruction(RS2_MAX downto RS2_MIN);
                    o_Imm(IMM_B_10_5_MAX downto IMM_B_10_5_MIN) <= i_Instruction(IMM_B_10_5_MAX downto IMM_B_10_5_MIN);
                    o_Imm(IMM_B_12_BIT)                         <= i_Instruction(IMM_B_12_BIT);
                
                -- J-Type
                when OPCODE_J_JAL =>
                    o_Rd                                            <= i_Instruction(RD_MAX downto RD_MIN);
                    o_Imm(IMM_J_19_12_MAX downto IMM_J_19_12_MIN)   <= i_Instruction(IMM_J_19_12_MAX downto IMM_J_19_12_MIN);
                    o_Imm(IMM_J_11_BIT)                             <= i_Instruction(IMM_J_11_BIT);
                    o_Imm(IMM_J_10_1_MAX downto IMM_J_10_1_MIN)     <= i_Instruction(IMM_J_10_1_MAX downto IMM_J_10_1_MIN);
                    o_Imm(IMM_J_20_BIT)                             <= i_Instruction(IMM_J_20_BIT);
                
                -- U-Type
                when OPCODE_U_LUI | OPCODE_U_AUIPC =>
                    o_Rd                                <= i_Instruction(RD_MAX downto RD_MIN);
                    o_Imm(IMM_U_MAX downto IMM_U_MIN)   <= i_Instruction(IMM_U_MAX downto IMM_U_MIN);
            
            end case;
        
        end if;
        
    end process p_IDcd;

end arch_InstructionDecoder;
