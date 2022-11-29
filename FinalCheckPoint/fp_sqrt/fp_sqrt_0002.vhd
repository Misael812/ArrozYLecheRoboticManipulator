-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_sqrt_0002
-- VHDL created on Mon Nov 28 22:24:10 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_sqrt_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fp_sqrt_0002;

architecture normal of fp_sqrt_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpSqrtTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal signX_uid7_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid9_fpSqrtTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid10_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_x_uid12_fpSqrtTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_x_uid13_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_fpSqrtTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid17_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid18_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid19_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid20_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid21_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sBias_uid22_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid24_fpSqrtTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expREven_uid25_fpSqrtTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal sBiasM1_uid26_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expOddSig_uid27_fpSqrtTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid27_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid27_fpSqrtTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid27_fpSqrtTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expROdd_uid28_fpSqrtTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expX0PS_uid29_fpSqrtTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid29_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid30_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal addrFull_uid33_fpSqrtTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal yAddr_uid35_fpSqrtTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal yForPe_uid36_fpSqrtTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal yForPe_uid36_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid38_fpSqrtTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal expInc_uid38_fpSqrtTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracRPostProcessings_uid39_fpSqrtTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expR_uid40_fpSqrtTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid40_fpSqrtTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid40_fpSqrtTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid40_fpSqrtTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal invSignX_uid41_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid42_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid43_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid44_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid45_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excConc_uid46_fpSqrtTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracSelIn_uid47_fpSqrtTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracSel_uid48_fpSqrtTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRR_uid51_fpSqrtTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRR_uid51_fpSqrtTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid53_fpSqrtTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracNaN_uid54_fpSqrtTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid58_fpSqrtTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal negZero_uid59_fpSqrtTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSqrt_uid60_fpSqrtTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC0_uid62_sqrtTables_q : STD_LOGIC_VECTOR (14 downto 0);
    signal memoryC1_uid65_sqrtTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal lowRangeB_uid72_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid72_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid73_invPolyEval_b : STD_LOGIC_VECTOR (9 downto 0);
    signal s1sumAHighB_uid74_invPolyEval_a : STD_LOGIC_VECTOR (15 downto 0);
    signal s1sumAHighB_uid74_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal s1sumAHighB_uid74_invPolyEval_o : STD_LOGIC_VECTOR (15 downto 0);
    signal s1sumAHighB_uid74_invPolyEval_q : STD_LOGIC_VECTOR (15 downto 0);
    signal s1_uid75_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal osig_uid78_pT1_uid71_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_reset : std_logic;
    type prodXY_uid77_pT1_uid71_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(5 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_a0 : prodXY_uid77_pT1_uid71_invPolyEval_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid77_pT1_uid71_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid77_pT1_uid71_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_c0 : prodXY_uid77_pT1_uid71_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid77_pT1_uid71_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid77_pT1_uid71_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(6 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_l : prodXY_uid77_pT1_uid71_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_p : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_u : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_w : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_x : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_y : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_s : prodXY_uid77_pT1_uid71_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_qq : STD_LOGIC_VECTOR (16 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_q : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid77_pT1_uid71_invPolyEval_cma_ena1 : std_logic;
    signal redist0_yAddr_uid35_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_expOddSelect_uid30_fpSqrtTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_fracXIsZero_uid15_fpSqrtTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_signX_uid7_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_expX_uid6_fpSqrtTest_b_2_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- signX_uid7_fpSqrtTest(BITSELECT,6)@0
    signX_uid7_fpSqrtTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- redist3_signX_uid7_fpSqrtTest_b_2(DELAY,83)
    redist3_signX_uid7_fpSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_fpSqrtTest_b, xout => redist3_signX_uid7_fpSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWE_uid10_fpSqrtTest_q <= "00000";

    -- expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_b <= a(14 downto 10);

    -- redist4_expX_uid6_fpSqrtTest_b_2(DELAY,84)
    redist4_expX_uid6_fpSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpSqrtTest_b, xout => redist4_expX_uid6_fpSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- excZ_x_uid13_fpSqrtTest(LOGICAL,12)@2
    excZ_x_uid13_fpSqrtTest_q <= "1" WHEN redist4_expX_uid6_fpSqrtTest_b_2_q = cstAllZWE_uid10_fpSqrtTest_q ELSE "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- negZero_uid59_fpSqrtTest(LOGICAL,58)@2
    negZero_uid59_fpSqrtTest_q <= excZ_x_uid13_fpSqrtTest_q and redist3_signX_uid7_fpSqrtTest_b_2_q;

    -- cstAllOWE_uid8_fpSqrtTest(CONSTANT,7)
    cstAllOWE_uid8_fpSqrtTest_q <= "11111";

    -- expX0PS_uid29_fpSqrtTest(BITSELECT,28)@0
    expX0PS_uid29_fpSqrtTest_in <= STD_LOGIC_VECTOR(expX_uid6_fpSqrtTest_b(0 downto 0));
    expX0PS_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR(expX0PS_uid29_fpSqrtTest_in(0 downto 0));

    -- expOddSelect_uid30_fpSqrtTest(LOGICAL,29)@0
    expOddSelect_uid30_fpSqrtTest_q <= not (expX0PS_uid29_fpSqrtTest_b);

    -- frac_x_uid12_fpSqrtTest(BITSELECT,11)@0
    frac_x_uid12_fpSqrtTest_b <= a(9 downto 0);

    -- addrFull_uid33_fpSqrtTest(BITJOIN,32)@0
    addrFull_uid33_fpSqrtTest_q <= expOddSelect_uid30_fpSqrtTest_q & frac_x_uid12_fpSqrtTest_b;

    -- yAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    yAddr_uid35_fpSqrtTest_b <= addrFull_uid33_fpSqrtTest_q(10 downto 6);

    -- memoryC1_uid65_sqrtTables(LOOKUP,64)@0
    memoryC1_uid65_sqrtTables_combproc: PROCESS (yAddr_uid35_fpSqrtTest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid35_fpSqrtTest_b) IS
            WHEN "00000" => memoryC1_uid65_sqrtTables_q <= "0011111101";
            WHEN "00001" => memoryC1_uid65_sqrtTables_q <= "0011110100";
            WHEN "00010" => memoryC1_uid65_sqrtTables_q <= "0011101111";
            WHEN "00011" => memoryC1_uid65_sqrtTables_q <= "0011101000";
            WHEN "00100" => memoryC1_uid65_sqrtTables_q <= "0011100011";
            WHEN "00101" => memoryC1_uid65_sqrtTables_q <= "0011011101";
            WHEN "00110" => memoryC1_uid65_sqrtTables_q <= "0011011000";
            WHEN "00111" => memoryC1_uid65_sqrtTables_q <= "0011010011";
            WHEN "01000" => memoryC1_uid65_sqrtTables_q <= "0011001111";
            WHEN "01001" => memoryC1_uid65_sqrtTables_q <= "0011001011";
            WHEN "01010" => memoryC1_uid65_sqrtTables_q <= "0011000111";
            WHEN "01011" => memoryC1_uid65_sqrtTables_q <= "0011000011";
            WHEN "01100" => memoryC1_uid65_sqrtTables_q <= "0011000000";
            WHEN "01101" => memoryC1_uid65_sqrtTables_q <= "0010111101";
            WHEN "01110" => memoryC1_uid65_sqrtTables_q <= "0010111001";
            WHEN "01111" => memoryC1_uid65_sqrtTables_q <= "0010110110";
            WHEN "10000" => memoryC1_uid65_sqrtTables_q <= "0101100100";
            WHEN "10001" => memoryC1_uid65_sqrtTables_q <= "0101011011";
            WHEN "10010" => memoryC1_uid65_sqrtTables_q <= "0101010000";
            WHEN "10011" => memoryC1_uid65_sqrtTables_q <= "0101001000";
            WHEN "10100" => memoryC1_uid65_sqrtTables_q <= "0101000000";
            WHEN "10101" => memoryC1_uid65_sqrtTables_q <= "0100111000";
            WHEN "10110" => memoryC1_uid65_sqrtTables_q <= "0100110010";
            WHEN "10111" => memoryC1_uid65_sqrtTables_q <= "0100101010";
            WHEN "11000" => memoryC1_uid65_sqrtTables_q <= "0100100101";
            WHEN "11001" => memoryC1_uid65_sqrtTables_q <= "0100011111";
            WHEN "11010" => memoryC1_uid65_sqrtTables_q <= "0100011001";
            WHEN "11011" => memoryC1_uid65_sqrtTables_q <= "0100010100";
            WHEN "11100" => memoryC1_uid65_sqrtTables_q <= "0100001111";
            WHEN "11101" => memoryC1_uid65_sqrtTables_q <= "0100001011";
            WHEN "11110" => memoryC1_uid65_sqrtTables_q <= "0100000110";
            WHEN "11111" => memoryC1_uid65_sqrtTables_q <= "0100000010";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid65_sqrtTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- yForPe_uid36_fpSqrtTest(BITSELECT,35)@0
    yForPe_uid36_fpSqrtTest_in <= frac_x_uid12_fpSqrtTest_b(5 downto 0);
    yForPe_uid36_fpSqrtTest_b <= yForPe_uid36_fpSqrtTest_in(5 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid77_pT1_uid71_invPolyEval_cma(CHAINMULTADD,79)@0 + 2
    prodXY_uid77_pT1_uid71_invPolyEval_cma_reset <= areset;
    prodXY_uid77_pT1_uid71_invPolyEval_cma_ena0 <= '1';
    prodXY_uid77_pT1_uid71_invPolyEval_cma_ena1 <= prodXY_uid77_pT1_uid71_invPolyEval_cma_ena0;
    prodXY_uid77_pT1_uid71_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid77_pT1_uid71_invPolyEval_cma_a0(0),7));
    prodXY_uid77_pT1_uid71_invPolyEval_cma_p(0) <= prodXY_uid77_pT1_uid71_invPolyEval_cma_l(0) * prodXY_uid77_pT1_uid71_invPolyEval_cma_c0(0);
    prodXY_uid77_pT1_uid71_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid77_pT1_uid71_invPolyEval_cma_p(0),18);
    prodXY_uid77_pT1_uid71_invPolyEval_cma_w(0) <= prodXY_uid77_pT1_uid71_invPolyEval_cma_u(0);
    prodXY_uid77_pT1_uid71_invPolyEval_cma_x(0) <= prodXY_uid77_pT1_uid71_invPolyEval_cma_w(0);
    prodXY_uid77_pT1_uid71_invPolyEval_cma_y(0) <= prodXY_uid77_pT1_uid71_invPolyEval_cma_x(0);
    prodXY_uid77_pT1_uid71_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid77_pT1_uid71_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid77_pT1_uid71_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid77_pT1_uid71_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid77_pT1_uid71_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yForPe_uid36_fpSqrtTest_b),6);
                prodXY_uid77_pT1_uid71_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC1_uid65_sqrtTables_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid77_pT1_uid71_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid77_pT1_uid71_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid77_pT1_uid71_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid77_pT1_uid71_invPolyEval_cma_s(0) <= prodXY_uid77_pT1_uid71_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid77_pT1_uid71_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 17, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid77_pT1_uid71_invPolyEval_cma_s(0)(16 downto 0)), xout => prodXY_uid77_pT1_uid71_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid77_pT1_uid71_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid77_pT1_uid71_invPolyEval_cma_qq(15 downto 0));

    -- osig_uid78_pT1_uid71_invPolyEval(BITSELECT,77)@2
    osig_uid78_pT1_uid71_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid77_pT1_uid71_invPolyEval_cma_q(15 downto 4));

    -- highBBits_uid73_invPolyEval(BITSELECT,72)@2
    highBBits_uid73_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid78_pT1_uid71_invPolyEval_b(11 downto 2));

    -- redist0_yAddr_uid35_fpSqrtTest_b_2(DELAY,80)
    redist0_yAddr_uid35_fpSqrtTest_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid35_fpSqrtTest_b, xout => redist0_yAddr_uid35_fpSqrtTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC0_uid62_sqrtTables(LOOKUP,61)@2
    memoryC0_uid62_sqrtTables_combproc: PROCESS (redist0_yAddr_uid35_fpSqrtTest_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist0_yAddr_uid35_fpSqrtTest_b_2_q) IS
            WHEN "00000" => memoryC0_uid62_sqrtTables_q <= "010000000000100";
            WHEN "00001" => memoryC0_uid62_sqrtTables_q <= "010000100000001";
            WHEN "00010" => memoryC0_uid62_sqrtTables_q <= "010000111110101";
            WHEN "00011" => memoryC0_uid62_sqrtTables_q <= "010001011100011";
            WHEN "00100" => memoryC0_uid62_sqrtTables_q <= "010001111001011";
            WHEN "00101" => memoryC0_uid62_sqrtTables_q <= "010010010101101";
            WHEN "00110" => memoryC0_uid62_sqrtTables_q <= "010010110001010";
            WHEN "00111" => memoryC0_uid62_sqrtTables_q <= "010011001100010";
            WHEN "01000" => memoryC0_uid62_sqrtTables_q <= "010011100110101";
            WHEN "01001" => memoryC0_uid62_sqrtTables_q <= "010100000000100";
            WHEN "01010" => memoryC0_uid62_sqrtTables_q <= "010100011001111";
            WHEN "01011" => memoryC0_uid62_sqrtTables_q <= "010100110010110";
            WHEN "01100" => memoryC0_uid62_sqrtTables_q <= "010101001011001";
            WHEN "01101" => memoryC0_uid62_sqrtTables_q <= "010101100011001";
            WHEN "01110" => memoryC0_uid62_sqrtTables_q <= "010101111010110";
            WHEN "01111" => memoryC0_uid62_sqrtTables_q <= "010110010001111";
            WHEN "10000" => memoryC0_uid62_sqrtTables_q <= "010110101000110";
            WHEN "10001" => memoryC0_uid62_sqrtTables_q <= "010111010101010";
            WHEN "10010" => memoryC0_uid62_sqrtTables_q <= "011000000000101";
            WHEN "10011" => memoryC0_uid62_sqrtTables_q <= "011000101010101";
            WHEN "10100" => memoryC0_uid62_sqrtTables_q <= "011001010011101";
            WHEN "10101" => memoryC0_uid62_sqrtTables_q <= "011001111011101";
            WHEN "10110" => memoryC0_uid62_sqrtTables_q <= "011010100010101";
            WHEN "10111" => memoryC0_uid62_sqrtTables_q <= "011011001000111";
            WHEN "11000" => memoryC0_uid62_sqrtTables_q <= "011011101110001";
            WHEN "11001" => memoryC0_uid62_sqrtTables_q <= "011100010010110";
            WHEN "11010" => memoryC0_uid62_sqrtTables_q <= "011100110110101";
            WHEN "11011" => memoryC0_uid62_sqrtTables_q <= "011101011001110";
            WHEN "11100" => memoryC0_uid62_sqrtTables_q <= "011101111100010";
            WHEN "11101" => memoryC0_uid62_sqrtTables_q <= "011110011110001";
            WHEN "11110" => memoryC0_uid62_sqrtTables_q <= "011110111111100";
            WHEN "11111" => memoryC0_uid62_sqrtTables_q <= "011111100000010";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid62_sqrtTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid74_invPolyEval(ADD,73)@2
    s1sumAHighB_uid74_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => memoryC0_uid62_sqrtTables_q(14)) & memoryC0_uid62_sqrtTables_q));
    s1sumAHighB_uid74_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 10 => highBBits_uid73_invPolyEval_b(9)) & highBBits_uid73_invPolyEval_b));
    s1sumAHighB_uid74_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid74_invPolyEval_a) + SIGNED(s1sumAHighB_uid74_invPolyEval_b));
    s1sumAHighB_uid74_invPolyEval_q <= s1sumAHighB_uid74_invPolyEval_o(15 downto 0);

    -- lowRangeB_uid72_invPolyEval(BITSELECT,71)@2
    lowRangeB_uid72_invPolyEval_in <= osig_uid78_pT1_uid71_invPolyEval_b(1 downto 0);
    lowRangeB_uid72_invPolyEval_b <= lowRangeB_uid72_invPolyEval_in(1 downto 0);

    -- s1_uid75_invPolyEval(BITJOIN,74)@2
    s1_uid75_invPolyEval_q <= s1sumAHighB_uid74_invPolyEval_q & lowRangeB_uid72_invPolyEval_b;

    -- expInc_uid38_fpSqrtTest(BITSELECT,37)@2
    expInc_uid38_fpSqrtTest_in <= STD_LOGIC_VECTOR(s1_uid75_invPolyEval_q(16 downto 0));
    expInc_uid38_fpSqrtTest_b <= STD_LOGIC_VECTOR(expInc_uid38_fpSqrtTest_in(16 downto 16));

    -- sBiasM1_uid26_fpSqrtTest(CONSTANT,25)
    sBiasM1_uid26_fpSqrtTest_q <= "01110";

    -- expOddSig_uid27_fpSqrtTest(ADD,26)@2
    expOddSig_uid27_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist4_expX_uid6_fpSqrtTest_b_2_q);
    expOddSig_uid27_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid26_fpSqrtTest_q);
    expOddSig_uid27_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid27_fpSqrtTest_a) + UNSIGNED(expOddSig_uid27_fpSqrtTest_b));
    expOddSig_uid27_fpSqrtTest_q <= expOddSig_uid27_fpSqrtTest_o(5 downto 0);

    -- expROdd_uid28_fpSqrtTest(BITSELECT,27)@2
    expROdd_uid28_fpSqrtTest_b <= expOddSig_uid27_fpSqrtTest_q(5 downto 1);

    -- sBias_uid22_fpSqrtTest(CONSTANT,21)
    sBias_uid22_fpSqrtTest_q <= "01111";

    -- expEvenSig_uid24_fpSqrtTest(ADD,23)@2
    expEvenSig_uid24_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & redist4_expX_uid6_fpSqrtTest_b_2_q);
    expEvenSig_uid24_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid22_fpSqrtTest_q);
    expEvenSig_uid24_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid24_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid24_fpSqrtTest_b));
    expEvenSig_uid24_fpSqrtTest_q <= expEvenSig_uid24_fpSqrtTest_o(5 downto 0);

    -- expREven_uid25_fpSqrtTest(BITSELECT,24)@2
    expREven_uid25_fpSqrtTest_b <= expEvenSig_uid24_fpSqrtTest_q(5 downto 1);

    -- redist1_expOddSelect_uid30_fpSqrtTest_q_2(DELAY,81)
    redist1_expOddSelect_uid30_fpSqrtTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOddSelect_uid30_fpSqrtTest_q, xout => redist1_expOddSelect_uid30_fpSqrtTest_q_2_q, clk => clk, aclr => areset );

    -- expRMux_uid31_fpSqrtTest(MUX,30)@2
    expRMux_uid31_fpSqrtTest_s <= redist1_expOddSelect_uid30_fpSqrtTest_q_2_q;
    expRMux_uid31_fpSqrtTest_combproc: PROCESS (expRMux_uid31_fpSqrtTest_s, expREven_uid25_fpSqrtTest_b, expROdd_uid28_fpSqrtTest_b)
    BEGIN
        CASE (expRMux_uid31_fpSqrtTest_s) IS
            WHEN "0" => expRMux_uid31_fpSqrtTest_q <= expREven_uid25_fpSqrtTest_b;
            WHEN "1" => expRMux_uid31_fpSqrtTest_q <= expROdd_uid28_fpSqrtTest_b;
            WHEN OTHERS => expRMux_uid31_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expR_uid40_fpSqrtTest(ADD,39)@2
    expR_uid40_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expRMux_uid31_fpSqrtTest_q);
    expR_uid40_fpSqrtTest_b <= STD_LOGIC_VECTOR("00000" & expInc_uid38_fpSqrtTest_b);
    expR_uid40_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid40_fpSqrtTest_a) + UNSIGNED(expR_uid40_fpSqrtTest_b));
    expR_uid40_fpSqrtTest_q <= expR_uid40_fpSqrtTest_o(5 downto 0);

    -- expRR_uid51_fpSqrtTest(BITSELECT,50)@2
    expRR_uid51_fpSqrtTest_in <= expR_uid40_fpSqrtTest_q(4 downto 0);
    expRR_uid51_fpSqrtTest_b <= expRR_uid51_fpSqrtTest_in(4 downto 0);

    -- expXIsMax_uid14_fpSqrtTest(LOGICAL,13)@2
    expXIsMax_uid14_fpSqrtTest_q <= "1" WHEN redist4_expX_uid6_fpSqrtTest_b_2_q = cstAllOWE_uid8_fpSqrtTest_q ELSE "0";

    -- invExpXIsMax_uid19_fpSqrtTest(LOGICAL,18)@2
    invExpXIsMax_uid19_fpSqrtTest_q <= not (expXIsMax_uid14_fpSqrtTest_q);

    -- InvExpXIsZero_uid20_fpSqrtTest(LOGICAL,19)@2
    InvExpXIsZero_uid20_fpSqrtTest_q <= not (excZ_x_uid13_fpSqrtTest_q);

    -- excR_x_uid21_fpSqrtTest(LOGICAL,20)@2
    excR_x_uid21_fpSqrtTest_q <= InvExpXIsZero_uid20_fpSqrtTest_q and invExpXIsMax_uid19_fpSqrtTest_q;

    -- minReg_uid43_fpSqrtTest(LOGICAL,42)@2
    minReg_uid43_fpSqrtTest_q <= excR_x_uid21_fpSqrtTest_q and redist3_signX_uid7_fpSqrtTest_b_2_q;

    -- cstZeroWF_uid9_fpSqrtTest(CONSTANT,8)
    cstZeroWF_uid9_fpSqrtTest_q <= "0000000000";

    -- fracXIsZero_uid15_fpSqrtTest(LOGICAL,14)@0 + 1
    fracXIsZero_uid15_fpSqrtTest_qi <= "1" WHEN cstZeroWF_uid9_fpSqrtTest_q = frac_x_uid12_fpSqrtTest_b ELSE "0";
    fracXIsZero_uid15_fpSqrtTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid15_fpSqrtTest_qi, xout => fracXIsZero_uid15_fpSqrtTest_q, clk => clk, aclr => areset );

    -- redist2_fracXIsZero_uid15_fpSqrtTest_q_2(DELAY,82)
    redist2_fracXIsZero_uid15_fpSqrtTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid15_fpSqrtTest_q, xout => redist2_fracXIsZero_uid15_fpSqrtTest_q_2_q, clk => clk, aclr => areset );

    -- excI_x_uid17_fpSqrtTest(LOGICAL,16)@2
    excI_x_uid17_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and redist2_fracXIsZero_uid15_fpSqrtTest_q_2_q;

    -- minInf_uid44_fpSqrtTest(LOGICAL,43)@2
    minInf_uid44_fpSqrtTest_q <= excI_x_uid17_fpSqrtTest_q and redist3_signX_uid7_fpSqrtTest_b_2_q;

    -- fracXIsNotZero_uid16_fpSqrtTest(LOGICAL,15)@2
    fracXIsNotZero_uid16_fpSqrtTest_q <= not (redist2_fracXIsZero_uid15_fpSqrtTest_q_2_q);

    -- excN_x_uid18_fpSqrtTest(LOGICAL,17)@2
    excN_x_uid18_fpSqrtTest_q <= expXIsMax_uid14_fpSqrtTest_q and fracXIsNotZero_uid16_fpSqrtTest_q;

    -- excRNaN_uid45_fpSqrtTest(LOGICAL,44)@2
    excRNaN_uid45_fpSqrtTest_q <= excN_x_uid18_fpSqrtTest_q or minInf_uid44_fpSqrtTest_q or minReg_uid43_fpSqrtTest_q;

    -- invSignX_uid41_fpSqrtTest(LOGICAL,40)@2
    invSignX_uid41_fpSqrtTest_q <= not (redist3_signX_uid7_fpSqrtTest_b_2_q);

    -- inInfAndNotNeg_uid42_fpSqrtTest(LOGICAL,41)@2
    inInfAndNotNeg_uid42_fpSqrtTest_q <= excI_x_uid17_fpSqrtTest_q and invSignX_uid41_fpSqrtTest_q;

    -- excConc_uid46_fpSqrtTest(BITJOIN,45)@2
    excConc_uid46_fpSqrtTest_q <= excRNaN_uid45_fpSqrtTest_q & inInfAndNotNeg_uid42_fpSqrtTest_q & excZ_x_uid13_fpSqrtTest_q;

    -- fracSelIn_uid47_fpSqrtTest(BITJOIN,46)@2
    fracSelIn_uid47_fpSqrtTest_q <= redist3_signX_uid7_fpSqrtTest_b_2_q & excConc_uid46_fpSqrtTest_q;

    -- fracSel_uid48_fpSqrtTest(LOOKUP,47)@2
    fracSel_uid48_fpSqrtTest_combproc: PROCESS (fracSelIn_uid47_fpSqrtTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (fracSelIn_uid47_fpSqrtTest_q) IS
            WHEN "0000" => fracSel_uid48_fpSqrtTest_q <= "01";
            WHEN "0001" => fracSel_uid48_fpSqrtTest_q <= "00";
            WHEN "0010" => fracSel_uid48_fpSqrtTest_q <= "10";
            WHEN "0011" => fracSel_uid48_fpSqrtTest_q <= "00";
            WHEN "0100" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "0101" => fracSel_uid48_fpSqrtTest_q <= "00";
            WHEN "0110" => fracSel_uid48_fpSqrtTest_q <= "10";
            WHEN "0111" => fracSel_uid48_fpSqrtTest_q <= "00";
            WHEN "1000" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1001" => fracSel_uid48_fpSqrtTest_q <= "00";
            WHEN "1010" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1011" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1100" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1101" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1110" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN "1111" => fracSel_uid48_fpSqrtTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           fracSel_uid48_fpSqrtTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid53_fpSqrtTest(MUX,52)@2
    expRPostExc_uid53_fpSqrtTest_s <= fracSel_uid48_fpSqrtTest_q;
    expRPostExc_uid53_fpSqrtTest_combproc: PROCESS (expRPostExc_uid53_fpSqrtTest_s, cstAllZWE_uid10_fpSqrtTest_q, expRR_uid51_fpSqrtTest_b, cstAllOWE_uid8_fpSqrtTest_q)
    BEGIN
        CASE (expRPostExc_uid53_fpSqrtTest_s) IS
            WHEN "00" => expRPostExc_uid53_fpSqrtTest_q <= cstAllZWE_uid10_fpSqrtTest_q;
            WHEN "01" => expRPostExc_uid53_fpSqrtTest_q <= expRR_uid51_fpSqrtTest_b;
            WHEN "10" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN "11" => expRPostExc_uid53_fpSqrtTest_q <= cstAllOWE_uid8_fpSqrtTest_q;
            WHEN OTHERS => expRPostExc_uid53_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracNaN_uid54_fpSqrtTest(CONSTANT,53)
    fracNaN_uid54_fpSqrtTest_q <= "0000000001";

    -- fracRPostProcessings_uid39_fpSqrtTest(BITSELECT,38)@2
    fracRPostProcessings_uid39_fpSqrtTest_in <= s1_uid75_invPolyEval_q(14 downto 0);
    fracRPostProcessings_uid39_fpSqrtTest_b <= fracRPostProcessings_uid39_fpSqrtTest_in(14 downto 5);

    -- fracRPostExc_uid58_fpSqrtTest(MUX,57)@2
    fracRPostExc_uid58_fpSqrtTest_s <= fracSel_uid48_fpSqrtTest_q;
    fracRPostExc_uid58_fpSqrtTest_combproc: PROCESS (fracRPostExc_uid58_fpSqrtTest_s, cstZeroWF_uid9_fpSqrtTest_q, fracRPostProcessings_uid39_fpSqrtTest_b, fracNaN_uid54_fpSqrtTest_q)
    BEGIN
        CASE (fracRPostExc_uid58_fpSqrtTest_s) IS
            WHEN "00" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "01" => fracRPostExc_uid58_fpSqrtTest_q <= fracRPostProcessings_uid39_fpSqrtTest_b;
            WHEN "10" => fracRPostExc_uid58_fpSqrtTest_q <= cstZeroWF_uid9_fpSqrtTest_q;
            WHEN "11" => fracRPostExc_uid58_fpSqrtTest_q <= fracNaN_uid54_fpSqrtTest_q;
            WHEN OTHERS => fracRPostExc_uid58_fpSqrtTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSqrt_uid60_fpSqrtTest(BITJOIN,59)@2
    RSqrt_uid60_fpSqrtTest_q <= negZero_uid59_fpSqrtTest_q & expRPostExc_uid53_fpSqrtTest_q & fracRPostExc_uid58_fpSqrtTest_q;

    -- xOut(GPOUT,4)@2
    q <= RSqrt_uid60_fpSqrtTest_q;

END normal;
