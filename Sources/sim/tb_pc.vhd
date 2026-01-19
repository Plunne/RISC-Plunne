----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2025 02:25:56 PM
-- Design Name: 
-- Module Name: tb_pc - arch_tb_pc
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
use work.tb_common_pkg.all;
use work.tb_helpers_pkg.all;

entity tb_pc is
end tb_pc;

architecture arch_tb_pc of tb_pc is

    -- Test Step
    signal s_TestStep : integer := 0;
    
    -- Unit Signals
    signal s_CLK        : std_logic := '0';
    signal s_RST        : std_logic := '0';
    signal s_INCR       : std_logic := '0';
    signal s_SP_EN      : std_logic := '0';
    signal s_SP_ADDR    : tbt_Word := TB_X32_NULL;
    signal s_PC         : tbt_Word := TB_X32_NULL;
    
    -- Constants
    constant TB_PC_INCR : std_logic_vector(TB_XLENM1 downto 0) := X"00000004";
    constant TB_PC_TEST : std_logic_vector(TB_XLENM1 downto 0) := X"abcd5678";

begin

    --------------------------------------------------------------------
    -- Unit Under Test
    --------------------------------------------------------------------
    
    uut: entity work.pc port map (
        CLK     => s_CLK,
        RST     => s_RST,
        INCR    => s_INCR,
        SP_EN   => s_SP_EN,
        SP_ADDR => s_SP_ADDR,
        PC      => s_PC
    );
    
    --------------------------------------------------------------------
    -- PC_TU001 - PC ADDRESS SIZE
    --------------------------------------------------------------------
    
    test_pc_tu001 : process
    
    begin
    
    report "PC_TU001 - PC ADDRESS SIZE"; -- PC_R001
    
    -- Step 1 : Check PC size is equal to XLEN
    s_TestStep <= 1;
    wait for CLK_PERIOD;
    assert s_PC'length = TB_XLEN
        report "PC_TU001 STEP 1 FAIL : PC size does not match XLEN"
        severity error;

    report "PC_TU001 PASSED" severity note;
    wait;
    
    end process test_pc_tu001;
    
    --------------------------------------------------------------------
    -- PC_TU002 - SET POINTER UPDATE
    --------------------------------------------------------------------
    
    test_pc_tu002 : process
    
        variable pc_tmp : tbt_Word := TB_X32_NULL;
    
    begin

        report "PC_TU002 - SET POINTER UPDATE"; -- PC_R004, PC_R005, PC_R006
             
        -- Steps 1 & 2 : Init CLK
        s_TestStep <= 1;
        s_CLK   <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU002 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Steps 2 : Init RST, INCR, SP_EN
        s_TestStep <= 2;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_INCR = '0' and s_SP_EN = '0'
            report "PC_TU002 STEP 2 FAIL : Control Signals not 0"
            severity error;
        
        -- Step 3 : Set SP_ADDR
        s_TestStep <= 3;
        s_SP_ADDR <= TB_PC_TEST;
        wait for CLK_PERIOD;
        
        assert s_SP_ADDR = TB_PC_TEST
            report "PC_TU002 STEP 3 FAIL : SP_ADDR not holding new address"
            severity error;
        
        -- Step 4 : Assert SP_EN, no clock edge
        s_TestStep <= 4;
        pc_tmp := s_PC;
        s_SP_EN <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU002 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> PC must update
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_TEST
            report "PC_TU002 STEP 5 FAIL : PC not updated to SP_ADDR on rising edge"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        s_CLK <= '0';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_TEST
            report "PC_TU002 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Deassert SP_EN
        s_TestStep <= 7;
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_TEST
            report "PC_TU002 STEP 7 FAIL : PC changed after SP_EN deassertion"
            severity error;
        
        -- End of Test
        report "PC_TU002 PASSED" severity note;
        wait;
    
    end process test_pc_tu002;

end arch_tb_pc;
