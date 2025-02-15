----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2025 05:21:11 AM
-- Design Name: 
-- Module Name: ALU - arch_ArithmeticLogicalUnit
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library libriscp;
use libriscp.common.all;
use libriscp.inst_types.all;
use libriscp.inst_defs.all;

library libarith;
use libarith.all;

entity ALU is
    Port (
        -- Clock
        i_CLK : std_logic;
        
        -- Operands (Content of Rs1 and Rs2)
        i_OpA : in std_logic_vector(XLENM1 downto 0); -- rs1
        i_OpB : in std_logic_vector(XLENM1 downto 0); -- rs2
        
        -- OpCode
        i_OpCode : in t_OpCode;
        
        -- Function
        i_Funct3 : in t_Funct3;
        i_Funct7 : in t_Funct7;
        
        -- Flags
        i_Flags : out std_logic_vector(2 downto 0); -- input status (ex. carry)
        o_Flags : out std_logic_vector(2 downto 0); -- output status (ex. carry)
        
        -- Output Data
        o_Result : out std_logic_vector(XLENM1 downto 0)
    );
end ALU;

architecture arch_ArithmeticLogicalUnit of ALU is

    signal s_ArithBuffer : std_logic_vector(XLENM1 downto 0) := X32_NULL;

begin

    p_ALU: process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
            
            ---------------------------
            -- OpCode Type Selection --
            ---------------------------
            
            if i_OpCode = ( OPCODE_R_OPE or OPCODE_I_OPE ) then
                    
                case i_Funct7 & i_Funct3 is
                    
                    -- ADD
                    when ADD_FUNCTION =>
                        --o_Result <= i_OpA + i_OpB;
                    
                    -- SUB
                    when SUB_FUNCTION =>
                        --o_Result <= i_OpA - i_OpB;
                    
                    -- XOR
                    when XOR_FUNCTION =>
                        o_Result <= i_OpA xor i_OpB;
                    
                    -- OR
                    when OR_FUNCTION =>
                        o_Result <= i_OpA or i_OpB;
                    
                    -- AND
                    when AND_FUNCTION =>
                        o_Result <= i_OpA and i_OpB;
                    
                    -- SLL
                    when SLL_FUNCTION =>
                        --o_Result <= X"00000000";
                        --o_Result(XLENM1 downto i_OpB) <= i_OpA((XLENM1 - i_OpB) downto 0);
                    
                    -- SRL
                    when SRL_FUNCTION =>
                        --o_Result <= X"00000000";
                        --o_Result((XLENM1 - i_OpB) downto 0) <= i_OpA(XLENM1 downto i_OpB);
                    
                    -- SRA
                    when SRA_FUNCTION =>
                        
                        case i_OpB is
                            
                            -- Shift 0
                            when X"00000000" =>
                                o_Result <= i_OpA;
                            
                            -- Shift 1
                            when X"00000001" =>
                                --s_ArithBuffer(0)                        <= i_OpA(0);
                                --o_Result((XLENM1 - i_OpB) downto 0)     <= i_OpA(XLENM1 downto i_OpB);
                                --o_Result(XLENM1)                        <= s_ArithBuffer(0);
                                
                            when others =>
                                --s_ArithBuffer((i_OpB - 1) downto 0)         <= i_OpA((i_OpB - 1) downto 0);
                                --o_Result((XLENM1 - i_OpB) downto 0)         <= i_OpA(XLENM1 downto i_OpB);
                                --o_Result(XLENM1 downto (XLENM1 - i_OpB))    <= s_ArithBuffer((i_OpB - 1) downto 0);
                                
                        end case;
                    
                    -- SLT
                    when SLT_FUNCTION =>
                        if ( signed(i_OpA) < signed(i_OpB) ) then
                            o_Result <= X32_TRUE;
                        else
                            o_Result <= X32_FALSE;
                        end if;
                    
                    -- SLTU
                    when SLTU_FUNCTION =>
                        if ( unsigned(i_OpA) < unsigned(i_OpB) ) then
                            o_Result <= X32_TRUE;
                        else
                            o_Result <= X32_FALSE;
                        end if;
                        
                    when others =>
                        o_Result <= X32_NULL;                    
                
                end case;
                    
            end if;
            
        end if;
        
    end process p_ALU;

end arch_ArithmeticLogicalUnit;
