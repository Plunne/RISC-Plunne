----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2025 09:33:04 PM
-- Design Name: 
-- Module Name: RISC_Plunne - arch_RISC_Plunne
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
use work.all;

library libriscp;
use libriscp.common.all;
use libriscp.inst_types.all;

entity RISC_Plunne is

    Port (
        -- Clock
        i_CLK : in std_logic;
        
        ------------------
        -- Memory Ports --
        ------------------
        
        -- Instruction Memory
        i_IMem_Data : in std_logic_vector (XLENM1 downto 0);
        o_IMem_Addr : out std_logic_vector (XLENM1 downto 0);
        
        -- Data Memory
        io_DMem_Data    : inout std_logic_vector (XLENM1 downto 0);
        o_DMem_Addr     : out std_logic_vector (XLENM1 downto 0)
    );

end RISC_Plunne;

architecture arch_RISC_Plunne of RISC_Plunne is

    ----------------
    -- COMPONENTS --
    ----------------
    
    component PC is
        port ( 
            i_CLK : in std_logic;        
            i_INCR : in std_logic;
            i_SET : in std_logic_vector(XLENM1 downto 0);
            i_WREN : in std_logic;
            i_RST : in std_logic;
            o_PC : out std_logic_vector(XLENM1 downto 0)
        );
    end component;
    
    component IMem is
        port (
            i_CLK : std_logic;
            i_PC : std_logic_vector (XLENM1 to 0);
            i_IMem_Data : in std_logic_vector (XLENM1 downto 0);
            o_IMem_Addr : out std_logic_vector (XLENM1 downto 0);
            o_Instruction : out std_logic_vector (XLENM1 downto 0)
        );
    end component;
    
    component IDcd is
        port (
            i_CLK : std_logic;
            i_Instruction : in std_logic_vector (XLENM1 to 0);
            o_OpCode : out t_OpCode;
            o_Rd : out t_rd;
            o_Rs1 : out t_Rs1;
            o_Rs2 : out t_Rs2;
            o_Funct3 : out t_Funct3;
            o_Funct7 : out t_Funct7;
            o_Imm : out std_logic_vector(XLENM1 downto 0)
        );
    end component;
    
    component RegF is
        port (
            i_CLK : std_logic;
            i_Rd    : in t_Rd;
            i_Rs1   : in t_Rs1;
            i_Rs2   : in t_Rs2;
            i_WriteBack : in std_logic_vector(XLENM1 downto 0);
            o_XregA : out std_logic_vector(XLENM1 downto 0);
            o_XregB : out std_logic_vector(XLENM1 downto 0)
        );
    end component;
    
    component ImmU is
        -- port ( );
    end component;
    
    component BU is
        -- port ( );
    end component;
    
    component MUX_OpSel is
        port (
            i_OpCode : in t_OpCode;
            i_XregA : in std_logic_vector(XLENM1 downto 0);
            i_XregB : in std_logic_vector(XLENM1 downto 0);
            i_Imm : in std_logic_vector(XLENM1 downto 0);
            o_OpA : out std_logic_vector(XLENM1 downto 0);
            o_OpB : out std_logic_vector(XLENM1 downto 0)
        );
    end component;
    
    component ALU is
        port (
            i_CLK : std_logic;
            i_OpA : in std_logic_vector(XLENM1 downto 0);
            i_OpB : in std_logic_vector(XLENM1 downto 0);
            i_OpCode : in t_OpCode;
            i_Funct3 : in t_Funct3;
            i_Funct7 : in t_Funct7;
            i_Flags : in std_logic_vector(2 downto 0);
            o_Flags : out std_logic_vector(2 downto 0);
            o_Result : out std_logic_vector(XLENM1 downto 0)
        );
    end component;
    
    component DMem is
        port (
            i_CLK : std_logic;
            i_rd : out t_Rd;
            i_Result : in std_logic_vector (XLENM1 downto 0);
            o_WriteBack : out std_logic_vector (XLENM1 downto 0);
            o_DMem_Addr     : out std_logic_vector (XLENM1 downto 0);
            io_DMem_Data    : inout std_logic_vector (XLENM1 downto 0)
        );
    end component;
    
    -------------
    -- SIGNALS --
    -------------
    
    -- Clock
    signal s_CLK : std_logic;
    
    -- PC
    signal s_PC : std_logic_vector(XLENM1 downto 0);
    signal s_PC_Increment : std_logic;
    signal s_PC_SetPointer : std_logic_vector(XLENM1 downto 0);
    signal s_PC_WriteEnable : std_logic;
    signal s_PC_Reset : std_logic;
    
    -- Instruction
    signal s_IMem_Data : std_logic_vector (XLENM1 downto 0);
    signal s_IMem_Addr : std_logic_vector (XLENM1 downto 0);
    signal s_Instruction : std_logic_vector (XLENM1 downto 0);
    
    -- Decode
    signal s_OpCode : t_OpCode;
    signal s_Rd : t_Rd;
    signal s_Rs1 : t_Rs1;
    signal s_Rs2 : t_Rs2;
    signal s_Funct3 : t_Funct3;
    signal s_Funct7 : t_Funct7;
    signal s_Imm : std_logic_vector(XLENM1 downto 0);
    
    -- Xregs
    signal s_XregA : std_logic_vector(XLENM1 downto 0);
    signal s_XregB : std_logic_vector(XLENM1 downto 0);
    
    -- Operation
    signal s_OpA : std_logic_vector(XLENM1 downto 0);
    signal s_OpB : std_logic_vector(XLENM1 downto 0);
    signal s_PreFlags : std_logic_vector(2 downto 0);
    signal s_PostFlags : std_logic_vector(2 downto 0);
    signal s_Result : std_logic_vector(XLENM1 downto 0);
    
    -- WriteBack
    signal s_WriteBack : std_logic_vector(XLENM1 downto 0);
    
    -- Data
    signal s_DMem_Addr  : std_logic_vector (XLENM1 downto 0);
    signal s_DMem_Data  : std_logic_vector (XLENM1 downto 0);
     
begin

    ----------------------------
    -- COMPONENTS DECLARATION --
    ----------------------------
    
    c_PC : PC port map (
        i_CLK   => s_CLK,
        i_INCR  => s_PC_Increment,
        i_SET   => s_PC_SetPointer,
        i_WREN  => s_PC_WriteEnable,
        i_RST   => s_PC_Reset,
        o_PC    => s_PC
    );
    
    c_IMem : IMem port map (
        i_CLK           => s_CLK,
        i_PC            => s_PC,
        i_IMem_Data     => s_IMem_Data,
        o_IMem_Addr     => s_IMem_Addr,
        o_Instruction   => s_Instruction
    );
    
    c_IDcd : IDcd port map (
        i_CLK           => s_CLK,
        i_Instruction   => s_Instruction,
        o_OpCode        => s_OpCode,
        o_Rd            => s_Rd,
        o_Rs1           => s_Rs1,
        o_Rs2           => s_Rs2,
        o_Funct3        => s_Funct3,
        o_Funct7        => s_Funct7,
        o_Imm           => s_Imm
    );
    
    c_RegF : RegF port map (
        i_CLK           => s_CLK,
        i_Rd            => s_Rd,
        i_Rs1           => s_Rs1,
        i_Rs2           => s_Rs2,
        i_WriteBack     => s_WriteBack,
        o_XregA         => s_XregA,
        o_XregB         => s_XregB
    );
    
    c_MUX_OpSel : MUX_OpSel port map (
        i_OpCode    => s_OpCode,
        i_XregA     => s_XregA,
        i_XregB     => s_XregB,
        i_Imm       => s_Imm,
        o_OpA       => s_OpA,
        o_OpB       => s_OpB
    );
    
    c_ALU : ALU port map (
        i_CLK       => s_CLK,
        i_OpA       => s_OpA,
        i_OpB       => s_OpB,
        i_OpCode    => s_OpCode,
        i_Funct3    => s_Funct3,
        i_Funct7    => s_Funct7,
        i_Flags     => s_PreFlags,
        o_Flags     => s_PostFlags,
        o_Result    => s_Result
    );
    
    c_DMem : DMem port map (
        i_CLK           => s_CLK,
        i_Rd            => s_Rd,
        i_Result        => s_Result,
        o_WriteBack     => s_WriteBack,
        o_DMem_Addr     => s_DMem_Addr,
        io_DMem_Data    => s_DMem_Data
    );
    
    -------------
    -- PROCESS --
    -------------
    
    p_Core: process(i_CLK)
    begin
    
        if rising_edge(i_CLK) then
        end if;
        
    end process p_Core;
    
end arch_RISC_Plunne;
