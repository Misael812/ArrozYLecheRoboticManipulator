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

-- VHDL created from fp_atan2_0002
-- VHDL created on Mon Nov 28 22:21:33 2022


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

entity fp_atan2_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fp_atan2_0002;

architecture normal of fp_atan2_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid7_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal exp_xIn_uid9_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_xIn_uid10_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_xIn_uid15_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_xIn_uid16_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_yIn_uid23_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_yIn_uid24_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expXIsMax_uid26_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_yIn_uid29_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_yIn_uid30_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yInSign_uid34_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xInSign_uid35_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zwEwF_uid36_fpArctan2Test_q : STD_LOGIC_VECTOR (14 downto 0);
    signal yInExpFrac_uid39_fpArctan2Test_q : STD_LOGIC_VECTOR (14 downto 0);
    signal yInZero_uid40_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZero_uid40_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xInExpFrac_uid43_fpArctan2Test_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xInZero_uid44_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZero_uid44_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid46_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracX_uid47_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal singX_uid48_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstNaNWF_uid51_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid52_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBias_uid53_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasM1_uid54_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasMWF_uid55_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasP1_uid56_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstWFP1_uid57_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstWFP2_uid58_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excZ_div_uid450_uid65_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_div_uid450_uid65_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid66_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid66_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid67_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid67_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_div_uid69_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid75_fpArctan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal fracXIsZero_uid74_fpArctan2Test_a : STD_LOGIC_VECTOR (19 downto 0);
    signal fracXIsZero_uid74_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsBias_uid77_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsOne_uid78_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal piO2_uid79_fpArctan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal piO4_uid80_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstPiO2_uid81_fpArctan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal cstPiO2_uid81_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fpPiO2C_uid82_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstPiO4_uid84_fpArctan2Test_in : STD_LOGIC_VECTOR (9 downto 0);
    signal cstPiO4_uid84_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fpPiO4C_uid85_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal constOut_uid87_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal constOut_uid87_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xyInInf_uid88_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xyInInf_uid88_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal arctanIsConst_uid89_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal path2_uid90_fpArctan2Test_a : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid90_fpArctan2Test_b : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid90_fpArctan2Test_o : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid90_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid92_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid92_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal oFracU_uid95_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal biasMwShift_uid96_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_a : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_b : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_o : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid97_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftBias_uid98_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftValue_uid99_fpArctan2Test_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid99_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid99_fpArctan2Test_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid99_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal xMSB_uid100_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zS_uid102_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePostNeg_uid103_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePostNeg_uid103_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cst01pWShift_uid104_fpArctan2Test_q : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracUExt_uid105_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal fxpShifterBits_uid106_fpArctan2Test_in : STD_LOGIC_VECTOR (2 downto 0);
    signal fxpShifterBits_uid106_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y_uid108_fpArctan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal y_uid108_fpArctan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpAtanXOXRes_uid113_fpArctan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal fxpAtanXOXRes_uid113_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal normBit_uid115_fpArctan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal normBit_uid115_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3High_uid116_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPath3High_uid116_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath3Low_uid117_fpArctan2Test_in : STD_LOGIC_VECTOR (21 downto 0);
    signal fracRPath3Low_uid117_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath3Pre_uid118_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3Pre_uid118_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invNormBit_uid119_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid120_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3PreRnd_uid121_fpArctan2Test_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPath3PreRnd_uid121_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPath3PreRnd_uid122_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal fracRPath3PostRnd_uid125_fpArctan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal shiftOut_uid129_fpArctan2Test_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid129_fpArctan2Test_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid129_fpArctan2Test_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid129_fpArctan2Test_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracRPath2_uid132_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sValPostSOutR_uid133_fpArctan2Test_in : STD_LOGIC_VECTOR (3 downto 0);
    signal sValPostSOutR_uid133_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bPostPad_uid136_fpArctan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal path2Diff_uid137_fpArctan2Test_a : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid137_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid137_fpArctan2Test_o : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid137_fpArctan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_in : STD_LOGIC_VECTOR (12 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_in : STD_LOGIC_VECTOR (10 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPath2_uid142_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath2_uid142_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracConc_uid145_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid146_fpArctan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal pathSelBits_uid149_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracOutMuxSelEnc_uid150_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid152_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid152_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCalc_uid154_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRCalc_uid154_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstPi_uid155_fpArctan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_a : STD_LOGIC_VECTOR (6 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_b : STD_LOGIC_VECTOR (6 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_o : STD_LOGIC_VECTOR (6 downto 0);
    signal sOutAlignRes_uid157_fpArctan2Test_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZOrsOutAlignRes_uid158_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sValPostSOutRange_uid161_fpArctan2Test_in : STD_LOGIC_VECTOR (3 downto 0);
    signal sValPostSOutRange_uid161_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracRCalc_uid162_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal padConst_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightPaddedIn_uid164_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal padACst_uid167_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aPostPad_uid168_fpArctan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal subRes_uid169_fpArctan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal subRes_uid169_fpArctan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal subRes_uid169_fpArctan2Test_o : STD_LOGIC_VECTOR (23 downto 0);
    signal subRes_uid169_fpArctan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal subResNormBit_uid170_fpArctan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal subResNormBit_uid170_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal subResHigh_uid171_fpArctan2Test_in : STD_LOGIC_VECTOR (21 downto 0);
    signal subResHigh_uid171_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal subResLow_uid172_fpArctan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal subResLow_uid172_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRSub_uid173_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRSub_uid173_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRSub_uid174_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRSub_uid174_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xInIsLTEZero_uid175_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInIsLTEZero_uid175_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid176_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid176_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRFinal_uid177_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRFinal_uid177_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invYInSign_uid178_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXInSign_uid179_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero2_uid180_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero1_uid181_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid182_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid183_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid183_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid184_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid185_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid187_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid187_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid188_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid188_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid189_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid190_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid190_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid191_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal updatedY_uid203_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracYZero_uid202_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (10 downto 0);
    signal fracYZero_uid202_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid210_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid210_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid216_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid218_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid224_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid224_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid230_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid232_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid233_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expXmY_uid234_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid235_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (6 downto 0);
    signal yAddr_uid238_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (6 downto 0);
    signal yPE_uid239_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (2 downto 0);
    signal fracYPostZ_uid243_div_uid45_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid243_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid245_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal norm_uid254_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal divValPreNormLow_uid256_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (10 downto 0);
    signal divValPreNormLow_uid256_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal normFracRnd_uid257_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid257_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracRnd_uid258_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rndOp_uid262_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (19 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (19 downto 0);
    signal expFracPostRnd_uid263_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal fracRPreExc_uid265_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid265_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excRPreExc_uid266_div_uid45_fpArctan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal excRPreExc_uid266_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expRExt_uid267_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expUdf_uid268_div_uid45_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expOvf_uid271_div_uid45_fpArctan2Test_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid272_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid274_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid276_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid277_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid278_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid279_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid280_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid281_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid282_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid283_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid284_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid285_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid286_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid290_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid290_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid294_div_uid45_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid294_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid295_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid296_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid297_div_uid45_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cst2BiasM1_uid306_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cst2Bias_uid307_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid319_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid320_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid322_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid323_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid324_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid327_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (9 downto 0);
    signal y_uid327_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid332_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expRComp_uid333_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRComp_uid333_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal udf_uid334_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid334_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fxpInverseRes_uid337_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpInverseRes_uid337_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in : STD_LOGIC_VECTOR (9 downto 0);
    signal fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRCalc_uid340_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid340_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCalc_uid341_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid341_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xRegAndUdf_uid342_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid344_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid347_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid347_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid348_z_uid91_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid348_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid349_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid350_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid351_z_uid91_fpArctan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC0_uid353_atan2Tables_q : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid356_atan2Tables_q : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid363_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid363_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid364_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal s1sumAHighB_uid365_invPolyEval_a : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid365_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid365_invPolyEval_o : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid365_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal s1_uid366_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC0_uid368_invTables_q : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid371_invTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal lowRangeB_uid378_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid378_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid379_invPolyEval_b : STD_LOGIC_VECTOR (9 downto 0);
    signal s1sumAHighB_uid380_invPolyEval_a : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid380_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid380_invPolyEval_o : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid380_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal s1_uid381_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal osig_uid384_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal memoryC0_uid386_inverseTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid387_inverseTables_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid388_inverseTables_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC1_uid390_inverseTables_q : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid397_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid397_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid398_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal s1sumAHighB_uid399_invPolyEval_a : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid399_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid399_invPolyEval_o : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid399_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal s1_uid400_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal prodXY_uid402_pT1_uid362_invPolyEval_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid402_pT1_uid362_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal prodXY_uid402_pT1_uid362_invPolyEval_s1 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid402_pT1_uid362_invPolyEval_pr : SIGNED (15 downto 0);
    signal prodXY_uid402_pT1_uid362_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal osig_uid403_pT1_uid362_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal osig_uid406_pT1_uid377_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid408_pT1_uid396_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal prodXY_uid408_pT1_uid396_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal prodXY_uid408_pT1_uid396_invPolyEval_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid408_pT1_uid396_invPolyEval_pr : SIGNED (13 downto 0);
    signal prodXY_uid408_pT1_uid396_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid409_pT1_uid396_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid415_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx2_uid418_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3_uid421_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal leftShiftStage1Idx1_uid426_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx1Rng4_uid433_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1_uid435_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx2Rng8_uid436_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx2Pad8_uid437_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2_uid438_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx1Rng1_uid442_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1_uid444_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx2Rng2_uid445_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx2_uid447_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng3_uid448_fxpOp2Path2_uid134_fpArctan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx3Pad3_uid449_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3_uid450_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a : STD_LOGIC_VECTOR (5 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i : STD_LOGIC_VECTOR (5 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o : STD_LOGIC_VECTOR (5 downto 0);
    signal sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx1Rng4_uid457_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx1_uid459_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage0Idx2Rng8_uid460_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage0Idx2_uid462_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage0Idx3Rng12_uid463_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx3_uid465_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1Idx1Rng1_uid468_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightShiftStage1Idx1_uid470_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1Idx2Rng2_uid471_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rightShiftStage1Idx2_uid473_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1Idx3Rng3_uid474_fxpAlignedRes_uid163_fpArctan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage1Idx3_uid476_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_reset : std_logic;
    type mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0type is array(NATURAL range <>) of UNSIGNED(10 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0 : mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0 : signal is true;
    type mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0 : mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0 : signal is true;
    type mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_p : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_u : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_w : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_x : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_y : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_s : mulXAtanXOXRes_uid114_fpArctan2Test_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena1 : std_logic;
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_reset : std_logic;
    type prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0type is array(NATURAL range <>) of UNSIGNED(12 downto 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0 : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0 : signal is true;
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_c0 : mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_c0 : signal is true;
    type prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_p : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_u : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_w : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_x : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_y : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_s : prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ptype(0 to 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena0 : std_logic;
    signal prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena1 : std_logic;
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_reset : std_logic;
    type prodXY_uid405_pT1_uid377_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_a0 : prodXY_uid405_pT1_uid377_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid405_pT1_uid377_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid405_pT1_uid377_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_c0 : prodXY_uid405_pT1_uid377_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid405_pT1_uid377_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid405_pT1_uid377_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(3 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_l : prodXY_uid405_pT1_uid377_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_p : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_u : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_w : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_x : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_y : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_s : prodXY_uid405_pT1_uid377_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_q : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid405_pT1_uid377_invPolyEval_cma_ena1 : std_logic;
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracOutCst_uid151_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expU_uid93_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yAddr_uid110_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal yAddr_uid110_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPath3_uid126_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPath2_uid147_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in : STD_LOGIC_VECTOR (18 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_divR_uid297_div_uid45_fpArctan2Test_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_divR_uid297_div_uid45_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist7_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist9_updatedY_uid203_div_uid45_fpArctan2Test_q_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist10_signR_uid190_fpArctan2Test_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_excRNaN_uid183_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expRCalc_uid154_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist15_fracRCalc_uid152_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist16_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist17_oFracU_uid95_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist18_path2_uid90_fpArctan2Test_n_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_xyInInf_uid88_fpArctan2Test_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excI_div_uid69_fpArctan2Test_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_excI_div_uid69_fpArctan2Test_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_singX_uid48_fpArctan2Test_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fracX_uid47_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist24_fracX_uid47_fpArctan2Test_b_6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist25_fracX_uid47_fpArctan2Test_b_7_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist26_expX_uid46_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_expX_uid46_fpArctan2Test_b_5_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist28_expX_uid46_fpArctan2Test_b_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist29_xInZero_uid44_fpArctan2Test_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_yInZero_uid40_fpArctan2Test_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_yInZero_uid40_fpArctan2Test_q_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_xInSign_uid35_fpArctan2Test_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_xInSign_uid35_fpArctan2Test_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_yInSign_uid34_fpArctan2Test_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_yInSign_uid34_fpArctan2Test_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_fracXIsZero_uid27_fpArctan2Test_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_exp_yIn_uid23_fpArctan2Test_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist38_frac_xIn_uid10_fpArctan2Test_b_3_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist39_exp_xIn_uid9_fpArctan2Test_b_3_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist40_xIn_a_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist24_fracX_uid47_fpArctan2Test_b_6_inputreg_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist24_fracX_uid47_fpArctan2Test_b_6_outputreg_q : STD_LOGIC_VECTOR (9 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist40_xIn_a_2(DELAY,532)
    redist40_xIn_a_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist40_xIn_a_2_q, clk => clk, aclr => areset );

    -- frac_yIn_uid24_fpArctan2Test(BITSELECT,23)@2
    frac_yIn_uid24_fpArctan2Test_b <= redist40_xIn_a_2_q(9 downto 0);

    -- cstZeroWF_uid7_fpArctan2Test(CONSTANT,6)
    cstZeroWF_uid7_fpArctan2Test_q <= "0000000000";

    -- fracXIsZero_uid27_fpArctan2Test(LOGICAL,26)@2 + 1
    fracXIsZero_uid27_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = frac_yIn_uid24_fpArctan2Test_b ELSE "0";
    fracXIsZero_uid27_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid27_fpArctan2Test_qi, xout => fracXIsZero_uid27_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist36_fracXIsZero_uid27_fpArctan2Test_q_2(DELAY,528)
    redist36_fracXIsZero_uid27_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid27_fpArctan2Test_q, xout => redist36_fracXIsZero_uid27_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid28_fpArctan2Test(LOGICAL,27)@4
    fracXIsNotZero_uid28_fpArctan2Test_q <= not (redist36_fracXIsZero_uid27_fpArctan2Test_q_2_q);

    -- cstAllOWE_uid6_fpArctan2Test(CONSTANT,5)
    cstAllOWE_uid6_fpArctan2Test_q <= "11111";

    -- exp_yIn_uid23_fpArctan2Test(BITSELECT,22)@2
    exp_yIn_uid23_fpArctan2Test_b <= redist40_xIn_a_2_q(14 downto 10);

    -- redist37_exp_yIn_uid23_fpArctan2Test_b_1(DELAY,529)
    redist37_exp_yIn_uid23_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_yIn_uid23_fpArctan2Test_b, xout => redist37_exp_yIn_uid23_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid26_fpArctan2Test(LOGICAL,25)@3 + 1
    expXIsMax_uid26_fpArctan2Test_qi <= "1" WHEN redist37_exp_yIn_uid23_fpArctan2Test_b_1_q = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid26_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid26_fpArctan2Test_qi, xout => expXIsMax_uid26_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excN_yIn_uid30_fpArctan2Test(LOGICAL,29)@4
    excN_yIn_uid30_fpArctan2Test_q <= expXIsMax_uid26_fpArctan2Test_q and fracXIsNotZero_uid28_fpArctan2Test_q;

    -- frac_xIn_uid10_fpArctan2Test(BITSELECT,9)@0
    frac_xIn_uid10_fpArctan2Test_b <= b(9 downto 0);

    -- redist38_frac_xIn_uid10_fpArctan2Test_b_3(DELAY,530)
    redist38_frac_xIn_uid10_fpArctan2Test_b_3 : dspba_delay
    GENERIC MAP ( width => 10, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_xIn_uid10_fpArctan2Test_b, xout => redist38_frac_xIn_uid10_fpArctan2Test_b_3_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid13_fpArctan2Test(LOGICAL,12)@3 + 1
    fracXIsZero_uid13_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = redist38_frac_xIn_uid10_fpArctan2Test_b_3_q ELSE "0";
    fracXIsZero_uid13_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid13_fpArctan2Test_qi, xout => fracXIsZero_uid13_fpArctan2Test_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid14_fpArctan2Test(LOGICAL,13)@4
    fracXIsNotZero_uid14_fpArctan2Test_q <= not (fracXIsZero_uid13_fpArctan2Test_q);

    -- exp_xIn_uid9_fpArctan2Test(BITSELECT,8)@0
    exp_xIn_uid9_fpArctan2Test_b <= b(14 downto 10);

    -- redist39_exp_xIn_uid9_fpArctan2Test_b_3(DELAY,531)
    redist39_exp_xIn_uid9_fpArctan2Test_b_3 : dspba_delay
    GENERIC MAP ( width => 5, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_xIn_uid9_fpArctan2Test_b, xout => redist39_exp_xIn_uid9_fpArctan2Test_b_3_q, clk => clk, aclr => areset );

    -- expXIsMax_uid12_fpArctan2Test(LOGICAL,11)@3 + 1
    expXIsMax_uid12_fpArctan2Test_qi <= "1" WHEN redist39_exp_xIn_uid9_fpArctan2Test_b_3_q = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid12_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid12_fpArctan2Test_qi, xout => expXIsMax_uid12_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excN_xIn_uid16_fpArctan2Test(LOGICAL,15)@4
    excN_xIn_uid16_fpArctan2Test_q <= expXIsMax_uid12_fpArctan2Test_q and fracXIsNotZero_uid14_fpArctan2Test_q;

    -- excRNaN_uid183_fpArctan2Test(LOGICAL,182)@4 + 1
    excRNaN_uid183_fpArctan2Test_qi <= excN_xIn_uid16_fpArctan2Test_q or excN_yIn_uid30_fpArctan2Test_q;
    excRNaN_uid183_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid183_fpArctan2Test_qi, xout => excRNaN_uid183_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist12_excRNaN_uid183_fpArctan2Test_q_2(DELAY,504)
    redist12_excRNaN_uid183_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid183_fpArctan2Test_q, xout => redist12_excRNaN_uid183_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid189_fpArctan2Test(LOGICAL,188)@6
    invExcRNaN_uid189_fpArctan2Test_q <= not (redist12_excRNaN_uid183_fpArctan2Test_q_2_q);

    -- yInSign_uid34_fpArctan2Test(BITSELECT,33)@2
    yInSign_uid34_fpArctan2Test_b <= STD_LOGIC_VECTOR(redist40_xIn_a_2_q(15 downto 15));

    -- redist34_yInSign_uid34_fpArctan2Test_b_2(DELAY,526)
    redist34_yInSign_uid34_fpArctan2Test_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInSign_uid34_fpArctan2Test_b, xout => redist34_yInSign_uid34_fpArctan2Test_b_2_q, clk => clk, aclr => areset );

    -- redist35_yInSign_uid34_fpArctan2Test_b_4(DELAY,527)
    redist35_yInSign_uid34_fpArctan2Test_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist34_yInSign_uid34_fpArctan2Test_b_2_q, xout => redist35_yInSign_uid34_fpArctan2Test_b_4_q, clk => clk, aclr => areset );

    -- signR_uid190_fpArctan2Test(LOGICAL,189)@6 + 1
    signR_uid190_fpArctan2Test_qi <= redist35_yInSign_uid34_fpArctan2Test_b_4_q and invExcRNaN_uid189_fpArctan2Test_q;
    signR_uid190_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid190_fpArctan2Test_qi, xout => signR_uid190_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist10_signR_uid190_fpArctan2Test_q_7(DELAY,502)
    redist10_signR_uid190_fpArctan2Test_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid190_fpArctan2Test_q, xout => redist10_signR_uid190_fpArctan2Test_q_7_q, clk => clk, aclr => areset );

    -- cstBiasP1_uid56_fpArctan2Test(CONSTANT,55)
    cstBiasP1_uid56_fpArctan2Test_q <= "10000";

    -- cstBias_uid53_fpArctan2Test(CONSTANT,52)
    cstBias_uid53_fpArctan2Test_q <= "01111";

    -- rightShiftStage1Idx3Pad3_uid449_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,448)
    rightShiftStage1Idx3Pad3_uid449_fxpOp2Path2_uid134_fpArctan2Test_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid474_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,473)@13
    rightShiftStage1Idx3Rng3_uid474_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q(21 downto 3);

    -- rightShiftStage1Idx3_uid476_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,475)@13
    rightShiftStage1Idx3_uid476_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx3Pad3_uid449_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage1Idx3Rng3_uid474_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- padACst_uid167_fpArctan2Test(CONSTANT,166)
    padACst_uid167_fpArctan2Test_q <= "00";

    -- rightShiftStage1Idx2Rng2_uid471_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,470)@13
    rightShiftStage1Idx2Rng2_uid471_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q(21 downto 2);

    -- rightShiftStage1Idx2_uid473_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,472)@13
    rightShiftStage1Idx2_uid473_fxpAlignedRes_uid163_fpArctan2Test_q <= padACst_uid167_fpArctan2Test_q & rightShiftStage1Idx2Rng2_uid471_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage1Idx1Rng1_uid468_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,467)@13
    rightShiftStage1Idx1Rng1_uid468_fxpAlignedRes_uid163_fpArctan2Test_b <= rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q(21 downto 1);

    -- rightShiftStage1Idx1_uid470_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,469)@13
    rightShiftStage1Idx1_uid470_fxpAlignedRes_uid163_fpArctan2Test_q <= GND_q & rightShiftStage1Idx1Rng1_uid468_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,438)
    rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test_q <= "000000000000";

    -- rightShiftStage0Idx3Rng12_uid463_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,462)@13
    rightShiftStage0Idx3Rng12_uid463_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(21 downto 12);

    -- rightShiftStage0Idx3_uid465_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,464)@13
    rightShiftStage0Idx3_uid465_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx3Rng12_uid463_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- rightShiftStage0Idx2Pad8_uid437_fxpOp2Path2_uid134_fpArctan2Test(CONSTANT,436)
    rightShiftStage0Idx2Pad8_uid437_fxpOp2Path2_uid134_fpArctan2Test_q <= "00000000";

    -- rightShiftStage0Idx2Rng8_uid460_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,459)@13
    rightShiftStage0Idx2Rng8_uid460_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(21 downto 8);

    -- rightShiftStage0Idx2_uid462_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,461)@13
    rightShiftStage0Idx2_uid462_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx2Pad8_uid437_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx2Rng8_uid460_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test(CONSTANT,415)
    leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test_q <= "0000";

    -- rightShiftStage0Idx1Rng4_uid457_fxpAlignedRes_uid163_fpArctan2Test(BITSELECT,456)@13
    rightShiftStage0Idx1Rng4_uid457_fxpAlignedRes_uid163_fpArctan2Test_b <= rightPaddedIn_uid164_fpArctan2Test_q(21 downto 4);

    -- rightShiftStage0Idx1_uid459_fxpAlignedRes_uid163_fpArctan2Test(BITJOIN,458)@13
    rightShiftStage0Idx1_uid459_fxpAlignedRes_uid163_fpArctan2Test_q <= leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test_q & rightShiftStage0Idx1Rng4_uid457_fxpAlignedRes_uid163_fpArctan2Test_b;

    -- excI_xIn_uid15_fpArctan2Test(LOGICAL,14)@4
    excI_xIn_uid15_fpArctan2Test_q <= expXIsMax_uid12_fpArctan2Test_q and fracXIsZero_uid13_fpArctan2Test_q;

    -- excI_yIn_uid29_fpArctan2Test(LOGICAL,28)@4
    excI_yIn_uid29_fpArctan2Test_q <= expXIsMax_uid26_fpArctan2Test_q and redist36_fracXIsZero_uid27_fpArctan2Test_q_2_q;

    -- excXIYI_uid283_div_uid45_fpArctan2Test(LOGICAL,282)@4
    excXIYI_uid283_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and excI_xIn_uid15_fpArctan2Test_q;

    -- excZ_y_uid224_div_uid45_fpArctan2Test(LOGICAL,223)@3 + 1
    excZ_y_uid224_div_uid45_fpArctan2Test_qi <= "1" WHEN redist39_exp_xIn_uid9_fpArctan2Test_b_3_q = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";
    excZ_y_uid224_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid224_div_uid45_fpArctan2Test_qi, xout => excZ_y_uid224_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excZ_x_uid210_div_uid45_fpArctan2Test(LOGICAL,209)@3 + 1
    excZ_x_uid210_div_uid45_fpArctan2Test_qi <= "1" WHEN redist37_exp_yIn_uid23_fpArctan2Test_b_1_q = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";
    excZ_x_uid210_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid210_div_uid45_fpArctan2Test_qi, xout => excZ_x_uid210_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excXZYZ_uid282_div_uid45_fpArctan2Test(LOGICAL,281)@4
    excXZYZ_uid282_div_uid45_fpArctan2Test_q <= excZ_x_uid210_div_uid45_fpArctan2Test_q and excZ_y_uid224_div_uid45_fpArctan2Test_q;

    -- excRNaN_uid284_div_uid45_fpArctan2Test(LOGICAL,283)@4
    excRNaN_uid284_div_uid45_fpArctan2Test_q <= excXZYZ_uid282_div_uid45_fpArctan2Test_q or excN_yIn_uid30_fpArctan2Test_q or excN_xIn_uid16_fpArctan2Test_q or excXIYI_uid283_div_uid45_fpArctan2Test_q;

    -- invExcRNaN_uid295_div_uid45_fpArctan2Test(LOGICAL,294)@4
    invExcRNaN_uid295_div_uid45_fpArctan2Test_q <= not (excRNaN_uid284_div_uid45_fpArctan2Test_q);

    -- xInSign_uid35_fpArctan2Test(BITSELECT,34)@0
    xInSign_uid35_fpArctan2Test_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- redist32_xInSign_uid35_fpArctan2Test_b_4(DELAY,524)
    redist32_xInSign_uid35_fpArctan2Test_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInSign_uid35_fpArctan2Test_b, xout => redist32_xInSign_uid35_fpArctan2Test_b_4_q, clk => clk, aclr => areset );

    -- signR_uid233_div_uid45_fpArctan2Test(LOGICAL,232)@4
    signR_uid233_div_uid45_fpArctan2Test_q <= redist34_yInSign_uid34_fpArctan2Test_b_2_q xor redist32_xInSign_uid35_fpArctan2Test_b_4_q;

    -- sRPostExc_uid296_div_uid45_fpArctan2Test(LOGICAL,295)@4
    sRPostExc_uid296_div_uid45_fpArctan2Test_q <= signR_uid233_div_uid45_fpArctan2Test_q and invExcRNaN_uid295_div_uid45_fpArctan2Test_q;

    -- lOAdded_uid245_div_uid45_fpArctan2Test(BITJOIN,244)@2
    lOAdded_uid245_div_uid45_fpArctan2Test_q <= VCC_q & frac_yIn_uid24_fpArctan2Test_b;

    -- redist7_lOAdded_uid245_div_uid45_fpArctan2Test_q_2(DELAY,499)
    redist7_lOAdded_uid245_div_uid45_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid245_div_uid45_fpArctan2Test_q, xout => redist7_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test(BITJOIN,249)@4
    oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q <= redist7_lOAdded_uid245_div_uid45_fpArctan2Test_q_2_q & padACst_uid167_fpArctan2Test_q;

    -- yAddr_uid238_div_uid45_fpArctan2Test(BITSELECT,237)@0
    yAddr_uid238_div_uid45_fpArctan2Test_b <= frac_xIn_uid10_fpArctan2Test_b(9 downto 3);

    -- memoryC1_uid371_invTables(LOOKUP,370)@0
    memoryC1_uid371_invTables_combproc: PROCESS (yAddr_uid238_div_uid45_fpArctan2Test_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid238_div_uid45_fpArctan2Test_b) IS
            WHEN "0000000" => memoryC1_uid371_invTables_q <= "1000000011";
            WHEN "0000001" => memoryC1_uid371_invTables_q <= "1000001100";
            WHEN "0000010" => memoryC1_uid371_invTables_q <= "1000010100";
            WHEN "0000011" => memoryC1_uid371_invTables_q <= "1000011011";
            WHEN "0000100" => memoryC1_uid371_invTables_q <= "1000100010";
            WHEN "0000101" => memoryC1_uid371_invTables_q <= "1000101001";
            WHEN "0000110" => memoryC1_uid371_invTables_q <= "1000110000";
            WHEN "0000111" => memoryC1_uid371_invTables_q <= "1000111000";
            WHEN "0001000" => memoryC1_uid371_invTables_q <= "1000111101";
            WHEN "0001001" => memoryC1_uid371_invTables_q <= "1001000101";
            WHEN "0001010" => memoryC1_uid371_invTables_q <= "1001001010";
            WHEN "0001011" => memoryC1_uid371_invTables_q <= "1001010001";
            WHEN "0001100" => memoryC1_uid371_invTables_q <= "1001010111";
            WHEN "0001101" => memoryC1_uid371_invTables_q <= "1001011101";
            WHEN "0001110" => memoryC1_uid371_invTables_q <= "1001100011";
            WHEN "0001111" => memoryC1_uid371_invTables_q <= "1001101001";
            WHEN "0010000" => memoryC1_uid371_invTables_q <= "1001101110";
            WHEN "0010001" => memoryC1_uid371_invTables_q <= "1001110100";
            WHEN "0010010" => memoryC1_uid371_invTables_q <= "1001111001";
            WHEN "0010011" => memoryC1_uid371_invTables_q <= "1001111110";
            WHEN "0010100" => memoryC1_uid371_invTables_q <= "1010000100";
            WHEN "0010101" => memoryC1_uid371_invTables_q <= "1010001001";
            WHEN "0010110" => memoryC1_uid371_invTables_q <= "1010001101";
            WHEN "0010111" => memoryC1_uid371_invTables_q <= "1010010011";
            WHEN "0011000" => memoryC1_uid371_invTables_q <= "1010010111";
            WHEN "0011001" => memoryC1_uid371_invTables_q <= "1010011100";
            WHEN "0011010" => memoryC1_uid371_invTables_q <= "1010100001";
            WHEN "0011011" => memoryC1_uid371_invTables_q <= "1010100101";
            WHEN "0011100" => memoryC1_uid371_invTables_q <= "1010101001";
            WHEN "0011101" => memoryC1_uid371_invTables_q <= "1010101110";
            WHEN "0011110" => memoryC1_uid371_invTables_q <= "1010110010";
            WHEN "0011111" => memoryC1_uid371_invTables_q <= "1010110111";
            WHEN "0100000" => memoryC1_uid371_invTables_q <= "1010111010";
            WHEN "0100001" => memoryC1_uid371_invTables_q <= "1010111110";
            WHEN "0100010" => memoryC1_uid371_invTables_q <= "1011000011";
            WHEN "0100011" => memoryC1_uid371_invTables_q <= "1011000110";
            WHEN "0100100" => memoryC1_uid371_invTables_q <= "1011001010";
            WHEN "0100101" => memoryC1_uid371_invTables_q <= "1011001101";
            WHEN "0100110" => memoryC1_uid371_invTables_q <= "1011010001";
            WHEN "0100111" => memoryC1_uid371_invTables_q <= "1011010101";
            WHEN "0101000" => memoryC1_uid371_invTables_q <= "1011011001";
            WHEN "0101001" => memoryC1_uid371_invTables_q <= "1011011011";
            WHEN "0101010" => memoryC1_uid371_invTables_q <= "1011011111";
            WHEN "0101011" => memoryC1_uid371_invTables_q <= "1011100011";
            WHEN "0101100" => memoryC1_uid371_invTables_q <= "1011100110";
            WHEN "0101101" => memoryC1_uid371_invTables_q <= "1011101001";
            WHEN "0101110" => memoryC1_uid371_invTables_q <= "1011101101";
            WHEN "0101111" => memoryC1_uid371_invTables_q <= "1011101111";
            WHEN "0110000" => memoryC1_uid371_invTables_q <= "1011110011";
            WHEN "0110001" => memoryC1_uid371_invTables_q <= "1011110110";
            WHEN "0110010" => memoryC1_uid371_invTables_q <= "1011111000";
            WHEN "0110011" => memoryC1_uid371_invTables_q <= "1011111011";
            WHEN "0110100" => memoryC1_uid371_invTables_q <= "1011111111";
            WHEN "0110101" => memoryC1_uid371_invTables_q <= "1100000001";
            WHEN "0110110" => memoryC1_uid371_invTables_q <= "1100000100";
            WHEN "0110111" => memoryC1_uid371_invTables_q <= "1100000111";
            WHEN "0111000" => memoryC1_uid371_invTables_q <= "1100001010";
            WHEN "0111001" => memoryC1_uid371_invTables_q <= "1100001100";
            WHEN "0111010" => memoryC1_uid371_invTables_q <= "1100001111";
            WHEN "0111011" => memoryC1_uid371_invTables_q <= "1100010001";
            WHEN "0111100" => memoryC1_uid371_invTables_q <= "1100010100";
            WHEN "0111101" => memoryC1_uid371_invTables_q <= "1100010110";
            WHEN "0111110" => memoryC1_uid371_invTables_q <= "1100011001";
            WHEN "0111111" => memoryC1_uid371_invTables_q <= "1100011100";
            WHEN "1000000" => memoryC1_uid371_invTables_q <= "1100011101";
            WHEN "1000001" => memoryC1_uid371_invTables_q <= "1100100000";
            WHEN "1000010" => memoryC1_uid371_invTables_q <= "1100100010";
            WHEN "1000011" => memoryC1_uid371_invTables_q <= "1100100101";
            WHEN "1000100" => memoryC1_uid371_invTables_q <= "1100100111";
            WHEN "1000101" => memoryC1_uid371_invTables_q <= "1100101000";
            WHEN "1000110" => memoryC1_uid371_invTables_q <= "1100101011";
            WHEN "1000111" => memoryC1_uid371_invTables_q <= "1100101101";
            WHEN "1001000" => memoryC1_uid371_invTables_q <= "1100101111";
            WHEN "1001001" => memoryC1_uid371_invTables_q <= "1100110010";
            WHEN "1001010" => memoryC1_uid371_invTables_q <= "1100110011";
            WHEN "1001011" => memoryC1_uid371_invTables_q <= "1100110110";
            WHEN "1001100" => memoryC1_uid371_invTables_q <= "1100110111";
            WHEN "1001101" => memoryC1_uid371_invTables_q <= "1100111001";
            WHEN "1001110" => memoryC1_uid371_invTables_q <= "1100111100";
            WHEN "1001111" => memoryC1_uid371_invTables_q <= "1100111101";
            WHEN "1010000" => memoryC1_uid371_invTables_q <= "1100111111";
            WHEN "1010001" => memoryC1_uid371_invTables_q <= "1101000001";
            WHEN "1010010" => memoryC1_uid371_invTables_q <= "1101000010";
            WHEN "1010011" => memoryC1_uid371_invTables_q <= "1101000101";
            WHEN "1010100" => memoryC1_uid371_invTables_q <= "1101000110";
            WHEN "1010101" => memoryC1_uid371_invTables_q <= "1101001000";
            WHEN "1010110" => memoryC1_uid371_invTables_q <= "1101001010";
            WHEN "1010111" => memoryC1_uid371_invTables_q <= "1101001011";
            WHEN "1011000" => memoryC1_uid371_invTables_q <= "1101001101";
            WHEN "1011001" => memoryC1_uid371_invTables_q <= "1101001111";
            WHEN "1011010" => memoryC1_uid371_invTables_q <= "1101010000";
            WHEN "1011011" => memoryC1_uid371_invTables_q <= "1101010010";
            WHEN "1011100" => memoryC1_uid371_invTables_q <= "1101010011";
            WHEN "1011101" => memoryC1_uid371_invTables_q <= "1101010110";
            WHEN "1011110" => memoryC1_uid371_invTables_q <= "1101010111";
            WHEN "1011111" => memoryC1_uid371_invTables_q <= "1101011000";
            WHEN "1100000" => memoryC1_uid371_invTables_q <= "1101011010";
            WHEN "1100001" => memoryC1_uid371_invTables_q <= "1101011011";
            WHEN "1100010" => memoryC1_uid371_invTables_q <= "1101011100";
            WHEN "1100011" => memoryC1_uid371_invTables_q <= "1101011110";
            WHEN "1100100" => memoryC1_uid371_invTables_q <= "1101011111";
            WHEN "1100101" => memoryC1_uid371_invTables_q <= "1101100001";
            WHEN "1100110" => memoryC1_uid371_invTables_q <= "1101100010";
            WHEN "1100111" => memoryC1_uid371_invTables_q <= "1101100100";
            WHEN "1101000" => memoryC1_uid371_invTables_q <= "1101100100";
            WHEN "1101001" => memoryC1_uid371_invTables_q <= "1101100110";
            WHEN "1101010" => memoryC1_uid371_invTables_q <= "1101100111";
            WHEN "1101011" => memoryC1_uid371_invTables_q <= "1101101001";
            WHEN "1101100" => memoryC1_uid371_invTables_q <= "1101101010";
            WHEN "1101101" => memoryC1_uid371_invTables_q <= "1101101011";
            WHEN "1101110" => memoryC1_uid371_invTables_q <= "1101101101";
            WHEN "1101111" => memoryC1_uid371_invTables_q <= "1101101101";
            WHEN "1110000" => memoryC1_uid371_invTables_q <= "1101110000";
            WHEN "1110001" => memoryC1_uid371_invTables_q <= "1101110001";
            WHEN "1110010" => memoryC1_uid371_invTables_q <= "1101110001";
            WHEN "1110011" => memoryC1_uid371_invTables_q <= "1101110010";
            WHEN "1110100" => memoryC1_uid371_invTables_q <= "1101110100";
            WHEN "1110101" => memoryC1_uid371_invTables_q <= "1101110101";
            WHEN "1110110" => memoryC1_uid371_invTables_q <= "1101110110";
            WHEN "1110111" => memoryC1_uid371_invTables_q <= "1101110111";
            WHEN "1111000" => memoryC1_uid371_invTables_q <= "1101111000";
            WHEN "1111001" => memoryC1_uid371_invTables_q <= "1101111001";
            WHEN "1111010" => memoryC1_uid371_invTables_q <= "1101111011";
            WHEN "1111011" => memoryC1_uid371_invTables_q <= "1101111011";
            WHEN "1111100" => memoryC1_uid371_invTables_q <= "1101111101";
            WHEN "1111101" => memoryC1_uid371_invTables_q <= "1101111110";
            WHEN "1111110" => memoryC1_uid371_invTables_q <= "1101111110";
            WHEN "1111111" => memoryC1_uid371_invTables_q <= "1110000000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid371_invTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- yPE_uid239_div_uid45_fpArctan2Test(BITSELECT,238)@0
    yPE_uid239_div_uid45_fpArctan2Test_b <= b(2 downto 0);

    -- prodXY_uid405_pT1_uid377_invPolyEval_cma(CHAINMULTADD,481)@0 + 2
    prodXY_uid405_pT1_uid377_invPolyEval_cma_reset <= areset;
    prodXY_uid405_pT1_uid377_invPolyEval_cma_ena0 <= '1';
    prodXY_uid405_pT1_uid377_invPolyEval_cma_ena1 <= prodXY_uid405_pT1_uid377_invPolyEval_cma_ena0;
    prodXY_uid405_pT1_uid377_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid405_pT1_uid377_invPolyEval_cma_a0(0),4));
    prodXY_uid405_pT1_uid377_invPolyEval_cma_p(0) <= prodXY_uid405_pT1_uid377_invPolyEval_cma_l(0) * prodXY_uid405_pT1_uid377_invPolyEval_cma_c0(0);
    prodXY_uid405_pT1_uid377_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid405_pT1_uid377_invPolyEval_cma_p(0),15);
    prodXY_uid405_pT1_uid377_invPolyEval_cma_w(0) <= prodXY_uid405_pT1_uid377_invPolyEval_cma_u(0);
    prodXY_uid405_pT1_uid377_invPolyEval_cma_x(0) <= prodXY_uid405_pT1_uid377_invPolyEval_cma_w(0);
    prodXY_uid405_pT1_uid377_invPolyEval_cma_y(0) <= prodXY_uid405_pT1_uid377_invPolyEval_cma_x(0);
    prodXY_uid405_pT1_uid377_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid405_pT1_uid377_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid405_pT1_uid377_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid405_pT1_uid377_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid405_pT1_uid377_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yPE_uid239_div_uid45_fpArctan2Test_b),3);
                prodXY_uid405_pT1_uid377_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC1_uid371_invTables_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid405_pT1_uid377_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid405_pT1_uid377_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid405_pT1_uid377_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid405_pT1_uid377_invPolyEval_cma_s(0) <= prodXY_uid405_pT1_uid377_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid405_pT1_uid377_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid405_pT1_uid377_invPolyEval_cma_s(0)(13 downto 0)), xout => prodXY_uid405_pT1_uid377_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid405_pT1_uid377_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid405_pT1_uid377_invPolyEval_cma_qq(12 downto 0));

    -- osig_uid406_pT1_uid377_invPolyEval(BITSELECT,405)@2
    osig_uid406_pT1_uid377_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid405_pT1_uid377_invPolyEval_cma_q(12 downto 1));

    -- highBBits_uid379_invPolyEval(BITSELECT,378)@2
    highBBits_uid379_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid406_pT1_uid377_invPolyEval_b(11 downto 2));

    -- redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2(DELAY,500)
    redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid238_div_uid45_fpArctan2Test_b, xout => redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q, clk => clk, aclr => areset );

    -- memoryC0_uid368_invTables(LOOKUP,367)@2
    memoryC0_uid368_invTables_combproc: PROCESS (redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist8_yAddr_uid238_div_uid45_fpArctan2Test_b_2_q) IS
            WHEN "0000000" => memoryC0_uid368_invTables_q <= "010000000000000100";
            WHEN "0000001" => memoryC0_uid368_invTables_q <= "001111111000000111";
            WHEN "0000010" => memoryC0_uid368_invTables_q <= "001111110000010011";
            WHEN "0000011" => memoryC0_uid368_invTables_q <= "001111101000100111";
            WHEN "0000100" => memoryC0_uid368_invTables_q <= "001111100001000010";
            WHEN "0000101" => memoryC0_uid368_invTables_q <= "001111011001100100";
            WHEN "0000110" => memoryC0_uid368_invTables_q <= "001111010010001101";
            WHEN "0000111" => memoryC0_uid368_invTables_q <= "001111001010111101";
            WHEN "0001000" => memoryC0_uid368_invTables_q <= "001111000011110101";
            WHEN "0001001" => memoryC0_uid368_invTables_q <= "001110111100110010";
            WHEN "0001010" => memoryC0_uid368_invTables_q <= "001110110101110111";
            WHEN "0001011" => memoryC0_uid368_invTables_q <= "001110101111000001";
            WHEN "0001100" => memoryC0_uid368_invTables_q <= "001110101000010010";
            WHEN "0001101" => memoryC0_uid368_invTables_q <= "001110100001101001";
            WHEN "0001110" => memoryC0_uid368_invTables_q <= "001110011011000110";
            WHEN "0001111" => memoryC0_uid368_invTables_q <= "001110010100101001";
            WHEN "0010000" => memoryC0_uid368_invTables_q <= "001110001110010010";
            WHEN "0010001" => memoryC0_uid368_invTables_q <= "001110001000000000";
            WHEN "0010010" => memoryC0_uid368_invTables_q <= "001110000001110100";
            WHEN "0010011" => memoryC0_uid368_invTables_q <= "001101111011101101";
            WHEN "0010100" => memoryC0_uid368_invTables_q <= "001101110101101011";
            WHEN "0010101" => memoryC0_uid368_invTables_q <= "001101101111101111";
            WHEN "0010110" => memoryC0_uid368_invTables_q <= "001101101001111000";
            WHEN "0010111" => memoryC0_uid368_invTables_q <= "001101100100000101";
            WHEN "0011000" => memoryC0_uid368_invTables_q <= "001101011110011000";
            WHEN "0011001" => memoryC0_uid368_invTables_q <= "001101011000101111";
            WHEN "0011010" => memoryC0_uid368_invTables_q <= "001101010011001011";
            WHEN "0011011" => memoryC0_uid368_invTables_q <= "001101001101101100";
            WHEN "0011100" => memoryC0_uid368_invTables_q <= "001101001000010001";
            WHEN "0011101" => memoryC0_uid368_invTables_q <= "001101000010111010";
            WHEN "0011110" => memoryC0_uid368_invTables_q <= "001100111101101000";
            WHEN "0011111" => memoryC0_uid368_invTables_q <= "001100111000011010";
            WHEN "0100000" => memoryC0_uid368_invTables_q <= "001100110011010001";
            WHEN "0100001" => memoryC0_uid368_invTables_q <= "001100101110001011";
            WHEN "0100010" => memoryC0_uid368_invTables_q <= "001100101001001001";
            WHEN "0100011" => memoryC0_uid368_invTables_q <= "001100100100001100";
            WHEN "0100100" => memoryC0_uid368_invTables_q <= "001100011111010010";
            WHEN "0100101" => memoryC0_uid368_invTables_q <= "001100011010011100";
            WHEN "0100110" => memoryC0_uid368_invTables_q <= "001100010101101010";
            WHEN "0100111" => memoryC0_uid368_invTables_q <= "001100010000111011";
            WHEN "0101000" => memoryC0_uid368_invTables_q <= "001100001100010000";
            WHEN "0101001" => memoryC0_uid368_invTables_q <= "001100000111101001";
            WHEN "0101010" => memoryC0_uid368_invTables_q <= "001100000011000101";
            WHEN "0101011" => memoryC0_uid368_invTables_q <= "001011111110100100";
            WHEN "0101100" => memoryC0_uid368_invTables_q <= "001011111010000111";
            WHEN "0101101" => memoryC0_uid368_invTables_q <= "001011110101101101";
            WHEN "0101110" => memoryC0_uid368_invTables_q <= "001011110001010110";
            WHEN "0101111" => memoryC0_uid368_invTables_q <= "001011101101000011";
            WHEN "0110000" => memoryC0_uid368_invTables_q <= "001011101000110010";
            WHEN "0110001" => memoryC0_uid368_invTables_q <= "001011100100100101";
            WHEN "0110010" => memoryC0_uid368_invTables_q <= "001011100000011011";
            WHEN "0110011" => memoryC0_uid368_invTables_q <= "001011011100010100";
            WHEN "0110100" => memoryC0_uid368_invTables_q <= "001011011000001111";
            WHEN "0110101" => memoryC0_uid368_invTables_q <= "001011010100001110";
            WHEN "0110110" => memoryC0_uid368_invTables_q <= "001011010000001111";
            WHEN "0110111" => memoryC0_uid368_invTables_q <= "001011001100010011";
            WHEN "0111000" => memoryC0_uid368_invTables_q <= "001011001000011010";
            WHEN "0111001" => memoryC0_uid368_invTables_q <= "001011000100100100";
            WHEN "0111010" => memoryC0_uid368_invTables_q <= "001011000000110000";
            WHEN "0111011" => memoryC0_uid368_invTables_q <= "001010111100111111";
            WHEN "0111100" => memoryC0_uid368_invTables_q <= "001010111001010000";
            WHEN "0111101" => memoryC0_uid368_invTables_q <= "001010110101100100";
            WHEN "0111110" => memoryC0_uid368_invTables_q <= "001010110001111010";
            WHEN "0111111" => memoryC0_uid368_invTables_q <= "001010101110010011";
            WHEN "1000000" => memoryC0_uid368_invTables_q <= "001010101010101111";
            WHEN "1000001" => memoryC0_uid368_invTables_q <= "001010100111001100";
            WHEN "1000010" => memoryC0_uid368_invTables_q <= "001010100011101100";
            WHEN "1000011" => memoryC0_uid368_invTables_q <= "001010100000001110";
            WHEN "1000100" => memoryC0_uid368_invTables_q <= "001010011100110011";
            WHEN "1000101" => memoryC0_uid368_invTables_q <= "001010011001011010";
            WHEN "1000110" => memoryC0_uid368_invTables_q <= "001010010110000011";
            WHEN "1000111" => memoryC0_uid368_invTables_q <= "001010010010101110";
            WHEN "1001000" => memoryC0_uid368_invTables_q <= "001010001111011011";
            WHEN "1001001" => memoryC0_uid368_invTables_q <= "001010001100001010";
            WHEN "1001010" => memoryC0_uid368_invTables_q <= "001010001000111100";
            WHEN "1001011" => memoryC0_uid368_invTables_q <= "001010000101101111";
            WHEN "1001100" => memoryC0_uid368_invTables_q <= "001010000010100101";
            WHEN "1001101" => memoryC0_uid368_invTables_q <= "001001111111011100";
            WHEN "1001110" => memoryC0_uid368_invTables_q <= "001001111100010101";
            WHEN "1001111" => memoryC0_uid368_invTables_q <= "001001111001010001";
            WHEN "1010000" => memoryC0_uid368_invTables_q <= "001001110110001110";
            WHEN "1010001" => memoryC0_uid368_invTables_q <= "001001110011001101";
            WHEN "1010010" => memoryC0_uid368_invTables_q <= "001001110000001110";
            WHEN "1010011" => memoryC0_uid368_invTables_q <= "001001101101010000";
            WHEN "1010100" => memoryC0_uid368_invTables_q <= "001001101010010101";
            WHEN "1010101" => memoryC0_uid368_invTables_q <= "001001100111011011";
            WHEN "1010110" => memoryC0_uid368_invTables_q <= "001001100100100011";
            WHEN "1010111" => memoryC0_uid368_invTables_q <= "001001100001101101";
            WHEN "1011000" => memoryC0_uid368_invTables_q <= "001001011110111000";
            WHEN "1011001" => memoryC0_uid368_invTables_q <= "001001011100000101";
            WHEN "1011010" => memoryC0_uid368_invTables_q <= "001001011001010100";
            WHEN "1011011" => memoryC0_uid368_invTables_q <= "001001010110100100";
            WHEN "1011100" => memoryC0_uid368_invTables_q <= "001001010011110110";
            WHEN "1011101" => memoryC0_uid368_invTables_q <= "001001010001001001";
            WHEN "1011110" => memoryC0_uid368_invTables_q <= "001001001110011110";
            WHEN "1011111" => memoryC0_uid368_invTables_q <= "001001001011110101";
            WHEN "1100000" => memoryC0_uid368_invTables_q <= "001001001001001101";
            WHEN "1100001" => memoryC0_uid368_invTables_q <= "001001000110100111";
            WHEN "1100010" => memoryC0_uid368_invTables_q <= "001001000100000010";
            WHEN "1100011" => memoryC0_uid368_invTables_q <= "001001000001011110";
            WHEN "1100100" => memoryC0_uid368_invTables_q <= "001000111110111100";
            WHEN "1100101" => memoryC0_uid368_invTables_q <= "001000111100011011";
            WHEN "1100110" => memoryC0_uid368_invTables_q <= "001000111001111100";
            WHEN "1100111" => memoryC0_uid368_invTables_q <= "001000110111011110";
            WHEN "1101000" => memoryC0_uid368_invTables_q <= "001000110101000010";
            WHEN "1101001" => memoryC0_uid368_invTables_q <= "001000110010100111";
            WHEN "1101010" => memoryC0_uid368_invTables_q <= "001000110000001101";
            WHEN "1101011" => memoryC0_uid368_invTables_q <= "001000101101110100";
            WHEN "1101100" => memoryC0_uid368_invTables_q <= "001000101011011101";
            WHEN "1101101" => memoryC0_uid368_invTables_q <= "001000101001000111";
            WHEN "1101110" => memoryC0_uid368_invTables_q <= "001000100110110010";
            WHEN "1101111" => memoryC0_uid368_invTables_q <= "001000100100011111";
            WHEN "1110000" => memoryC0_uid368_invTables_q <= "001000100010001100";
            WHEN "1110001" => memoryC0_uid368_invTables_q <= "001000011111111011";
            WHEN "1110010" => memoryC0_uid368_invTables_q <= "001000011101101100";
            WHEN "1110011" => memoryC0_uid368_invTables_q <= "001000011011011101";
            WHEN "1110100" => memoryC0_uid368_invTables_q <= "001000011001001111";
            WHEN "1110101" => memoryC0_uid368_invTables_q <= "001000010111000011";
            WHEN "1110110" => memoryC0_uid368_invTables_q <= "001000010100111000";
            WHEN "1110111" => memoryC0_uid368_invTables_q <= "001000010010101110";
            WHEN "1111000" => memoryC0_uid368_invTables_q <= "001000010000100101";
            WHEN "1111001" => memoryC0_uid368_invTables_q <= "001000001110011101";
            WHEN "1111010" => memoryC0_uid368_invTables_q <= "001000001100010110";
            WHEN "1111011" => memoryC0_uid368_invTables_q <= "001000001010010001";
            WHEN "1111100" => memoryC0_uid368_invTables_q <= "001000001000001100";
            WHEN "1111101" => memoryC0_uid368_invTables_q <= "001000000110001000";
            WHEN "1111110" => memoryC0_uid368_invTables_q <= "001000000100000110";
            WHEN "1111111" => memoryC0_uid368_invTables_q <= "001000000010000100";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid368_invTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid380_invPolyEval(ADD,379)@2
    s1sumAHighB_uid380_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => memoryC0_uid368_invTables_q(17)) & memoryC0_uid368_invTables_q));
    s1sumAHighB_uid380_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 10 => highBBits_uid379_invPolyEval_b(9)) & highBBits_uid379_invPolyEval_b));
    s1sumAHighB_uid380_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid380_invPolyEval_a) + SIGNED(s1sumAHighB_uid380_invPolyEval_b));
    s1sumAHighB_uid380_invPolyEval_q <= s1sumAHighB_uid380_invPolyEval_o(18 downto 0);

    -- lowRangeB_uid378_invPolyEval(BITSELECT,377)@2
    lowRangeB_uid378_invPolyEval_in <= osig_uid406_pT1_uid377_invPolyEval_b(1 downto 0);
    lowRangeB_uid378_invPolyEval_b <= lowRangeB_uid378_invPolyEval_in(1 downto 0);

    -- s1_uid381_invPolyEval(BITJOIN,380)@2
    s1_uid381_invPolyEval_q <= s1sumAHighB_uid380_invPolyEval_q & lowRangeB_uid378_invPolyEval_b;

    -- invY_uid241_div_uid45_fpArctan2Test_merged_bit_select(BITSELECT,491)@2
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in <= s1_uid381_invPolyEval_q(18 downto 0);
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b <= invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in(17 downto 5);
    invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c <= invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_in(18 downto 18);

    -- prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma(CHAINMULTADD,480)@2 + 2
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_reset <= areset;
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena0 <= '1';
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena1 <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena0;
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_p(0) <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0(0) * prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_c0(0);
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_u(0) <= RESIZE(prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_p(0),24);
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_w(0) <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_u(0);
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_x(0) <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_w(0);
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_y(0) <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_x(0);
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0 <= (others => (others => '0'));
            prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena0 = '1') THEN
                prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_a0(0) <= RESIZE(UNSIGNED(invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_b),13);
                prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_c0(0) <= RESIZE(UNSIGNED(lOAdded_uid245_div_uid45_fpArctan2Test_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_ena1 = '1') THEN
                prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_s(0) <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_s(0)(23 downto 0)), xout => prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_qq, clk => clk, aclr => areset );
    prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_q <= STD_LOGIC_VECTOR(prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_qq(23 downto 0));

    -- osig_uid384_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test(BITSELECT,383)@4
    osig_uid384_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b <= prodXY_uid383_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_cma_q(23 downto 11);

    -- redist0_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_1(DELAY,492)
    redist0_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c, xout => redist0_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- updatedY_uid203_div_uid45_fpArctan2Test(BITJOIN,202)@3
    updatedY_uid203_div_uid45_fpArctan2Test_q <= GND_q & cstZeroWF_uid7_fpArctan2Test_q;

    -- fracYZero_uid202_div_uid45_fpArctan2Test(LOGICAL,203)@3
    fracYZero_uid202_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & redist38_frac_xIn_uid10_fpArctan2Test_b_3_q);
    fracYZero_uid202_div_uid45_fpArctan2Test_q <= "1" WHEN fracYZero_uid202_div_uid45_fpArctan2Test_a = updatedY_uid203_div_uid45_fpArctan2Test_q ELSE "0";

    -- fracYPostZ_uid243_div_uid45_fpArctan2Test(LOGICAL,242)@3 + 1
    fracYPostZ_uid243_div_uid45_fpArctan2Test_qi <= fracYZero_uid202_div_uid45_fpArctan2Test_q or redist0_invY_uid241_div_uid45_fpArctan2Test_merged_bit_select_c_1_q;
    fracYPostZ_uid243_div_uid45_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYPostZ_uid243_div_uid45_fpArctan2Test_qi, xout => fracYPostZ_uid243_div_uid45_fpArctan2Test_q, clk => clk, aclr => areset );

    -- divValPreNormTrunc_uid253_div_uid45_fpArctan2Test(MUX,252)@4
    divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s <= fracYPostZ_uid243_div_uid45_fpArctan2Test_q;
    divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_combproc: PROCESS (divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s, osig_uid384_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b, oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q)
    BEGIN
        CASE (divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_s) IS
            WHEN "0" => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= osig_uid384_prodDivPreNormProd_uid247_div_uid45_fpArctan2Test_b;
            WHEN "1" => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= oFracXSE_mergedSignalTM_uid250_div_uid45_fpArctan2Test_q;
            WHEN OTHERS => divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid254_div_uid45_fpArctan2Test(BITSELECT,253)@4
    norm_uid254_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(12 downto 12));

    -- rndOp_uid262_div_uid45_fpArctan2Test(BITJOIN,261)@4
    rndOp_uid262_div_uid45_fpArctan2Test_q <= norm_uid254_div_uid45_fpArctan2Test_b & cstZeroWF_uid7_fpArctan2Test_q & VCC_q;

    -- cstBiasM1_uid54_fpArctan2Test(CONSTANT,53)
    cstBiasM1_uid54_fpArctan2Test_q <= "01110";

    -- expXmY_uid234_div_uid45_fpArctan2Test(SUB,233)@3 + 1
    expXmY_uid234_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & redist37_exp_yIn_uid23_fpArctan2Test_b_1_q);
    expXmY_uid234_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & redist39_exp_xIn_uid9_fpArctan2Test_b_3_q);
    expXmY_uid234_div_uid45_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid234_div_uid45_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expXmY_uid234_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid234_div_uid45_fpArctan2Test_a) - UNSIGNED(expXmY_uid234_div_uid45_fpArctan2Test_b));
        END IF;
    END PROCESS;
    expXmY_uid234_div_uid45_fpArctan2Test_q <= expXmY_uid234_div_uid45_fpArctan2Test_o(5 downto 0);

    -- expR_uid235_div_uid45_fpArctan2Test(ADD,234)@4
    expR_uid235_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 6 => expXmY_uid234_div_uid45_fpArctan2Test_q(5)) & expXmY_uid234_div_uid45_fpArctan2Test_q));
    expR_uid235_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid54_fpArctan2Test_q));
    expR_uid235_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid235_div_uid45_fpArctan2Test_a) + SIGNED(expR_uid235_div_uid45_fpArctan2Test_b));
    expR_uid235_div_uid45_fpArctan2Test_q <= expR_uid235_div_uid45_fpArctan2Test_o(6 downto 0);

    -- divValPreNormHigh_uid255_div_uid45_fpArctan2Test(BITSELECT,254)@4
    divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in <= divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(11 downto 0);
    divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b <= divValPreNormHigh_uid255_div_uid45_fpArctan2Test_in(11 downto 1);

    -- divValPreNormLow_uid256_div_uid45_fpArctan2Test(BITSELECT,255)@4
    divValPreNormLow_uid256_div_uid45_fpArctan2Test_in <= divValPreNormTrunc_uid253_div_uid45_fpArctan2Test_q(10 downto 0);
    divValPreNormLow_uid256_div_uid45_fpArctan2Test_b <= divValPreNormLow_uid256_div_uid45_fpArctan2Test_in(10 downto 0);

    -- normFracRnd_uid257_div_uid45_fpArctan2Test(MUX,256)@4
    normFracRnd_uid257_div_uid45_fpArctan2Test_s <= norm_uid254_div_uid45_fpArctan2Test_b;
    normFracRnd_uid257_div_uid45_fpArctan2Test_combproc: PROCESS (normFracRnd_uid257_div_uid45_fpArctan2Test_s, divValPreNormLow_uid256_div_uid45_fpArctan2Test_b, divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b)
    BEGIN
        CASE (normFracRnd_uid257_div_uid45_fpArctan2Test_s) IS
            WHEN "0" => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= divValPreNormLow_uid256_div_uid45_fpArctan2Test_b;
            WHEN "1" => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= divValPreNormHigh_uid255_div_uid45_fpArctan2Test_b;
            WHEN OTHERS => normFracRnd_uid257_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid258_div_uid45_fpArctan2Test(BITJOIN,257)@4
    expFracRnd_uid258_div_uid45_fpArctan2Test_q <= expR_uid235_div_uid45_fpArctan2Test_q & normFracRnd_uid257_div_uid45_fpArctan2Test_q;

    -- expFracPostRnd_uid263_div_uid45_fpArctan2Test(ADD,262)@4
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => expFracRnd_uid258_div_uid45_fpArctan2Test_q(17)) & expFracRnd_uid258_div_uid45_fpArctan2Test_q));
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & rndOp_uid262_div_uid45_fpArctan2Test_q));
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid263_div_uid45_fpArctan2Test_a) + SIGNED(expFracPostRnd_uid263_div_uid45_fpArctan2Test_b));
    expFracPostRnd_uid263_div_uid45_fpArctan2Test_q <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_o(18 downto 0);

    -- excRPreExc_uid266_div_uid45_fpArctan2Test(BITSELECT,265)@4
    excRPreExc_uid266_div_uid45_fpArctan2Test_in <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(15 downto 0);
    excRPreExc_uid266_div_uid45_fpArctan2Test_b <= excRPreExc_uid266_div_uid45_fpArctan2Test_in(15 downto 11);

    -- invExpXIsMax_uid230_div_uid45_fpArctan2Test(LOGICAL,229)@4
    invExpXIsMax_uid230_div_uid45_fpArctan2Test_q <= not (expXIsMax_uid12_fpArctan2Test_q);

    -- InvExpXIsZero_uid231_div_uid45_fpArctan2Test(LOGICAL,230)@4
    InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q <= not (excZ_y_uid224_div_uid45_fpArctan2Test_q);

    -- excR_y_uid232_div_uid45_fpArctan2Test(LOGICAL,231)@4
    excR_y_uid232_div_uid45_fpArctan2Test_q <= InvExpXIsZero_uid231_div_uid45_fpArctan2Test_q and invExpXIsMax_uid230_div_uid45_fpArctan2Test_q;

    -- excXIYR_uid280_div_uid45_fpArctan2Test(LOGICAL,279)@4
    excXIYR_uid280_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- excXIYZ_uid279_div_uid45_fpArctan2Test(LOGICAL,278)@4
    excXIYZ_uid279_div_uid45_fpArctan2Test_q <= excI_yIn_uid29_fpArctan2Test_q and excZ_y_uid224_div_uid45_fpArctan2Test_q;

    -- expRExt_uid267_div_uid45_fpArctan2Test(BITSELECT,266)@4
    expRExt_uid267_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(18 downto 11));

    -- expOvf_uid271_div_uid45_fpArctan2Test(COMPARE,270)@4
    expOvf_uid271_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => expRExt_uid267_div_uid45_fpArctan2Test_b(7)) & expRExt_uid267_div_uid45_fpArctan2Test_b));
    expOvf_uid271_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid6_fpArctan2Test_q));
    expOvf_uid271_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid271_div_uid45_fpArctan2Test_a) - SIGNED(expOvf_uid271_div_uid45_fpArctan2Test_b));
    expOvf_uid271_div_uid45_fpArctan2Test_n(0) <= not (expOvf_uid271_div_uid45_fpArctan2Test_o(9));

    -- invExpXIsMax_uid216_div_uid45_fpArctan2Test(LOGICAL,215)@4
    invExpXIsMax_uid216_div_uid45_fpArctan2Test_q <= not (expXIsMax_uid26_fpArctan2Test_q);

    -- InvExpXIsZero_uid217_div_uid45_fpArctan2Test(LOGICAL,216)@4
    InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q <= not (excZ_x_uid210_div_uid45_fpArctan2Test_q);

    -- excR_x_uid218_div_uid45_fpArctan2Test(LOGICAL,217)@4
    excR_x_uid218_div_uid45_fpArctan2Test_q <= InvExpXIsZero_uid217_div_uid45_fpArctan2Test_q and invExpXIsMax_uid216_div_uid45_fpArctan2Test_q;

    -- excXRYROvf_uid278_div_uid45_fpArctan2Test(LOGICAL,277)@4
    excXRYROvf_uid278_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q and expOvf_uid271_div_uid45_fpArctan2Test_n;

    -- excXRYZ_uid277_div_uid45_fpArctan2Test(LOGICAL,276)@4
    excXRYZ_uid277_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q and excZ_y_uid224_div_uid45_fpArctan2Test_q;

    -- excRInf_uid281_div_uid45_fpArctan2Test(LOGICAL,280)@4
    excRInf_uid281_div_uid45_fpArctan2Test_q <= excXRYZ_uid277_div_uid45_fpArctan2Test_q or excXRYROvf_uid278_div_uid45_fpArctan2Test_q or excXIYZ_uid279_div_uid45_fpArctan2Test_q or excXIYR_uid280_div_uid45_fpArctan2Test_q;

    -- xRegOrZero_uid274_div_uid45_fpArctan2Test(LOGICAL,273)@4
    xRegOrZero_uid274_div_uid45_fpArctan2Test_q <= excR_x_uid218_div_uid45_fpArctan2Test_q or excZ_x_uid210_div_uid45_fpArctan2Test_q;

    -- regOrZeroOverInf_uid275_div_uid45_fpArctan2Test(LOGICAL,274)@4
    regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q <= xRegOrZero_uid274_div_uid45_fpArctan2Test_q and excI_xIn_uid15_fpArctan2Test_q;

    -- expUdf_uid268_div_uid45_fpArctan2Test(COMPARE,267)@4
    expUdf_uid268_div_uid45_fpArctan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000" & GND_q));
    expUdf_uid268_div_uid45_fpArctan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => expRExt_uid267_div_uid45_fpArctan2Test_b(7)) & expRExt_uid267_div_uid45_fpArctan2Test_b));
    expUdf_uid268_div_uid45_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid268_div_uid45_fpArctan2Test_a) - SIGNED(expUdf_uid268_div_uid45_fpArctan2Test_b));
    expUdf_uid268_div_uid45_fpArctan2Test_n(0) <= not (expUdf_uid268_div_uid45_fpArctan2Test_o(9));

    -- regOverRegWithUf_uid273_div_uid45_fpArctan2Test(LOGICAL,272)@4
    regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q <= expUdf_uid268_div_uid45_fpArctan2Test_n and excR_x_uid218_div_uid45_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- zeroOverReg_uid272_div_uid45_fpArctan2Test(LOGICAL,271)@4
    zeroOverReg_uid272_div_uid45_fpArctan2Test_q <= excZ_x_uid210_div_uid45_fpArctan2Test_q and excR_y_uid232_div_uid45_fpArctan2Test_q;

    -- excRZero_uid276_div_uid45_fpArctan2Test(LOGICAL,275)@4
    excRZero_uid276_div_uid45_fpArctan2Test_q <= zeroOverReg_uid272_div_uid45_fpArctan2Test_q or regOverRegWithUf_uid273_div_uid45_fpArctan2Test_q or regOrZeroOverInf_uid275_div_uid45_fpArctan2Test_q;

    -- concExc_uid285_div_uid45_fpArctan2Test(BITJOIN,284)@4
    concExc_uid285_div_uid45_fpArctan2Test_q <= excRNaN_uid284_div_uid45_fpArctan2Test_q & excRInf_uid281_div_uid45_fpArctan2Test_q & excRZero_uid276_div_uid45_fpArctan2Test_q;

    -- excREnc_uid286_div_uid45_fpArctan2Test(LOOKUP,285)@4
    excREnc_uid286_div_uid45_fpArctan2Test_combproc: PROCESS (concExc_uid285_div_uid45_fpArctan2Test_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid285_div_uid45_fpArctan2Test_q) IS
            WHEN "000" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "01";
            WHEN "001" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "010" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "10";
            WHEN "011" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "100" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "11";
            WHEN "101" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "110" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN "111" => excREnc_uid286_div_uid45_fpArctan2Test_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid286_div_uid45_fpArctan2Test_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid294_div_uid45_fpArctan2Test(MUX,293)@4
    expRPostExc_uid294_div_uid45_fpArctan2Test_s <= excREnc_uid286_div_uid45_fpArctan2Test_q;
    expRPostExc_uid294_div_uid45_fpArctan2Test_combproc: PROCESS (expRPostExc_uid294_div_uid45_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, excRPreExc_uid266_div_uid45_fpArctan2Test_b, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid294_div_uid45_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= excRPreExc_uid266_div_uid45_fpArctan2Test_b;
            WHEN "10" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid294_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid51_fpArctan2Test(CONSTANT,50)
    cstNaNWF_uid51_fpArctan2Test_q <= "0000000001";

    -- fracRPreExc_uid265_div_uid45_fpArctan2Test(BITSELECT,264)@4
    fracRPreExc_uid265_div_uid45_fpArctan2Test_in <= expFracPostRnd_uid263_div_uid45_fpArctan2Test_q(10 downto 0);
    fracRPreExc_uid265_div_uid45_fpArctan2Test_b <= fracRPreExc_uid265_div_uid45_fpArctan2Test_in(10 downto 1);

    -- fracRPostExc_uid290_div_uid45_fpArctan2Test(MUX,289)@4
    fracRPostExc_uid290_div_uid45_fpArctan2Test_s <= excREnc_uid286_div_uid45_fpArctan2Test_q;
    fracRPostExc_uid290_div_uid45_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid290_div_uid45_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, fracRPreExc_uid265_div_uid45_fpArctan2Test_b, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid290_div_uid45_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= fracRPreExc_uid265_div_uid45_fpArctan2Test_b;
            WHEN "10" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid290_div_uid45_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid297_div_uid45_fpArctan2Test(BITJOIN,296)@4
    divR_uid297_div_uid45_fpArctan2Test_q <= sRPostExc_uid296_div_uid45_fpArctan2Test_q & expRPostExc_uid294_div_uid45_fpArctan2Test_q & fracRPostExc_uid290_div_uid45_fpArctan2Test_q;

    -- redist5_divR_uid297_div_uid45_fpArctan2Test_q_1(DELAY,497)
    redist5_divR_uid297_div_uid45_fpArctan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => divR_uid297_div_uid45_fpArctan2Test_q, xout => redist5_divR_uid297_div_uid45_fpArctan2Test_q_1_q, clk => clk, aclr => areset );

    -- redist6_divR_uid297_div_uid45_fpArctan2Test_q_2(DELAY,498)
    redist6_divR_uid297_div_uid45_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist5_divR_uid297_div_uid45_fpArctan2Test_q_1_q, xout => redist6_divR_uid297_div_uid45_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- singX_uid48_fpArctan2Test(BITSELECT,47)@6
    singX_uid48_fpArctan2Test_b <= STD_LOGIC_VECTOR(redist6_divR_uid297_div_uid45_fpArctan2Test_q_2_q(15 downto 15));

    -- redist22_singX_uid48_fpArctan2Test_b_5(DELAY,514)
    redist22_singX_uid48_fpArctan2Test_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid48_fpArctan2Test_b, xout => redist22_singX_uid48_fpArctan2Test_b_5_q, clk => clk, aclr => areset );

    -- piO2_uid79_fpArctan2Test(CONSTANT,78)
    piO2_uid79_fpArctan2Test_q <= "1100100100010";

    -- cstPiO2_uid81_fpArctan2Test(BITSELECT,80)@11
    cstPiO2_uid81_fpArctan2Test_in <= piO2_uid79_fpArctan2Test_q(11 downto 0);
    cstPiO2_uid81_fpArctan2Test_b <= cstPiO2_uid81_fpArctan2Test_in(11 downto 2);

    -- fpPiO2C_uid82_fpArctan2Test(BITJOIN,81)@11
    fpPiO2C_uid82_fpArctan2Test_q <= redist22_singX_uid48_fpArctan2Test_b_5_q & cstBias_uid53_fpArctan2Test_q & cstPiO2_uid81_fpArctan2Test_b;

    -- piO4_uid80_fpArctan2Test(CONSTANT,79)
    piO4_uid80_fpArctan2Test_q <= "11001001000";

    -- cstPiO4_uid84_fpArctan2Test(BITSELECT,83)@11
    cstPiO4_uid84_fpArctan2Test_in <= piO4_uid80_fpArctan2Test_q(9 downto 0);
    cstPiO4_uid84_fpArctan2Test_b <= cstPiO4_uid84_fpArctan2Test_in(9 downto 0);

    -- fpPiO4C_uid85_fpArctan2Test(BITJOIN,84)@11
    fpPiO4C_uid85_fpArctan2Test_q <= redist22_singX_uid48_fpArctan2Test_b_5_q & cstBiasM1_uid54_fpArctan2Test_q & cstPiO4_uid84_fpArctan2Test_b;

    -- fracX_uid47_fpArctan2Test(BITSELECT,46)@4
    fracX_uid47_fpArctan2Test_b <= divR_uid297_div_uid45_fpArctan2Test_q(9 downto 0);

    -- redist23_fracX_uid47_fpArctan2Test_b_1(DELAY,515)
    redist23_fracX_uid47_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid47_fpArctan2Test_b, xout => redist23_fracX_uid47_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid67_fpArctan2Test(LOGICAL,66)@5 + 1
    fracXIsZero_uid67_fpArctan2Test_qi <= "1" WHEN cstZeroWF_uid7_fpArctan2Test_q = redist23_fracX_uid47_fpArctan2Test_b_1_q ELSE "0";
    fracXIsZero_uid67_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid67_fpArctan2Test_qi, xout => fracXIsZero_uid67_fpArctan2Test_q, clk => clk, aclr => areset );

    -- expX_uid46_fpArctan2Test(BITSELECT,45)@5
    expX_uid46_fpArctan2Test_b <= redist5_divR_uid297_div_uid45_fpArctan2Test_q_1_q(14 downto 10);

    -- expXIsMax_uid66_fpArctan2Test(LOGICAL,65)@5 + 1
    expXIsMax_uid66_fpArctan2Test_qi <= "1" WHEN expX_uid46_fpArctan2Test_b = cstAllOWE_uid6_fpArctan2Test_q ELSE "0";
    expXIsMax_uid66_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid66_fpArctan2Test_qi, xout => expXIsMax_uid66_fpArctan2Test_q, clk => clk, aclr => areset );

    -- excI_div_uid69_fpArctan2Test(LOGICAL,68)@6
    excI_div_uid69_fpArctan2Test_q <= expXIsMax_uid66_fpArctan2Test_q and fracXIsZero_uid67_fpArctan2Test_q;

    -- redist20_excI_div_uid69_fpArctan2Test_q_4(DELAY,512)
    redist20_excI_div_uid69_fpArctan2Test_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_div_uid69_fpArctan2Test_q, xout => redist20_excI_div_uid69_fpArctan2Test_q_4_q, clk => clk, aclr => areset );

    -- redist21_excI_div_uid69_fpArctan2Test_q_5(DELAY,513)
    redist21_excI_div_uid69_fpArctan2Test_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_excI_div_uid69_fpArctan2Test_q_4_q, xout => redist21_excI_div_uid69_fpArctan2Test_q_5_q, clk => clk, aclr => areset );

    -- constOut_uid87_fpArctan2Test(MUX,86)@11
    constOut_uid87_fpArctan2Test_s <= redist21_excI_div_uid69_fpArctan2Test_q_5_q;
    constOut_uid87_fpArctan2Test_combproc: PROCESS (constOut_uid87_fpArctan2Test_s, fpPiO4C_uid85_fpArctan2Test_q, fpPiO2C_uid82_fpArctan2Test_q)
    BEGIN
        CASE (constOut_uid87_fpArctan2Test_s) IS
            WHEN "0" => constOut_uid87_fpArctan2Test_q <= fpPiO4C_uid85_fpArctan2Test_q;
            WHEN "1" => constOut_uid87_fpArctan2Test_q <= fpPiO2C_uid82_fpArctan2Test_q;
            WHEN OTHERS => constOut_uid87_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracOutCst_uid151_fpArctan2Test_merged_bit_select(BITSELECT,482)@11
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_in <= constOut_uid87_fpArctan2Test_q(14 downto 0);
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_b <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_in(9 downto 0);
    fracOutCst_uid151_fpArctan2Test_merged_bit_select_c <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_in(14 downto 10);

    -- memoryC1_uid356_atan2Tables(LOOKUP,355)@6
    memoryC1_uid356_atan2Tables_combproc: PROCESS (yAddr_uid110_fpArctan2Test_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid110_fpArctan2Test_merged_bit_select_b) IS
            WHEN "0000000" => memoryC1_uid356_atan2Tables_q <= "111111111";
            WHEN "0000001" => memoryC1_uid356_atan2Tables_q <= "111111100";
            WHEN "0000010" => memoryC1_uid356_atan2Tables_q <= "111111001";
            WHEN "0000011" => memoryC1_uid356_atan2Tables_q <= "111110111";
            WHEN "0000100" => memoryC1_uid356_atan2Tables_q <= "111110100";
            WHEN "0000101" => memoryC1_uid356_atan2Tables_q <= "111110001";
            WHEN "0000110" => memoryC1_uid356_atan2Tables_q <= "111101111";
            WHEN "0000111" => memoryC1_uid356_atan2Tables_q <= "111101100";
            WHEN "0001000" => memoryC1_uid356_atan2Tables_q <= "111101001";
            WHEN "0001001" => memoryC1_uid356_atan2Tables_q <= "111100111";
            WHEN "0001010" => memoryC1_uid356_atan2Tables_q <= "111100101";
            WHEN "0001011" => memoryC1_uid356_atan2Tables_q <= "111100001";
            WHEN "0001100" => memoryC1_uid356_atan2Tables_q <= "111011111";
            WHEN "0001101" => memoryC1_uid356_atan2Tables_q <= "111011101";
            WHEN "0001110" => memoryC1_uid356_atan2Tables_q <= "111011010";
            WHEN "0001111" => memoryC1_uid356_atan2Tables_q <= "111010111";
            WHEN "0010000" => memoryC1_uid356_atan2Tables_q <= "111010101";
            WHEN "0010001" => memoryC1_uid356_atan2Tables_q <= "111010010";
            WHEN "0010010" => memoryC1_uid356_atan2Tables_q <= "111010000";
            WHEN "0010011" => memoryC1_uid356_atan2Tables_q <= "111001110";
            WHEN "0010100" => memoryC1_uid356_atan2Tables_q <= "111001100";
            WHEN "0010101" => memoryC1_uid356_atan2Tables_q <= "111001001";
            WHEN "0010110" => memoryC1_uid356_atan2Tables_q <= "111000110";
            WHEN "0010111" => memoryC1_uid356_atan2Tables_q <= "111000100";
            WHEN "0011000" => memoryC1_uid356_atan2Tables_q <= "111000001";
            WHEN "0011001" => memoryC1_uid356_atan2Tables_q <= "111000000";
            WHEN "0011010" => memoryC1_uid356_atan2Tables_q <= "110111101";
            WHEN "0011011" => memoryC1_uid356_atan2Tables_q <= "110111011";
            WHEN "0011100" => memoryC1_uid356_atan2Tables_q <= "110111000";
            WHEN "0011101" => memoryC1_uid356_atan2Tables_q <= "110110110";
            WHEN "0011110" => memoryC1_uid356_atan2Tables_q <= "110110100";
            WHEN "0011111" => memoryC1_uid356_atan2Tables_q <= "110110010";
            WHEN "0100000" => memoryC1_uid356_atan2Tables_q <= "110101111";
            WHEN "0100001" => memoryC1_uid356_atan2Tables_q <= "110101110";
            WHEN "0100010" => memoryC1_uid356_atan2Tables_q <= "110101011";
            WHEN "0100011" => memoryC1_uid356_atan2Tables_q <= "110101010";
            WHEN "0100100" => memoryC1_uid356_atan2Tables_q <= "110100111";
            WHEN "0100101" => memoryC1_uid356_atan2Tables_q <= "110100110";
            WHEN "0100110" => memoryC1_uid356_atan2Tables_q <= "110100011";
            WHEN "0100111" => memoryC1_uid356_atan2Tables_q <= "110100010";
            WHEN "0101000" => memoryC1_uid356_atan2Tables_q <= "110011111";
            WHEN "0101001" => memoryC1_uid356_atan2Tables_q <= "110011110";
            WHEN "0101010" => memoryC1_uid356_atan2Tables_q <= "110011100";
            WHEN "0101011" => memoryC1_uid356_atan2Tables_q <= "110011011";
            WHEN "0101100" => memoryC1_uid356_atan2Tables_q <= "110011000";
            WHEN "0101101" => memoryC1_uid356_atan2Tables_q <= "110010111";
            WHEN "0101110" => memoryC1_uid356_atan2Tables_q <= "110010101";
            WHEN "0101111" => memoryC1_uid356_atan2Tables_q <= "110010100";
            WHEN "0110000" => memoryC1_uid356_atan2Tables_q <= "110010010";
            WHEN "0110001" => memoryC1_uid356_atan2Tables_q <= "110010000";
            WHEN "0110010" => memoryC1_uid356_atan2Tables_q <= "110001111";
            WHEN "0110011" => memoryC1_uid356_atan2Tables_q <= "110001101";
            WHEN "0110100" => memoryC1_uid356_atan2Tables_q <= "110001101";
            WHEN "0110101" => memoryC1_uid356_atan2Tables_q <= "110001011";
            WHEN "0110110" => memoryC1_uid356_atan2Tables_q <= "110001001";
            WHEN "0110111" => memoryC1_uid356_atan2Tables_q <= "110001000";
            WHEN "0111000" => memoryC1_uid356_atan2Tables_q <= "110000110";
            WHEN "0111001" => memoryC1_uid356_atan2Tables_q <= "110000101";
            WHEN "0111010" => memoryC1_uid356_atan2Tables_q <= "110000100";
            WHEN "0111011" => memoryC1_uid356_atan2Tables_q <= "110000011";
            WHEN "0111100" => memoryC1_uid356_atan2Tables_q <= "110000001";
            WHEN "0111101" => memoryC1_uid356_atan2Tables_q <= "110000001";
            WHEN "0111110" => memoryC1_uid356_atan2Tables_q <= "101111111";
            WHEN "0111111" => memoryC1_uid356_atan2Tables_q <= "101111110";
            WHEN "1000000" => memoryC1_uid356_atan2Tables_q <= "101111110";
            WHEN "1000001" => memoryC1_uid356_atan2Tables_q <= "101111101";
            WHEN "1000010" => memoryC1_uid356_atan2Tables_q <= "101111011";
            WHEN "1000011" => memoryC1_uid356_atan2Tables_q <= "101111010";
            WHEN "1000100" => memoryC1_uid356_atan2Tables_q <= "101111001";
            WHEN "1000101" => memoryC1_uid356_atan2Tables_q <= "101111001";
            WHEN "1000110" => memoryC1_uid356_atan2Tables_q <= "101110111";
            WHEN "1000111" => memoryC1_uid356_atan2Tables_q <= "101110111";
            WHEN "1001000" => memoryC1_uid356_atan2Tables_q <= "101110110";
            WHEN "1001001" => memoryC1_uid356_atan2Tables_q <= "101110101";
            WHEN "1001010" => memoryC1_uid356_atan2Tables_q <= "101110100";
            WHEN "1001011" => memoryC1_uid356_atan2Tables_q <= "101110100";
            WHEN "1001100" => memoryC1_uid356_atan2Tables_q <= "101110011";
            WHEN "1001101" => memoryC1_uid356_atan2Tables_q <= "101110010";
            WHEN "1001110" => memoryC1_uid356_atan2Tables_q <= "101110010";
            WHEN "1001111" => memoryC1_uid356_atan2Tables_q <= "101110001";
            WHEN "1010000" => memoryC1_uid356_atan2Tables_q <= "101110001";
            WHEN "1010001" => memoryC1_uid356_atan2Tables_q <= "101110000";
            WHEN "1010010" => memoryC1_uid356_atan2Tables_q <= "101110000";
            WHEN "1010011" => memoryC1_uid356_atan2Tables_q <= "101101111";
            WHEN "1010100" => memoryC1_uid356_atan2Tables_q <= "101101111";
            WHEN "1010101" => memoryC1_uid356_atan2Tables_q <= "101101110";
            WHEN "1010110" => memoryC1_uid356_atan2Tables_q <= "101101110";
            WHEN "1010111" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1011000" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1011001" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1011010" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1011011" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1011100" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1011101" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1011110" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1011111" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1100000" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1100001" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1100010" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1100011" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1100100" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1100101" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1100110" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1100111" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1101000" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1101001" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1101010" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1101011" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1101100" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1101101" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1101110" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1101111" => memoryC1_uid356_atan2Tables_q <= "101101010";
            WHEN "1110000" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110001" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110010" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110011" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110100" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110101" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1110110" => memoryC1_uid356_atan2Tables_q <= "101101011";
            WHEN "1110111" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1111000" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1111001" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1111010" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1111011" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1111100" => memoryC1_uid356_atan2Tables_q <= "101101100";
            WHEN "1111101" => memoryC1_uid356_atan2Tables_q <= "101101110";
            WHEN "1111110" => memoryC1_uid356_atan2Tables_q <= "101101101";
            WHEN "1111111" => memoryC1_uid356_atan2Tables_q <= "101101110";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid356_atan2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test(BITSELECT,424)@6
    leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_in <= leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q(16 downto 0);
    leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_b <= leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_in(16 downto 0);

    -- leftShiftStage1Idx1_uid426_fxpU_uid107_fpArctan2Test(BITJOIN,425)@6
    leftShiftStage1Idx1_uid426_fxpU_uid107_fpArctan2Test_q <= leftShiftStage1Idx1Rng1_uid425_fxpU_uid107_fpArctan2Test_b & GND_q;

    -- leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test(BITSELECT,419)@6
    leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(11 downto 0);
    leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_in(11 downto 0);

    -- zS_uid102_fpArctan2Test(CONSTANT,101)
    zS_uid102_fpArctan2Test_q <= "000000";

    -- leftShiftStage0Idx3_uid421_fxpU_uid107_fpArctan2Test(BITJOIN,420)@6
    leftShiftStage0Idx3_uid421_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx3Rng6_uid420_fxpU_uid107_fpArctan2Test_b & zS_uid102_fpArctan2Test_q;

    -- leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test(BITSELECT,416)@6
    leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(13 downto 0);
    leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_in(13 downto 0);

    -- leftShiftStage0Idx2_uid418_fxpU_uid107_fpArctan2Test(BITJOIN,417)@6
    leftShiftStage0Idx2_uid418_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx2Rng4_uid417_fxpU_uid107_fpArctan2Test_b & leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test_q;

    -- leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test(BITSELECT,413)@6
    leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_in <= oFracUExt_uid105_fpArctan2Test_q(15 downto 0);
    leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_b <= leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_in(15 downto 0);

    -- leftShiftStage0Idx1_uid415_fxpU_uid107_fpArctan2Test(BITJOIN,414)@6
    leftShiftStage0Idx1_uid415_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx1Rng2_uid414_fxpU_uid107_fpArctan2Test_b & padACst_uid167_fpArctan2Test_q;

    -- cst01pWShift_uid104_fpArctan2Test(CONSTANT,103)
    cst01pWShift_uid104_fpArctan2Test_q <= "0000000";

    -- fracXIsNotZero_uid317_z_uid91_fpArctan2Test(LOGICAL,316)@6
    fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q <= not (fracXIsZero_uid67_fpArctan2Test_q);

    -- excN_x_uid319_z_uid91_fpArctan2Test(LOGICAL,318)@6
    excN_x_uid319_z_uid91_fpArctan2Test_q <= expXIsMax_uid66_fpArctan2Test_q and fracXIsNotZero_uid317_z_uid91_fpArctan2Test_q;

    -- invExcRNaN_uid349_z_uid91_fpArctan2Test(LOGICAL,348)@6
    invExcRNaN_uid349_z_uid91_fpArctan2Test_q <= not (excN_x_uid319_z_uid91_fpArctan2Test_q);

    -- signR_uid350_z_uid91_fpArctan2Test(LOGICAL,349)@6
    signR_uid350_z_uid91_fpArctan2Test_q <= singX_uid48_fpArctan2Test_b and invExcRNaN_uid349_z_uid91_fpArctan2Test_q;

    -- redist26_expX_uid46_fpArctan2Test_b_1(DELAY,518)
    redist26_expX_uid46_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid46_fpArctan2Test_b, xout => redist26_expX_uid46_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- cst2Bias_uid307_z_uid91_fpArctan2Test(CONSTANT,306)
    cst2Bias_uid307_z_uid91_fpArctan2Test_q <= "11110";

    -- expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test(SUB,334)@6
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid307_z_uid91_fpArctan2Test_q);
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & redist26_expX_uid46_fpArctan2Test_b_1_q);
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_a) - UNSIGNED(expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_b));
    expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q <= expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_o(5 downto 0);

    -- expRCompYIsOne_uid336_z_uid91_fpArctan2Test(BITSELECT,335)@6
    expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in <= expRCompYIsOneExt_uid335_z_uid91_fpArctan2Test_q(4 downto 0);
    expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b <= expRCompYIsOne_uid336_z_uid91_fpArctan2Test_in(4 downto 0);

    -- cst2BiasM1_uid306_z_uid91_fpArctan2Test(CONSTANT,305)
    cst2BiasM1_uid306_z_uid91_fpArctan2Test_q <= "11101";

    -- expRCompExt_uid332_z_uid91_fpArctan2Test(SUB,331)@5 + 1
    expRCompExt_uid332_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid306_z_uid91_fpArctan2Test_q);
    expRCompExt_uid332_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & expX_uid46_fpArctan2Test_b);
    expRCompExt_uid332_z_uid91_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCompExt_uid332_z_uid91_fpArctan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRCompExt_uid332_z_uid91_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid332_z_uid91_fpArctan2Test_a) - UNSIGNED(expRCompExt_uid332_z_uid91_fpArctan2Test_b));
        END IF;
    END PROCESS;
    expRCompExt_uid332_z_uid91_fpArctan2Test_q <= expRCompExt_uid332_z_uid91_fpArctan2Test_o(5 downto 0);

    -- expRComp_uid333_z_uid91_fpArctan2Test(BITSELECT,332)@6
    expRComp_uid333_z_uid91_fpArctan2Test_in <= expRCompExt_uid332_z_uid91_fpArctan2Test_q(4 downto 0);
    expRComp_uid333_z_uid91_fpArctan2Test_b <= expRComp_uid333_z_uid91_fpArctan2Test_in(4 downto 0);

    -- redist9_updatedY_uid203_div_uid45_fpArctan2Test_q_1(DELAY,501)
    redist9_updatedY_uid203_div_uid45_fpArctan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => updatedY_uid203_div_uid45_fpArctan2Test_q, xout => redist9_updatedY_uid203_div_uid45_fpArctan2Test_q_1_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid324_z_uid91_fpArctan2Test(LOGICAL,325)@4 + 1
    fracXIsZero_uid324_z_uid91_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & fracX_uid47_fpArctan2Test_b);
    fracXIsZero_uid324_z_uid91_fpArctan2Test_qi <= "1" WHEN fracXIsZero_uid324_z_uid91_fpArctan2Test_a = redist9_updatedY_uid203_div_uid45_fpArctan2Test_q_1_q ELSE "0";
    fracXIsZero_uid324_z_uid91_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid324_z_uid91_fpArctan2Test_qi, xout => fracXIsZero_uid324_z_uid91_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2(DELAY,496)
    redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid324_z_uid91_fpArctan2Test_q, xout => redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- expRCalc_uid341_z_uid91_fpArctan2Test(MUX,340)@6
    expRCalc_uid341_z_uid91_fpArctan2Test_s <= redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2_q;
    expRCalc_uid341_z_uid91_fpArctan2Test_combproc: PROCESS (expRCalc_uid341_z_uid91_fpArctan2Test_s, expRComp_uid333_z_uid91_fpArctan2Test_b, expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b)
    BEGIN
        CASE (expRCalc_uid341_z_uid91_fpArctan2Test_s) IS
            WHEN "0" => expRCalc_uid341_z_uid91_fpArctan2Test_q <= expRComp_uid333_z_uid91_fpArctan2Test_b;
            WHEN "1" => expRCalc_uid341_z_uid91_fpArctan2Test_q <= expRCompYIsOne_uid336_z_uid91_fpArctan2Test_b;
            WHEN OTHERS => expRCalc_uid341_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- excZ_div_uid450_uid65_fpArctan2Test(LOGICAL,64)@5 + 1
    excZ_div_uid450_uid65_fpArctan2Test_qi <= "1" WHEN expX_uid46_fpArctan2Test_b = cstAllZWE_uid52_fpArctan2Test_q ELSE "0";
    excZ_div_uid450_uid65_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_div_uid450_uid65_fpArctan2Test_qi, xout => excZ_div_uid450_uid65_fpArctan2Test_q, clk => clk, aclr => areset );

    -- udf_uid334_z_uid91_fpArctan2Test(BITSELECT,333)@6
    udf_uid334_z_uid91_fpArctan2Test_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => expRCompExt_uid332_z_uid91_fpArctan2Test_q(5)) & expRCompExt_uid332_z_uid91_fpArctan2Test_q));
    udf_uid334_z_uid91_fpArctan2Test_b <= STD_LOGIC_VECTOR(udf_uid334_z_uid91_fpArctan2Test_in(6 downto 6));

    -- invExpXIsMax_uid320_z_uid91_fpArctan2Test(LOGICAL,319)@6
    invExpXIsMax_uid320_z_uid91_fpArctan2Test_q <= not (expXIsMax_uid66_fpArctan2Test_q);

    -- InvExpXIsZero_uid321_z_uid91_fpArctan2Test(LOGICAL,320)@6
    InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q <= not (excZ_div_uid450_uid65_fpArctan2Test_q);

    -- excR_x_uid322_z_uid91_fpArctan2Test(LOGICAL,321)@6
    excR_x_uid322_z_uid91_fpArctan2Test_q <= InvExpXIsZero_uid321_z_uid91_fpArctan2Test_q and invExpXIsMax_uid320_z_uid91_fpArctan2Test_q;

    -- xRegAndUdf_uid342_z_uid91_fpArctan2Test(LOGICAL,341)@6
    xRegAndUdf_uid342_z_uid91_fpArctan2Test_q <= excR_x_uid322_z_uid91_fpArctan2Test_q and udf_uid334_z_uid91_fpArctan2Test_b;

    -- xIOrXRUdf_uid343_z_uid91_fpArctan2Test(LOGICAL,342)@6
    xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q <= excI_div_uid69_fpArctan2Test_q or xRegAndUdf_uid342_z_uid91_fpArctan2Test_q;

    -- excSelBits_uid344_z_uid91_fpArctan2Test(BITJOIN,343)@6
    excSelBits_uid344_z_uid91_fpArctan2Test_q <= excN_x_uid319_z_uid91_fpArctan2Test_q & excZ_div_uid450_uid65_fpArctan2Test_q & xIOrXRUdf_uid343_z_uid91_fpArctan2Test_q;

    -- outMuxSelEnc_uid345_z_uid91_fpArctan2Test(LOOKUP,344)@6
    outMuxSelEnc_uid345_z_uid91_fpArctan2Test_combproc: PROCESS (excSelBits_uid344_z_uid91_fpArctan2Test_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid344_z_uid91_fpArctan2Test_q) IS
            WHEN "000" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
            WHEN "001" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "00";
            WHEN "010" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "10";
            WHEN "011" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
            WHEN "100" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "11";
            WHEN "101" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
            WHEN "110" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
            WHEN "111" => outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid348_z_uid91_fpArctan2Test(MUX,347)@6
    expRPostExc_uid348_z_uid91_fpArctan2Test_s <= outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q;
    expRPostExc_uid348_z_uid91_fpArctan2Test_combproc: PROCESS (expRPostExc_uid348_z_uid91_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, expRCalc_uid341_z_uid91_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid348_z_uid91_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= expRCalc_uid341_z_uid91_fpArctan2Test_q;
            WHEN "10" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid348_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- memoryC1_uid390_inverseTables(LOOKUP,389)@4
    memoryC1_uid390_inverseTables_combproc: PROCESS (yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b) IS
            WHEN "000000" => memoryC1_uid390_inverseTables_q <= "100000011";
            WHEN "000001" => memoryC1_uid390_inverseTables_q <= "100001100";
            WHEN "000010" => memoryC1_uid390_inverseTables_q <= "100010011";
            WHEN "000011" => memoryC1_uid390_inverseTables_q <= "100011010";
            WHEN "000100" => memoryC1_uid390_inverseTables_q <= "100100000";
            WHEN "000101" => memoryC1_uid390_inverseTables_q <= "100100111";
            WHEN "000110" => memoryC1_uid390_inverseTables_q <= "100101101";
            WHEN "000111" => memoryC1_uid390_inverseTables_q <= "100110011";
            WHEN "001000" => memoryC1_uid390_inverseTables_q <= "100111001";
            WHEN "001001" => memoryC1_uid390_inverseTables_q <= "100111110";
            WHEN "001010" => memoryC1_uid390_inverseTables_q <= "101000011";
            WHEN "001011" => memoryC1_uid390_inverseTables_q <= "101001000";
            WHEN "001100" => memoryC1_uid390_inverseTables_q <= "101001100";
            WHEN "001101" => memoryC1_uid390_inverseTables_q <= "101010001";
            WHEN "001110" => memoryC1_uid390_inverseTables_q <= "101010110";
            WHEN "001111" => memoryC1_uid390_inverseTables_q <= "101011010";
            WHEN "010000" => memoryC1_uid390_inverseTables_q <= "101011110";
            WHEN "010001" => memoryC1_uid390_inverseTables_q <= "101100010";
            WHEN "010010" => memoryC1_uid390_inverseTables_q <= "101100110";
            WHEN "010011" => memoryC1_uid390_inverseTables_q <= "101101010";
            WHEN "010100" => memoryC1_uid390_inverseTables_q <= "101101101";
            WHEN "010101" => memoryC1_uid390_inverseTables_q <= "101110001";
            WHEN "010110" => memoryC1_uid390_inverseTables_q <= "101110011";
            WHEN "010111" => memoryC1_uid390_inverseTables_q <= "101111000";
            WHEN "011000" => memoryC1_uid390_inverseTables_q <= "101111011";
            WHEN "011001" => memoryC1_uid390_inverseTables_q <= "101111101";
            WHEN "011010" => memoryC1_uid390_inverseTables_q <= "110000000";
            WHEN "011011" => memoryC1_uid390_inverseTables_q <= "110000010";
            WHEN "011100" => memoryC1_uid390_inverseTables_q <= "110000110";
            WHEN "011101" => memoryC1_uid390_inverseTables_q <= "110001000";
            WHEN "011110" => memoryC1_uid390_inverseTables_q <= "110001010";
            WHEN "011111" => memoryC1_uid390_inverseTables_q <= "110001110";
            WHEN "100000" => memoryC1_uid390_inverseTables_q <= "110001111";
            WHEN "100001" => memoryC1_uid390_inverseTables_q <= "110010010";
            WHEN "100010" => memoryC1_uid390_inverseTables_q <= "110010011";
            WHEN "100011" => memoryC1_uid390_inverseTables_q <= "110010101";
            WHEN "100100" => memoryC1_uid390_inverseTables_q <= "110011000";
            WHEN "100101" => memoryC1_uid390_inverseTables_q <= "110011010";
            WHEN "100110" => memoryC1_uid390_inverseTables_q <= "110011100";
            WHEN "100111" => memoryC1_uid390_inverseTables_q <= "110011110";
            WHEN "101000" => memoryC1_uid390_inverseTables_q <= "110100000";
            WHEN "101001" => memoryC1_uid390_inverseTables_q <= "110100010";
            WHEN "101010" => memoryC1_uid390_inverseTables_q <= "110100100";
            WHEN "101011" => memoryC1_uid390_inverseTables_q <= "110100101";
            WHEN "101100" => memoryC1_uid390_inverseTables_q <= "110100111";
            WHEN "101101" => memoryC1_uid390_inverseTables_q <= "110101000";
            WHEN "101110" => memoryC1_uid390_inverseTables_q <= "110101011";
            WHEN "101111" => memoryC1_uid390_inverseTables_q <= "110101011";
            WHEN "110000" => memoryC1_uid390_inverseTables_q <= "110101101";
            WHEN "110001" => memoryC1_uid390_inverseTables_q <= "110101111";
            WHEN "110010" => memoryC1_uid390_inverseTables_q <= "110110000";
            WHEN "110011" => memoryC1_uid390_inverseTables_q <= "110110001";
            WHEN "110100" => memoryC1_uid390_inverseTables_q <= "110110011";
            WHEN "110101" => memoryC1_uid390_inverseTables_q <= "110110100";
            WHEN "110110" => memoryC1_uid390_inverseTables_q <= "110110110";
            WHEN "110111" => memoryC1_uid390_inverseTables_q <= "110110111";
            WHEN "111000" => memoryC1_uid390_inverseTables_q <= "110111000";
            WHEN "111001" => memoryC1_uid390_inverseTables_q <= "110111001";
            WHEN "111010" => memoryC1_uid390_inverseTables_q <= "110111010";
            WHEN "111011" => memoryC1_uid390_inverseTables_q <= "110111011";
            WHEN "111100" => memoryC1_uid390_inverseTables_q <= "110111101";
            WHEN "111101" => memoryC1_uid390_inverseTables_q <= "110111101";
            WHEN "111110" => memoryC1_uid390_inverseTables_q <= "110111110";
            WHEN "111111" => memoryC1_uid390_inverseTables_q <= "111000000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid390_inverseTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- oFracX_uid323_z_uid91_fpArctan2Test(BITJOIN,322)@4
    oFracX_uid323_z_uid91_fpArctan2Test_q <= VCC_q & fracX_uid47_fpArctan2Test_b;

    -- y_uid327_z_uid91_fpArctan2Test(BITSELECT,326)@4
    y_uid327_z_uid91_fpArctan2Test_in <= oFracX_uid323_z_uid91_fpArctan2Test_q(9 downto 0);
    y_uid327_z_uid91_fpArctan2Test_b <= y_uid327_z_uid91_fpArctan2Test_in(9 downto 0);

    -- yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select(BITSELECT,490)@4
    yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b <= y_uid327_z_uid91_fpArctan2Test_b(9 downto 4);
    yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c <= y_uid327_z_uid91_fpArctan2Test_b(3 downto 0);

    -- prodXY_uid408_pT1_uid396_invPolyEval(MULT,407)@4 + 2
    prodXY_uid408_pT1_uid396_invPolyEval_pr <= SIGNED(signed(resize(UNSIGNED(prodXY_uid408_pT1_uid396_invPolyEval_a0),5)) * SIGNED(prodXY_uid408_pT1_uid396_invPolyEval_b0));
    prodXY_uid408_pT1_uid396_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid408_pT1_uid396_invPolyEval_a0 <= (others => '0');
            prodXY_uid408_pT1_uid396_invPolyEval_b0 <= (others => '0');
            prodXY_uid408_pT1_uid396_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid408_pT1_uid396_invPolyEval_a0 <= yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_c;
            prodXY_uid408_pT1_uid396_invPolyEval_b0 <= STD_LOGIC_VECTOR(memoryC1_uid390_inverseTables_q);
            prodXY_uid408_pT1_uid396_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid408_pT1_uid396_invPolyEval_pr,13));
        END IF;
    END PROCESS;
    prodXY_uid408_pT1_uid396_invPolyEval_q <= prodXY_uid408_pT1_uid396_invPolyEval_s1;

    -- osig_uid409_pT1_uid396_invPolyEval(BITSELECT,408)@6
    osig_uid409_pT1_uid396_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid408_pT1_uid396_invPolyEval_q(12 downto 2));

    -- highBBits_uid398_invPolyEval(BITSELECT,397)@6
    highBBits_uid398_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid409_pT1_uid396_invPolyEval_b(10 downto 2));

    -- redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1(DELAY,493)
    redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b, xout => redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid387_inverseTables(LOOKUP,386)@5 + 1
    memoryC0_uid387_inverseTables_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid387_inverseTables_q <= "010000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1_q) IS
                WHEN "000000" => memoryC0_uid387_inverseTables_q <= "010000";
                WHEN "000001" => memoryC0_uid387_inverseTables_q <= "001111";
                WHEN "000010" => memoryC0_uid387_inverseTables_q <= "001111";
                WHEN "000011" => memoryC0_uid387_inverseTables_q <= "001111";
                WHEN "000100" => memoryC0_uid387_inverseTables_q <= "001111";
                WHEN "000101" => memoryC0_uid387_inverseTables_q <= "001110";
                WHEN "000110" => memoryC0_uid387_inverseTables_q <= "001110";
                WHEN "000111" => memoryC0_uid387_inverseTables_q <= "001110";
                WHEN "001000" => memoryC0_uid387_inverseTables_q <= "001110";
                WHEN "001001" => memoryC0_uid387_inverseTables_q <= "001110";
                WHEN "001010" => memoryC0_uid387_inverseTables_q <= "001101";
                WHEN "001011" => memoryC0_uid387_inverseTables_q <= "001101";
                WHEN "001100" => memoryC0_uid387_inverseTables_q <= "001101";
                WHEN "001101" => memoryC0_uid387_inverseTables_q <= "001101";
                WHEN "001110" => memoryC0_uid387_inverseTables_q <= "001101";
                WHEN "001111" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010000" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010001" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010010" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010011" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010100" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010101" => memoryC0_uid387_inverseTables_q <= "001100";
                WHEN "010110" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "010111" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011000" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011001" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011010" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011011" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011100" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011101" => memoryC0_uid387_inverseTables_q <= "001011";
                WHEN "011110" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "011111" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100000" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100001" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100010" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100011" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100100" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100101" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100110" => memoryC0_uid387_inverseTables_q <= "001010";
                WHEN "100111" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101000" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101001" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101010" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101011" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101100" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101101" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101110" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "101111" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "110000" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "110001" => memoryC0_uid387_inverseTables_q <= "001001";
                WHEN "110010" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "110011" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "110100" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "110101" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "110110" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "110111" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111000" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111001" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111010" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111011" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111100" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111101" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111110" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN "111111" => memoryC0_uid387_inverseTables_q <= "001000";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid387_inverseTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- memoryC0_uid386_inverseTables(LOOKUP,385)@5 + 1
    memoryC0_uid386_inverseTables_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid386_inverseTables_q <= "0000000100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist1_yAddr_uid329_z_uid91_fpArctan2Test_merged_bit_select_b_1_q) IS
                WHEN "000000" => memoryC0_uid386_inverseTables_q <= "0000000100";
                WHEN "000001" => memoryC0_uid386_inverseTables_q <= "1100000111";
                WHEN "000010" => memoryC0_uid386_inverseTables_q <= "1000010011";
                WHEN "000011" => memoryC0_uid386_inverseTables_q <= "0100100110";
                WHEN "000100" => memoryC0_uid386_inverseTables_q <= "0001000000";
                WHEN "000101" => memoryC0_uid386_inverseTables_q <= "1101100000";
                WHEN "000110" => memoryC0_uid386_inverseTables_q <= "1010000111";
                WHEN "000111" => memoryC0_uid386_inverseTables_q <= "0110110100";
                WHEN "001000" => memoryC0_uid386_inverseTables_q <= "0011100111";
                WHEN "001001" => memoryC0_uid386_inverseTables_q <= "0000100000";
                WHEN "001010" => memoryC0_uid386_inverseTables_q <= "1101011110";
                WHEN "001011" => memoryC0_uid386_inverseTables_q <= "1010100001";
                WHEN "001100" => memoryC0_uid386_inverseTables_q <= "0111101001";
                WHEN "001101" => memoryC0_uid386_inverseTables_q <= "0100110110";
                WHEN "001110" => memoryC0_uid386_inverseTables_q <= "0010000111";
                WHEN "001111" => memoryC0_uid386_inverseTables_q <= "1111011101";
                WHEN "010000" => memoryC0_uid386_inverseTables_q <= "1100110111";
                WHEN "010001" => memoryC0_uid386_inverseTables_q <= "1010010101";
                WHEN "010010" => memoryC0_uid386_inverseTables_q <= "0111110111";
                WHEN "010011" => memoryC0_uid386_inverseTables_q <= "0101011101";
                WHEN "010100" => memoryC0_uid386_inverseTables_q <= "0011000111";
                WHEN "010101" => memoryC0_uid386_inverseTables_q <= "0000110100";
                WHEN "010110" => memoryC0_uid386_inverseTables_q <= "1110100101";
                WHEN "010111" => memoryC0_uid386_inverseTables_q <= "1100011000";
                WHEN "011000" => memoryC0_uid386_inverseTables_q <= "1010001111";
                WHEN "011001" => memoryC0_uid386_inverseTables_q <= "1000001010";
                WHEN "011010" => memoryC0_uid386_inverseTables_q <= "0110000111";
                WHEN "011011" => memoryC0_uid386_inverseTables_q <= "0100000111";
                WHEN "011100" => memoryC0_uid386_inverseTables_q <= "0010001001";
                WHEN "011101" => memoryC0_uid386_inverseTables_q <= "0000001111";
                WHEN "011110" => memoryC0_uid386_inverseTables_q <= "1110010111";
                WHEN "011111" => memoryC0_uid386_inverseTables_q <= "1100100001";
                WHEN "100000" => memoryC0_uid386_inverseTables_q <= "1010101111";
                WHEN "100001" => memoryC0_uid386_inverseTables_q <= "1000111110";
                WHEN "100010" => memoryC0_uid386_inverseTables_q <= "0111010000";
                WHEN "100011" => memoryC0_uid386_inverseTables_q <= "0101100100";
                WHEN "100100" => memoryC0_uid386_inverseTables_q <= "0011111010";
                WHEN "100101" => memoryC0_uid386_inverseTables_q <= "0010010010";
                WHEN "100110" => memoryC0_uid386_inverseTables_q <= "0000101100";
                WHEN "100111" => memoryC0_uid386_inverseTables_q <= "1111001000";
                WHEN "101000" => memoryC0_uid386_inverseTables_q <= "1101100110";
                WHEN "101001" => memoryC0_uid386_inverseTables_q <= "1100000110";
                WHEN "101010" => memoryC0_uid386_inverseTables_q <= "1010101000";
                WHEN "101011" => memoryC0_uid386_inverseTables_q <= "1001001100";
                WHEN "101100" => memoryC0_uid386_inverseTables_q <= "0111110001";
                WHEN "101101" => memoryC0_uid386_inverseTables_q <= "0110011000";
                WHEN "101110" => memoryC0_uid386_inverseTables_q <= "0101000000";
                WHEN "101111" => memoryC0_uid386_inverseTables_q <= "0011101011";
                WHEN "110000" => memoryC0_uid386_inverseTables_q <= "0010010110";
                WHEN "110001" => memoryC0_uid386_inverseTables_q <= "0001000011";
                WHEN "110010" => memoryC0_uid386_inverseTables_q <= "1111110010";
                WHEN "110011" => memoryC0_uid386_inverseTables_q <= "1110100010";
                WHEN "110100" => memoryC0_uid386_inverseTables_q <= "1101010011";
                WHEN "110101" => memoryC0_uid386_inverseTables_q <= "1100000110";
                WHEN "110110" => memoryC0_uid386_inverseTables_q <= "1010111010";
                WHEN "110111" => memoryC0_uid386_inverseTables_q <= "1001101111";
                WHEN "111000" => memoryC0_uid386_inverseTables_q <= "1000100110";
                WHEN "111001" => memoryC0_uid386_inverseTables_q <= "0111011110";
                WHEN "111010" => memoryC0_uid386_inverseTables_q <= "0110010111";
                WHEN "111011" => memoryC0_uid386_inverseTables_q <= "0101010001";
                WHEN "111100" => memoryC0_uid386_inverseTables_q <= "0100001100";
                WHEN "111101" => memoryC0_uid386_inverseTables_q <= "0011001001";
                WHEN "111110" => memoryC0_uid386_inverseTables_q <= "0010000110";
                WHEN "111111" => memoryC0_uid386_inverseTables_q <= "0001000100";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid386_inverseTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- os_uid388_inverseTables(BITJOIN,387)@6
    os_uid388_inverseTables_q <= memoryC0_uid387_inverseTables_q & memoryC0_uid386_inverseTables_q;

    -- s1sumAHighB_uid399_invPolyEval(ADD,398)@6
    s1sumAHighB_uid399_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => os_uid388_inverseTables_q(15)) & os_uid388_inverseTables_q));
    s1sumAHighB_uid399_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 9 => highBBits_uid398_invPolyEval_b(8)) & highBBits_uid398_invPolyEval_b));
    s1sumAHighB_uid399_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid399_invPolyEval_a) + SIGNED(s1sumAHighB_uid399_invPolyEval_b));
    s1sumAHighB_uid399_invPolyEval_q <= s1sumAHighB_uid399_invPolyEval_o(16 downto 0);

    -- lowRangeB_uid397_invPolyEval(BITSELECT,396)@6
    lowRangeB_uid397_invPolyEval_in <= osig_uid409_pT1_uid396_invPolyEval_b(1 downto 0);
    lowRangeB_uid397_invPolyEval_b <= lowRangeB_uid397_invPolyEval_in(1 downto 0);

    -- s1_uid400_invPolyEval(BITJOIN,399)@6
    s1_uid400_invPolyEval_q <= s1sumAHighB_uid399_invPolyEval_q & lowRangeB_uid397_invPolyEval_b;

    -- fxpInverseRes_uid337_z_uid91_fpArctan2Test(BITSELECT,336)@6
    fxpInverseRes_uid337_z_uid91_fpArctan2Test_in <= s1_uid400_invPolyEval_q(15 downto 0);
    fxpInverseRes_uid337_z_uid91_fpArctan2Test_b <= fxpInverseRes_uid337_z_uid91_fpArctan2Test_in(15 downto 5);

    -- fxpInverseResFrac_uid339_z_uid91_fpArctan2Test(BITSELECT,338)@6
    fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in <= fxpInverseRes_uid337_z_uid91_fpArctan2Test_b(9 downto 0);
    fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b <= fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_in(9 downto 0);

    -- fracRCalc_uid340_z_uid91_fpArctan2Test(MUX,339)@6
    fracRCalc_uid340_z_uid91_fpArctan2Test_s <= redist4_fracXIsZero_uid324_z_uid91_fpArctan2Test_q_2_q;
    fracRCalc_uid340_z_uid91_fpArctan2Test_combproc: PROCESS (fracRCalc_uid340_z_uid91_fpArctan2Test_s, fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b, cstZeroWF_uid7_fpArctan2Test_q)
    BEGIN
        CASE (fracRCalc_uid340_z_uid91_fpArctan2Test_s) IS
            WHEN "0" => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= fxpInverseResFrac_uid339_z_uid91_fpArctan2Test_b;
            WHEN "1" => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN OTHERS => fracRCalc_uid340_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid347_z_uid91_fpArctan2Test(MUX,346)@6
    fracRPostExc_uid347_z_uid91_fpArctan2Test_s <= outMuxSelEnc_uid345_z_uid91_fpArctan2Test_q;
    fracRPostExc_uid347_z_uid91_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid347_z_uid91_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, fracRCalc_uid340_z_uid91_fpArctan2Test_q, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid347_z_uid91_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= fracRCalc_uid340_z_uid91_fpArctan2Test_q;
            WHEN "10" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid347_z_uid91_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid351_z_uid91_fpArctan2Test(BITJOIN,350)@6
    R_uid351_z_uid91_fpArctan2Test_q <= signR_uid350_z_uid91_fpArctan2Test_q & expRPostExc_uid348_z_uid91_fpArctan2Test_q & fracRPostExc_uid347_z_uid91_fpArctan2Test_q;

    -- path2_uid90_fpArctan2Test(COMPARE,89)@6
    path2_uid90_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & redist26_expX_uid46_fpArctan2Test_b_1_q);
    path2_uid90_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBias_uid53_fpArctan2Test_q);
    path2_uid90_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid90_fpArctan2Test_a) - UNSIGNED(path2_uid90_fpArctan2Test_b));
    path2_uid90_fpArctan2Test_n(0) <= not (path2_uid90_fpArctan2Test_o(6));

    -- u_uid92_fpArctan2Test(MUX,91)@6
    u_uid92_fpArctan2Test_s <= path2_uid90_fpArctan2Test_n;
    u_uid92_fpArctan2Test_combproc: PROCESS (u_uid92_fpArctan2Test_s, redist6_divR_uid297_div_uid45_fpArctan2Test_q_2_q, R_uid351_z_uid91_fpArctan2Test_q)
    BEGIN
        CASE (u_uid92_fpArctan2Test_s) IS
            WHEN "0" => u_uid92_fpArctan2Test_q <= redist6_divR_uid297_div_uid45_fpArctan2Test_q_2_q;
            WHEN "1" => u_uid92_fpArctan2Test_q <= R_uid351_z_uid91_fpArctan2Test_q;
            WHEN OTHERS => u_uid92_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expU_uid93_fpArctan2Test_merged_bit_select(BITSELECT,483)@6
    expU_uid93_fpArctan2Test_merged_bit_select_in <= u_uid92_fpArctan2Test_q(14 downto 0);
    expU_uid93_fpArctan2Test_merged_bit_select_b <= expU_uid93_fpArctan2Test_merged_bit_select_in(14 downto 10);
    expU_uid93_fpArctan2Test_merged_bit_select_c <= expU_uid93_fpArctan2Test_merged_bit_select_in(9 downto 0);

    -- oFracU_uid95_fpArctan2Test(BITJOIN,94)@6
    oFracU_uid95_fpArctan2Test_q <= VCC_q & expU_uid93_fpArctan2Test_merged_bit_select_c;

    -- oFracUExt_uid105_fpArctan2Test(BITJOIN,104)@6
    oFracUExt_uid105_fpArctan2Test_q <= cst01pWShift_uid104_fpArctan2Test_q & oFracU_uid95_fpArctan2Test_q;

    -- leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test(MUX,422)@6
    leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_s <= leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_b;
    leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_combproc: PROCESS (leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_s, oFracUExt_uid105_fpArctan2Test_q, leftShiftStage0Idx1_uid415_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx2_uid418_fxpU_uid107_fpArctan2Test_q, leftShiftStage0Idx3_uid421_fxpU_uid107_fpArctan2Test_q)
    BEGIN
        CASE (leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_s) IS
            WHEN "00" => leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q <= oFracUExt_uid105_fpArctan2Test_q;
            WHEN "01" => leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx1_uid415_fxpU_uid107_fpArctan2Test_q;
            WHEN "10" => leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx2_uid418_fxpU_uid107_fpArctan2Test_q;
            WHEN "11" => leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0Idx3_uid421_fxpU_uid107_fpArctan2Test_q;
            WHEN OTHERS => leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftBias_uid98_fpArctan2Test(CONSTANT,97)
    shiftBias_uid98_fpArctan2Test_q <= "01000";

    -- shiftValue_uid99_fpArctan2Test(SUB,98)@6
    shiftValue_uid99_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expU_uid93_fpArctan2Test_merged_bit_select_b);
    shiftValue_uid99_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid98_fpArctan2Test_q);
    shiftValue_uid99_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid99_fpArctan2Test_a) - UNSIGNED(shiftValue_uid99_fpArctan2Test_b));
    shiftValue_uid99_fpArctan2Test_q <= shiftValue_uid99_fpArctan2Test_o(5 downto 0);

    -- xMSB_uid100_fpArctan2Test(BITSELECT,99)@6
    xMSB_uid100_fpArctan2Test_b <= STD_LOGIC_VECTOR(shiftValue_uid99_fpArctan2Test_q(5 downto 5));

    -- shiftValuePostNeg_uid103_fpArctan2Test(MUX,102)@6
    shiftValuePostNeg_uid103_fpArctan2Test_s <= xMSB_uid100_fpArctan2Test_b;
    shiftValuePostNeg_uid103_fpArctan2Test_combproc: PROCESS (shiftValuePostNeg_uid103_fpArctan2Test_s, shiftValue_uid99_fpArctan2Test_q, zS_uid102_fpArctan2Test_q)
    BEGIN
        CASE (shiftValuePostNeg_uid103_fpArctan2Test_s) IS
            WHEN "0" => shiftValuePostNeg_uid103_fpArctan2Test_q <= shiftValue_uid99_fpArctan2Test_q;
            WHEN "1" => shiftValuePostNeg_uid103_fpArctan2Test_q <= zS_uid102_fpArctan2Test_q;
            WHEN OTHERS => shiftValuePostNeg_uid103_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpShifterBits_uid106_fpArctan2Test(BITSELECT,105)@6
    fxpShifterBits_uid106_fpArctan2Test_in <= shiftValuePostNeg_uid103_fpArctan2Test_q(2 downto 0);
    fxpShifterBits_uid106_fpArctan2Test_b <= fxpShifterBits_uid106_fpArctan2Test_in(2 downto 0);

    -- leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select(BITSELECT,484)@6
    leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_b <= fxpShifterBits_uid106_fpArctan2Test_b(2 downto 1);
    leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_c <= fxpShifterBits_uid106_fpArctan2Test_b(0 downto 0);

    -- leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test(MUX,427)@6
    leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_s <= leftShiftStageSel2Dto1_uid422_fxpU_uid107_fpArctan2Test_merged_bit_select_c;
    leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_combproc: PROCESS (leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_s, leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q, leftShiftStage1Idx1_uid426_fxpU_uid107_fpArctan2Test_q)
    BEGIN
        CASE (leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_s) IS
            WHEN "0" => leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_q <= leftShiftStage0_uid423_fxpU_uid107_fpArctan2Test_q;
            WHEN "1" => leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_q <= leftShiftStage1Idx1_uid426_fxpU_uid107_fpArctan2Test_q;
            WHEN OTHERS => leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- y_uid108_fpArctan2Test(BITSELECT,107)@6
    y_uid108_fpArctan2Test_in <= leftShiftStage1_uid428_fxpU_uid107_fpArctan2Test_q(16 downto 0);
    y_uid108_fpArctan2Test_b <= y_uid108_fpArctan2Test_in(16 downto 1);

    -- yAddr_uid110_fpArctan2Test_merged_bit_select(BITSELECT,485)@6
    yAddr_uid110_fpArctan2Test_merged_bit_select_b <= y_uid108_fpArctan2Test_b(15 downto 9);
    yAddr_uid110_fpArctan2Test_merged_bit_select_c <= y_uid108_fpArctan2Test_b(8 downto 3);

    -- prodXY_uid402_pT1_uid362_invPolyEval(MULT,401)@6 + 2
    prodXY_uid402_pT1_uid362_invPolyEval_pr <= SIGNED(signed(resize(UNSIGNED(prodXY_uid402_pT1_uid362_invPolyEval_a0),7)) * SIGNED(prodXY_uid402_pT1_uid362_invPolyEval_b0));
    prodXY_uid402_pT1_uid362_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid402_pT1_uid362_invPolyEval_a0 <= (others => '0');
            prodXY_uid402_pT1_uid362_invPolyEval_b0 <= (others => '0');
            prodXY_uid402_pT1_uid362_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid402_pT1_uid362_invPolyEval_a0 <= yAddr_uid110_fpArctan2Test_merged_bit_select_c;
            prodXY_uid402_pT1_uid362_invPolyEval_b0 <= STD_LOGIC_VECTOR(memoryC1_uid356_atan2Tables_q);
            prodXY_uid402_pT1_uid362_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid402_pT1_uid362_invPolyEval_pr,15));
        END IF;
    END PROCESS;
    prodXY_uid402_pT1_uid362_invPolyEval_q <= prodXY_uid402_pT1_uid362_invPolyEval_s1;

    -- osig_uid403_pT1_uid362_invPolyEval(BITSELECT,402)@8
    osig_uid403_pT1_uid362_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid402_pT1_uid362_invPolyEval_q(14 downto 4));

    -- highBBits_uid364_invPolyEval(BITSELECT,363)@8
    highBBits_uid364_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid403_pT1_uid362_invPolyEval_b(10 downto 2));

    -- redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2(DELAY,494)
    redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid110_fpArctan2Test_merged_bit_select_b, xout => redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC0_uid353_atan2Tables(LOOKUP,352)@8
    memoryC0_uid353_atan2Tables_combproc: PROCESS (redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist2_yAddr_uid110_fpArctan2Test_merged_bit_select_b_2_q) IS
            WHEN "0000000" => memoryC0_uid353_atan2Tables_q <= "010000000000000100";
            WHEN "0000001" => memoryC0_uid353_atan2Tables_q <= "010000000000000011";
            WHEN "0000010" => memoryC0_uid353_atan2Tables_q <= "001111111111111111";
            WHEN "0000011" => memoryC0_uid353_atan2Tables_q <= "001111111111111000";
            WHEN "0000100" => memoryC0_uid353_atan2Tables_q <= "001111111111101111";
            WHEN "0000101" => memoryC0_uid353_atan2Tables_q <= "001111111111100011";
            WHEN "0000110" => memoryC0_uid353_atan2Tables_q <= "001111111111010100";
            WHEN "0000111" => memoryC0_uid353_atan2Tables_q <= "001111111111000011";
            WHEN "0001000" => memoryC0_uid353_atan2Tables_q <= "001111111110101111";
            WHEN "0001001" => memoryC0_uid353_atan2Tables_q <= "001111111110011000";
            WHEN "0001010" => memoryC0_uid353_atan2Tables_q <= "001111111101111111";
            WHEN "0001011" => memoryC0_uid353_atan2Tables_q <= "001111111101100100";
            WHEN "0001100" => memoryC0_uid353_atan2Tables_q <= "001111111101000101";
            WHEN "0001101" => memoryC0_uid353_atan2Tables_q <= "001111111100100100";
            WHEN "0001110" => memoryC0_uid353_atan2Tables_q <= "001111111100000001";
            WHEN "0001111" => memoryC0_uid353_atan2Tables_q <= "001111111011011011";
            WHEN "0010000" => memoryC0_uid353_atan2Tables_q <= "001111111010110010";
            WHEN "0010001" => memoryC0_uid353_atan2Tables_q <= "001111111010000111";
            WHEN "0010010" => memoryC0_uid353_atan2Tables_q <= "001111111001011001";
            WHEN "0010011" => memoryC0_uid353_atan2Tables_q <= "001111111000101001";
            WHEN "0010100" => memoryC0_uid353_atan2Tables_q <= "001111110111110110";
            WHEN "0010101" => memoryC0_uid353_atan2Tables_q <= "001111110111000001";
            WHEN "0010110" => memoryC0_uid353_atan2Tables_q <= "001111110110001010";
            WHEN "0010111" => memoryC0_uid353_atan2Tables_q <= "001111110101010000";
            WHEN "0011000" => memoryC0_uid353_atan2Tables_q <= "001111110100010100";
            WHEN "0011001" => memoryC0_uid353_atan2Tables_q <= "001111110011010101";
            WHEN "0011010" => memoryC0_uid353_atan2Tables_q <= "001111110010010100";
            WHEN "0011011" => memoryC0_uid353_atan2Tables_q <= "001111110001010001";
            WHEN "0011100" => memoryC0_uid353_atan2Tables_q <= "001111110000001100";
            WHEN "0011101" => memoryC0_uid353_atan2Tables_q <= "001111101111000100";
            WHEN "0011110" => memoryC0_uid353_atan2Tables_q <= "001111101101111010";
            WHEN "0011111" => memoryC0_uid353_atan2Tables_q <= "001111101100101110";
            WHEN "0100000" => memoryC0_uid353_atan2Tables_q <= "001111101011100000";
            WHEN "0100001" => memoryC0_uid353_atan2Tables_q <= "001111101010001111";
            WHEN "0100010" => memoryC0_uid353_atan2Tables_q <= "001111101000111101";
            WHEN "0100011" => memoryC0_uid353_atan2Tables_q <= "001111100111101000";
            WHEN "0100100" => memoryC0_uid353_atan2Tables_q <= "001111100110010010";
            WHEN "0100101" => memoryC0_uid353_atan2Tables_q <= "001111100100111001";
            WHEN "0100110" => memoryC0_uid353_atan2Tables_q <= "001111100011011111";
            WHEN "0100111" => memoryC0_uid353_atan2Tables_q <= "001111100010000010";
            WHEN "0101000" => memoryC0_uid353_atan2Tables_q <= "001111100000100100";
            WHEN "0101001" => memoryC0_uid353_atan2Tables_q <= "001111011111000011";
            WHEN "0101010" => memoryC0_uid353_atan2Tables_q <= "001111011101100001";
            WHEN "0101011" => memoryC0_uid353_atan2Tables_q <= "001111011011111101";
            WHEN "0101100" => memoryC0_uid353_atan2Tables_q <= "001111011010011000";
            WHEN "0101101" => memoryC0_uid353_atan2Tables_q <= "001111011000110000";
            WHEN "0101110" => memoryC0_uid353_atan2Tables_q <= "001111010111000111";
            WHEN "0101111" => memoryC0_uid353_atan2Tables_q <= "001111010101011100";
            WHEN "0110000" => memoryC0_uid353_atan2Tables_q <= "001111010011110000";
            WHEN "0110001" => memoryC0_uid353_atan2Tables_q <= "001111010010000010";
            WHEN "0110010" => memoryC0_uid353_atan2Tables_q <= "001111010000010010";
            WHEN "0110011" => memoryC0_uid353_atan2Tables_q <= "001111001110100001";
            WHEN "0110100" => memoryC0_uid353_atan2Tables_q <= "001111001100101110";
            WHEN "0110101" => memoryC0_uid353_atan2Tables_q <= "001111001010111010";
            WHEN "0110110" => memoryC0_uid353_atan2Tables_q <= "001111001001000101";
            WHEN "0110111" => memoryC0_uid353_atan2Tables_q <= "001111000111001110";
            WHEN "0111000" => memoryC0_uid353_atan2Tables_q <= "001111000101010110";
            WHEN "0111001" => memoryC0_uid353_atan2Tables_q <= "001111000011011100";
            WHEN "0111010" => memoryC0_uid353_atan2Tables_q <= "001111000001100001";
            WHEN "0111011" => memoryC0_uid353_atan2Tables_q <= "001110111111100101";
            WHEN "0111100" => memoryC0_uid353_atan2Tables_q <= "001110111101101000";
            WHEN "0111101" => memoryC0_uid353_atan2Tables_q <= "001110111011101001";
            WHEN "0111110" => memoryC0_uid353_atan2Tables_q <= "001110111001101010";
            WHEN "0111111" => memoryC0_uid353_atan2Tables_q <= "001110110111101001";
            WHEN "1000000" => memoryC0_uid353_atan2Tables_q <= "001110110101100111";
            WHEN "1000001" => memoryC0_uid353_atan2Tables_q <= "001110110011100100";
            WHEN "1000010" => memoryC0_uid353_atan2Tables_q <= "001110110001100001";
            WHEN "1000011" => memoryC0_uid353_atan2Tables_q <= "001110101111011100";
            WHEN "1000100" => memoryC0_uid353_atan2Tables_q <= "001110101101010110";
            WHEN "1000101" => memoryC0_uid353_atan2Tables_q <= "001110101011001111";
            WHEN "1000110" => memoryC0_uid353_atan2Tables_q <= "001110101001001000";
            WHEN "1000111" => memoryC0_uid353_atan2Tables_q <= "001110100110111111";
            WHEN "1001000" => memoryC0_uid353_atan2Tables_q <= "001110100100110110";
            WHEN "1001001" => memoryC0_uid353_atan2Tables_q <= "001110100010101100";
            WHEN "1001010" => memoryC0_uid353_atan2Tables_q <= "001110100000100001";
            WHEN "1001011" => memoryC0_uid353_atan2Tables_q <= "001110011110010101";
            WHEN "1001100" => memoryC0_uid353_atan2Tables_q <= "001110011100001001";
            WHEN "1001101" => memoryC0_uid353_atan2Tables_q <= "001110011001111100";
            WHEN "1001110" => memoryC0_uid353_atan2Tables_q <= "001110010111101110";
            WHEN "1001111" => memoryC0_uid353_atan2Tables_q <= "001110010101100000";
            WHEN "1010000" => memoryC0_uid353_atan2Tables_q <= "001110010011010001";
            WHEN "1010001" => memoryC0_uid353_atan2Tables_q <= "001110010001000010";
            WHEN "1010010" => memoryC0_uid353_atan2Tables_q <= "001110001110110010";
            WHEN "1010011" => memoryC0_uid353_atan2Tables_q <= "001110001100100010";
            WHEN "1010100" => memoryC0_uid353_atan2Tables_q <= "001110001010010001";
            WHEN "1010101" => memoryC0_uid353_atan2Tables_q <= "001110001000000000";
            WHEN "1010110" => memoryC0_uid353_atan2Tables_q <= "001110000101101110";
            WHEN "1010111" => memoryC0_uid353_atan2Tables_q <= "001110000011011100";
            WHEN "1011000" => memoryC0_uid353_atan2Tables_q <= "001110000001001001";
            WHEN "1011001" => memoryC0_uid353_atan2Tables_q <= "001101111110110110";
            WHEN "1011010" => memoryC0_uid353_atan2Tables_q <= "001101111100100011";
            WHEN "1011011" => memoryC0_uid353_atan2Tables_q <= "001101111010001111";
            WHEN "1011100" => memoryC0_uid353_atan2Tables_q <= "001101110111111100";
            WHEN "1011101" => memoryC0_uid353_atan2Tables_q <= "001101110101101000";
            WHEN "1011110" => memoryC0_uid353_atan2Tables_q <= "001101110011010011";
            WHEN "1011111" => memoryC0_uid353_atan2Tables_q <= "001101110000111111";
            WHEN "1100000" => memoryC0_uid353_atan2Tables_q <= "001101101110101010";
            WHEN "1100001" => memoryC0_uid353_atan2Tables_q <= "001101101100010101";
            WHEN "1100010" => memoryC0_uid353_atan2Tables_q <= "001101101010000000";
            WHEN "1100011" => memoryC0_uid353_atan2Tables_q <= "001101100111101011";
            WHEN "1100100" => memoryC0_uid353_atan2Tables_q <= "001101100101010110";
            WHEN "1100101" => memoryC0_uid353_atan2Tables_q <= "001101100011000000";
            WHEN "1100110" => memoryC0_uid353_atan2Tables_q <= "001101100000101011";
            WHEN "1100111" => memoryC0_uid353_atan2Tables_q <= "001101011110010101";
            WHEN "1101000" => memoryC0_uid353_atan2Tables_q <= "001101011011111111";
            WHEN "1101001" => memoryC0_uid353_atan2Tables_q <= "001101011001101010";
            WHEN "1101010" => memoryC0_uid353_atan2Tables_q <= "001101010111010100";
            WHEN "1101011" => memoryC0_uid353_atan2Tables_q <= "001101010100111111";
            WHEN "1101100" => memoryC0_uid353_atan2Tables_q <= "001101010010101001";
            WHEN "1101101" => memoryC0_uid353_atan2Tables_q <= "001101010000010011";
            WHEN "1101110" => memoryC0_uid353_atan2Tables_q <= "001101001101111110";
            WHEN "1101111" => memoryC0_uid353_atan2Tables_q <= "001101001011101001";
            WHEN "1110000" => memoryC0_uid353_atan2Tables_q <= "001101001001010011";
            WHEN "1110001" => memoryC0_uid353_atan2Tables_q <= "001101000110111110";
            WHEN "1110010" => memoryC0_uid353_atan2Tables_q <= "001101000100101001";
            WHEN "1110011" => memoryC0_uid353_atan2Tables_q <= "001101000010010100";
            WHEN "1110100" => memoryC0_uid353_atan2Tables_q <= "001100111111111111";
            WHEN "1110101" => memoryC0_uid353_atan2Tables_q <= "001100111101101010";
            WHEN "1110110" => memoryC0_uid353_atan2Tables_q <= "001100111011010110";
            WHEN "1110111" => memoryC0_uid353_atan2Tables_q <= "001100111001000001";
            WHEN "1111000" => memoryC0_uid353_atan2Tables_q <= "001100110110101101";
            WHEN "1111001" => memoryC0_uid353_atan2Tables_q <= "001100110100011001";
            WHEN "1111010" => memoryC0_uid353_atan2Tables_q <= "001100110010000101";
            WHEN "1111011" => memoryC0_uid353_atan2Tables_q <= "001100101111110010";
            WHEN "1111100" => memoryC0_uid353_atan2Tables_q <= "001100101101011111";
            WHEN "1111101" => memoryC0_uid353_atan2Tables_q <= "001100101011001011";
            WHEN "1111110" => memoryC0_uid353_atan2Tables_q <= "001100101000111001";
            WHEN "1111111" => memoryC0_uid353_atan2Tables_q <= "001100100110100110";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid353_atan2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid365_invPolyEval(ADD,364)@8
    s1sumAHighB_uid365_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => memoryC0_uid353_atan2Tables_q(17)) & memoryC0_uid353_atan2Tables_q));
    s1sumAHighB_uid365_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 9 => highBBits_uid364_invPolyEval_b(8)) & highBBits_uid364_invPolyEval_b));
    s1sumAHighB_uid365_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid365_invPolyEval_a) + SIGNED(s1sumAHighB_uid365_invPolyEval_b));
    s1sumAHighB_uid365_invPolyEval_q <= s1sumAHighB_uid365_invPolyEval_o(18 downto 0);

    -- lowRangeB_uid363_invPolyEval(BITSELECT,362)@8
    lowRangeB_uid363_invPolyEval_in <= osig_uid403_pT1_uid362_invPolyEval_b(1 downto 0);
    lowRangeB_uid363_invPolyEval_b <= lowRangeB_uid363_invPolyEval_in(1 downto 0);

    -- s1_uid366_invPolyEval(BITJOIN,365)@8
    s1_uid366_invPolyEval_q <= s1sumAHighB_uid365_invPolyEval_q & lowRangeB_uid363_invPolyEval_b;

    -- fxpAtanXOXRes_uid113_fpArctan2Test(BITSELECT,112)@8
    fxpAtanXOXRes_uid113_fpArctan2Test_in <= s1_uid366_invPolyEval_q(18 downto 0);
    fxpAtanXOXRes_uid113_fpArctan2Test_b <= fxpAtanXOXRes_uid113_fpArctan2Test_in(18 downto 5);

    -- redist17_oFracU_uid95_fpArctan2Test_q_2(DELAY,509)
    redist17_oFracU_uid95_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracU_uid95_fpArctan2Test_q, xout => redist17_oFracU_uid95_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- mulXAtanXOXRes_uid114_fpArctan2Test_cma(CHAINMULTADD,479)@8 + 2
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_reset <= areset;
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena0 <= '1';
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena1 <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena0;
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_p(0) <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0(0) * mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0(0);
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid114_fpArctan2Test_cma_p(0),25);
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_w(0) <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_u(0);
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_x(0) <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_w(0);
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_y(0) <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_x(0);
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid114_fpArctan2Test_cma_a0(0) <= RESIZE(UNSIGNED(redist17_oFracU_uid95_fpArctan2Test_q_2_q),11);
                mulXAtanXOXRes_uid114_fpArctan2Test_cma_c0(0) <= RESIZE(UNSIGNED(fxpAtanXOXRes_uid113_fpArctan2Test_b),14);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid114_fpArctan2Test_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid114_fpArctan2Test_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid114_fpArctan2Test_cma_s(0) <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid114_fpArctan2Test_cma_s(0)(24 downto 0)), xout => mulXAtanXOXRes_uid114_fpArctan2Test_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid114_fpArctan2Test_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid114_fpArctan2Test_cma_qq(24 downto 0));

    -- normBit_uid115_fpArctan2Test(BITSELECT,114)@10
    normBit_uid115_fpArctan2Test_in <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid114_fpArctan2Test_cma_q(23 downto 0));
    normBit_uid115_fpArctan2Test_b <= STD_LOGIC_VECTOR(normBit_uid115_fpArctan2Test_in(23 downto 23));

    -- invNormBit_uid119_fpArctan2Test(LOGICAL,118)@10
    invNormBit_uid119_fpArctan2Test_q <= not (normBit_uid115_fpArctan2Test_b);

    -- redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4(DELAY,495)
    redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid93_fpArctan2Test_merged_bit_select_b, xout => redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- expRPath3Ext_uid120_fpArctan2Test(SUB,119)@10
    expRPath3Ext_uid120_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4_q);
    expRPath3Ext_uid120_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000" & invNormBit_uid119_fpArctan2Test_q);
    expRPath3Ext_uid120_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid120_fpArctan2Test_a) - UNSIGNED(expRPath3Ext_uid120_fpArctan2Test_b));
    expRPath3Ext_uid120_fpArctan2Test_q <= expRPath3Ext_uid120_fpArctan2Test_o(5 downto 0);

    -- expRPath3PreRnd_uid121_fpArctan2Test(BITSELECT,120)@10
    expRPath3PreRnd_uid121_fpArctan2Test_in <= expRPath3Ext_uid120_fpArctan2Test_q(4 downto 0);
    expRPath3PreRnd_uid121_fpArctan2Test_b <= expRPath3PreRnd_uid121_fpArctan2Test_in(4 downto 0);

    -- redist16_expRPath3PreRnd_uid121_fpArctan2Test_b_1(DELAY,508)
    redist16_expRPath3PreRnd_uid121_fpArctan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPath3PreRnd_uid121_fpArctan2Test_b, xout => redist16_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q, clk => clk, aclr => areset );

    -- fracRPath3High_uid116_fpArctan2Test(BITSELECT,115)@10
    fracRPath3High_uid116_fpArctan2Test_in <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_q(22 downto 0);
    fracRPath3High_uid116_fpArctan2Test_b <= fracRPath3High_uid116_fpArctan2Test_in(22 downto 12);

    -- fracRPath3Low_uid117_fpArctan2Test(BITSELECT,116)@10
    fracRPath3Low_uid117_fpArctan2Test_in <= mulXAtanXOXRes_uid114_fpArctan2Test_cma_q(21 downto 0);
    fracRPath3Low_uid117_fpArctan2Test_b <= fracRPath3Low_uid117_fpArctan2Test_in(21 downto 11);

    -- fracRPath3Pre_uid118_fpArctan2Test(MUX,117)@10 + 1
    fracRPath3Pre_uid118_fpArctan2Test_s <= normBit_uid115_fpArctan2Test_b;
    fracRPath3Pre_uid118_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPath3Pre_uid118_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPath3Pre_uid118_fpArctan2Test_s) IS
                WHEN "0" => fracRPath3Pre_uid118_fpArctan2Test_q <= fracRPath3Low_uid117_fpArctan2Test_b;
                WHEN "1" => fracRPath3Pre_uid118_fpArctan2Test_q <= fracRPath3High_uid116_fpArctan2Test_b;
                WHEN OTHERS => fracRPath3Pre_uid118_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracRPath3PreRnd_uid122_fpArctan2Test(BITJOIN,121)@11
    expFracRPath3PreRnd_uid122_fpArctan2Test_q <= redist16_expRPath3PreRnd_uid121_fpArctan2Test_b_1_q & fracRPath3Pre_uid118_fpArctan2Test_q;

    -- fracRPath3PostRnd_uid125_fpArctan2Test(ADD,124)@11
    fracRPath3PostRnd_uid125_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expFracRPath3PreRnd_uid122_fpArctan2Test_q);
    fracRPath3PostRnd_uid125_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    fracRPath3PostRnd_uid125_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPath3PostRnd_uid125_fpArctan2Test_a) + UNSIGNED(fracRPath3PostRnd_uid125_fpArctan2Test_b));
    fracRPath3PostRnd_uid125_fpArctan2Test_q <= fracRPath3PostRnd_uid125_fpArctan2Test_o(16 downto 0);

    -- fracRPath3_uid126_fpArctan2Test_merged_bit_select(BITSELECT,486)@11
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_in <= fracRPath3PostRnd_uid125_fpArctan2Test_q(15 downto 0);
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_b <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_in(10 downto 1);
    fracRPath3_uid126_fpArctan2Test_merged_bit_select_c <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_in(15 downto 11);

    -- rightShiftStage1Idx3Rng3_uid448_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,447)@11
    rightShiftStage1Idx3Rng3_uid448_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q(11 downto 3);

    -- rightShiftStage1Idx3_uid450_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,449)@11
    rightShiftStage1Idx3_uid450_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx3Pad3_uid449_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage1Idx3Rng3_uid448_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage1Idx2Rng2_uid445_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,444)@11
    rightShiftStage1Idx2Rng2_uid445_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q(11 downto 2);

    -- rightShiftStage1Idx2_uid447_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,446)@11
    rightShiftStage1Idx2_uid447_fxpOp2Path2_uid134_fpArctan2Test_q <= padACst_uid167_fpArctan2Test_q & rightShiftStage1Idx2Rng2_uid445_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage1Idx1Rng1_uid442_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,441)@11
    rightShiftStage1Idx1Rng1_uid442_fxpOp2Path2_uid134_fpArctan2Test_b <= rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q(11 downto 1);

    -- rightShiftStage1Idx1_uid444_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,443)@11
    rightShiftStage1Idx1_uid444_fxpOp2Path2_uid134_fpArctan2Test_q <= GND_q & rightShiftStage1Idx1Rng1_uid442_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx2Rng8_uid436_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,435)@11
    rightShiftStage0Idx2Rng8_uid436_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(11 downto 8);

    -- rightShiftStage0Idx2_uid438_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,437)@11
    rightShiftStage0Idx2_uid438_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx2Pad8_uid437_fxpOp2Path2_uid134_fpArctan2Test_q & rightShiftStage0Idx2Rng8_uid436_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- rightShiftStage0Idx1Rng4_uid433_fxpOp2Path2_uid134_fpArctan2Test(BITSELECT,432)@11
    rightShiftStage0Idx1Rng4_uid433_fxpOp2Path2_uid134_fpArctan2Test_b <= oFracRPath2_uid132_fpArctan2Test_q(11 downto 4);

    -- rightShiftStage0Idx1_uid435_fxpOp2Path2_uid134_fpArctan2Test(BITJOIN,434)@11
    rightShiftStage0Idx1_uid435_fxpOp2Path2_uid134_fpArctan2Test_q <= leftShiftStage0Idx2Pad4_uid416_fxpU_uid107_fpArctan2Test_q & rightShiftStage0Idx1Rng4_uid433_fxpOp2Path2_uid134_fpArctan2Test_b;

    -- oFracRPath2_uid132_fpArctan2Test(BITJOIN,131)@11
    oFracRPath2_uid132_fpArctan2Test_q <= VCC_q & fracRPath3Pre_uid118_fpArctan2Test_q;

    -- rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test(MUX,440)@11
    rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_s <= rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b;
    rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_combproc: PROCESS (rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_s, oFracRPath2_uid132_fpArctan2Test_q, rightShiftStage0Idx1_uid435_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx2_uid438_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_s) IS
            WHEN "00" => rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q <= oFracRPath2_uid132_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx1_uid435_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx2_uid438_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0Idx3_uid439_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP2_uid58_fpArctan2Test(CONSTANT,57)
    cstWFP2_uid58_fpArctan2Test_q <= "01100";

    -- cstBiasMWF_uid55_fpArctan2Test(CONSTANT,54)
    cstBiasMWF_uid55_fpArctan2Test_q <= "00101";

    -- shiftOut_uid129_fpArctan2Test(COMPARE,128)@10
    shiftOut_uid129_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4_q);
    shiftOut_uid129_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid55_fpArctan2Test_q);
    shiftOut_uid129_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid129_fpArctan2Test_a) - UNSIGNED(shiftOut_uid129_fpArctan2Test_b));
    shiftOut_uid129_fpArctan2Test_c(0) <= shiftOut_uid129_fpArctan2Test_o(6);

    -- shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged(SUB,429)@10 + 1
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid53_fpArctan2Test_q);
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b <= STD_LOGIC_VECTOR("0" & expRPath3PreRnd_uid121_fpArctan2Test_b);
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i <= "0" & cstWFP2_uid58_fpArctan2Test_q;
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (shiftOut_uid129_fpArctan2Test_c = "1") THEN
                shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_i;
            ELSE
                shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_a) - UNSIGNED(shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_b));
            END IF;
        END IF;
    END PROCESS;
    shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_o(4 downto 0);

    -- sValPostSOutR_uid133_fpArctan2Test(BITSELECT,132)@11
    sValPostSOutR_uid133_fpArctan2Test_in <= shiftValPath2PreSub_uid128_fpArctan2Test_sValPostSOut_uid131_fpArctan2Test_merged_q(3 downto 0);
    sValPostSOutR_uid133_fpArctan2Test_b <= sValPostSOutR_uid133_fpArctan2Test_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select(BITSELECT,487)@11
    rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_b <= sValPostSOutR_uid133_fpArctan2Test_b(3 downto 2);
    rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c <= sValPostSOutR_uid133_fpArctan2Test_b(1 downto 0);

    -- rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test(MUX,451)@11
    rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_s <= rightShiftStageSel3Dto2_uid440_fxpOp2Path2_uid134_fpArctan2Test_merged_bit_select_c;
    rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_combproc: PROCESS (rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_s, rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage1Idx1_uid444_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage1Idx2_uid447_fxpOp2Path2_uid134_fpArctan2Test_q, rightShiftStage1Idx3_uid450_fxpOp2Path2_uid134_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_s) IS
            WHEN "00" => rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage0_uid441_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "01" => rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx1_uid444_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "10" => rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx2_uid447_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN "11" => rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q <= rightShiftStage1Idx3_uid450_fxpOp2Path2_uid134_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bPostPad_uid136_fpArctan2Test(BITJOIN,135)@11
    bPostPad_uid136_fpArctan2Test_q <= rightShiftStage1_uid452_fxpOp2Path2_uid134_fpArctan2Test_q & GND_q;

    -- path2Diff_uid137_fpArctan2Test(SUB,136)@11
    path2Diff_uid137_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & piO2_uid79_fpArctan2Test_q);
    path2Diff_uid137_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & bPostPad_uid136_fpArctan2Test_q);
    path2Diff_uid137_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid137_fpArctan2Test_a) - UNSIGNED(path2Diff_uid137_fpArctan2Test_b));
    path2Diff_uid137_fpArctan2Test_q <= path2Diff_uid137_fpArctan2Test_o(13 downto 0);

    -- normBitPath2Diff_uid138_fpArctan2Test(BITSELECT,137)@11
    normBitPath2Diff_uid138_fpArctan2Test_in <= STD_LOGIC_VECTOR(path2Diff_uid137_fpArctan2Test_q(12 downto 0));
    normBitPath2Diff_uid138_fpArctan2Test_b <= STD_LOGIC_VECTOR(normBitPath2Diff_uid138_fpArctan2Test_in(12 downto 12));

    -- expRPath2_uid142_fpArctan2Test(MUX,141)@11
    expRPath2_uid142_fpArctan2Test_s <= normBitPath2Diff_uid138_fpArctan2Test_b;
    expRPath2_uid142_fpArctan2Test_combproc: PROCESS (expRPath2_uid142_fpArctan2Test_s, cstBiasM1_uid54_fpArctan2Test_q, cstBias_uid53_fpArctan2Test_q)
    BEGIN
        CASE (expRPath2_uid142_fpArctan2Test_s) IS
            WHEN "0" => expRPath2_uid142_fpArctan2Test_q <= cstBiasM1_uid54_fpArctan2Test_q;
            WHEN "1" => expRPath2_uid142_fpArctan2Test_q <= cstBias_uid53_fpArctan2Test_q;
            WHEN OTHERS => expRPath2_uid142_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path2DiffHigh_uid139_fpArctan2Test(BITSELECT,138)@11
    path2DiffHigh_uid139_fpArctan2Test_in <= path2Diff_uid137_fpArctan2Test_q(11 downto 0);
    path2DiffHigh_uid139_fpArctan2Test_b <= path2DiffHigh_uid139_fpArctan2Test_in(11 downto 1);

    -- path2DiffLow_uid140_fpArctan2Test(BITSELECT,139)@11
    path2DiffLow_uid140_fpArctan2Test_in <= path2Diff_uid137_fpArctan2Test_q(10 downto 0);
    path2DiffLow_uid140_fpArctan2Test_b <= path2DiffLow_uid140_fpArctan2Test_in(10 downto 0);

    -- fracRPath2_uid141_fpArctan2Test(MUX,140)@11
    fracRPath2_uid141_fpArctan2Test_s <= normBitPath2Diff_uid138_fpArctan2Test_b;
    fracRPath2_uid141_fpArctan2Test_combproc: PROCESS (fracRPath2_uid141_fpArctan2Test_s, path2DiffLow_uid140_fpArctan2Test_b, path2DiffHigh_uid139_fpArctan2Test_b)
    BEGIN
        CASE (fracRPath2_uid141_fpArctan2Test_s) IS
            WHEN "0" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffLow_uid140_fpArctan2Test_b;
            WHEN "1" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffHigh_uid139_fpArctan2Test_b;
            WHEN OTHERS => fracRPath2_uid141_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracConc_uid145_fpArctan2Test(BITJOIN,144)@11
    expFracConc_uid145_fpArctan2Test_q <= expRPath2_uid142_fpArctan2Test_q & fracRPath2_uid141_fpArctan2Test_q;

    -- expFracRPath2PostRnd_uid146_fpArctan2Test(ADD,145)@11
    expFracRPath2PostRnd_uid146_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid145_fpArctan2Test_q);
    expFracRPath2PostRnd_uid146_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    expFracRPath2PostRnd_uid146_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid146_fpArctan2Test_a) + UNSIGNED(expFracRPath2PostRnd_uid146_fpArctan2Test_b));
    expFracRPath2PostRnd_uid146_fpArctan2Test_q <= expFracRPath2PostRnd_uid146_fpArctan2Test_o(16 downto 0);

    -- fracRPath2_uid147_fpArctan2Test_merged_bit_select(BITSELECT,488)@11
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_in <= expFracRPath2PostRnd_uid146_fpArctan2Test_q(15 downto 0);
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_b <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_in(10 downto 1);
    fracRPath2_uid147_fpArctan2Test_merged_bit_select_c <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_in(15 downto 11);

    -- redist24_fracX_uid47_fpArctan2Test_b_6_inputreg(DELAY,533)
    redist24_fracX_uid47_fpArctan2Test_b_6_inputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist23_fracX_uid47_fpArctan2Test_b_1_q, xout => redist24_fracX_uid47_fpArctan2Test_b_6_inputreg_q, clk => clk, aclr => areset );

    -- redist24_fracX_uid47_fpArctan2Test_b_6(DELAY,516)
    redist24_fracX_uid47_fpArctan2Test_b_6 : dspba_delay
    GENERIC MAP ( width => 10, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist24_fracX_uid47_fpArctan2Test_b_6_inputreg_q, xout => redist24_fracX_uid47_fpArctan2Test_b_6_q, clk => clk, aclr => areset );

    -- redist24_fracX_uid47_fpArctan2Test_b_6_outputreg(DELAY,534)
    redist24_fracX_uid47_fpArctan2Test_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist24_fracX_uid47_fpArctan2Test_b_6_q, xout => redist24_fracX_uid47_fpArctan2Test_b_6_outputreg_q, clk => clk, aclr => areset );

    -- redist25_fracX_uid47_fpArctan2Test_b_7(DELAY,517)
    redist25_fracX_uid47_fpArctan2Test_b_7 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist24_fracX_uid47_fpArctan2Test_b_6_outputreg_q, xout => redist25_fracX_uid47_fpArctan2Test_b_7_q, clk => clk, aclr => areset );

    -- xyInInf_uid88_fpArctan2Test(LOGICAL,87)@4 + 1
    xyInInf_uid88_fpArctan2Test_qi <= excI_xIn_uid15_fpArctan2Test_q and excI_yIn_uid29_fpArctan2Test_q;
    xyInInf_uid88_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid88_fpArctan2Test_qi, xout => xyInInf_uid88_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist19_xyInInf_uid88_fpArctan2Test_q_6(DELAY,511)
    redist19_xyInInf_uid88_fpArctan2Test_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid88_fpArctan2Test_q, xout => redist19_xyInInf_uid88_fpArctan2Test_q_6_q, clk => clk, aclr => areset );

    -- redist27_expX_uid46_fpArctan2Test_b_5(DELAY,519)
    redist27_expX_uid46_fpArctan2Test_b_5 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist26_expX_uid46_fpArctan2Test_b_1_q, xout => redist27_expX_uid46_fpArctan2Test_b_5_q, clk => clk, aclr => areset );

    -- expXIsBias_uid77_fpArctan2Test(LOGICAL,76)@10
    expXIsBias_uid77_fpArctan2Test_q <= "1" WHEN redist27_expX_uid46_fpArctan2Test_b_5_q = cstBias_uid53_fpArctan2Test_q ELSE "0";

    -- updatedY_uid75_fpArctan2Test(BITJOIN,74)@10
    updatedY_uid75_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q & cstZeroWF_uid7_fpArctan2Test_q;

    -- fracXIsZero_uid74_fpArctan2Test(LOGICAL,75)@10
    fracXIsZero_uid74_fpArctan2Test_a <= STD_LOGIC_VECTOR("0000000000" & redist24_fracX_uid47_fpArctan2Test_b_6_outputreg_q);
    fracXIsZero_uid74_fpArctan2Test_q <= "1" WHEN fracXIsZero_uid74_fpArctan2Test_a = updatedY_uid75_fpArctan2Test_q ELSE "0";

    -- inIsOne_uid78_fpArctan2Test(LOGICAL,77)@10
    inIsOne_uid78_fpArctan2Test_q <= fracXIsZero_uid74_fpArctan2Test_q and expXIsBias_uid77_fpArctan2Test_q;

    -- arctanIsConst_uid89_fpArctan2Test(LOGICAL,88)@10
    arctanIsConst_uid89_fpArctan2Test_q <= redist20_excI_div_uid69_fpArctan2Test_q_4_q or inIsOne_uid78_fpArctan2Test_q or redist19_xyInInf_uid88_fpArctan2Test_q_6_q;

    -- biasMwShift_uid96_fpArctan2Test(CONSTANT,95)
    biasMwShift_uid96_fpArctan2Test_q <= "01001";

    -- atanUIsU_uid97_fpArctan2Test(COMPARE,96)@10
    atanUIsU_uid97_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid96_fpArctan2Test_q);
    atanUIsU_uid97_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & redist3_expU_uid93_fpArctan2Test_merged_bit_select_b_4_q);
    atanUIsU_uid97_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid97_fpArctan2Test_a) - UNSIGNED(atanUIsU_uid97_fpArctan2Test_b));
    atanUIsU_uid97_fpArctan2Test_n(0) <= not (atanUIsU_uid97_fpArctan2Test_o(6));

    -- redist18_path2_uid90_fpArctan2Test_n_4(DELAY,510)
    redist18_path2_uid90_fpArctan2Test_n_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => path2_uid90_fpArctan2Test_n, xout => redist18_path2_uid90_fpArctan2Test_n_4_q, clk => clk, aclr => areset );

    -- pathSelBits_uid149_fpArctan2Test(BITJOIN,148)@10
    pathSelBits_uid149_fpArctan2Test_q <= arctanIsConst_uid89_fpArctan2Test_q & atanUIsU_uid97_fpArctan2Test_n & redist18_path2_uid90_fpArctan2Test_n_4_q;

    -- fracOutMuxSelEnc_uid150_fpArctan2Test(LOOKUP,149)@10 + 1
    fracOutMuxSelEnc_uid150_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (pathSelBits_uid149_fpArctan2Test_q) IS
                WHEN "000" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "10";
                WHEN "001" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "01";
                WHEN "010" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "00";
                WHEN "011" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "01";
                WHEN "100" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "101" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "110" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN "111" => fracOutMuxSelEnc_uid150_fpArctan2Test_q <= "11";
                WHEN OTHERS => -- unreachable
                               fracOutMuxSelEnc_uid150_fpArctan2Test_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRCalc_uid152_fpArctan2Test(MUX,151)@11 + 1
    fracRCalc_uid152_fpArctan2Test_s <= fracOutMuxSelEnc_uid150_fpArctan2Test_q;
    fracRCalc_uid152_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid152_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRCalc_uid152_fpArctan2Test_s) IS
                WHEN "00" => fracRCalc_uid152_fpArctan2Test_q <= redist25_fracX_uid47_fpArctan2Test_b_7_q;
                WHEN "01" => fracRCalc_uid152_fpArctan2Test_q <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_b;
                WHEN "10" => fracRCalc_uid152_fpArctan2Test_q <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_b;
                WHEN "11" => fracRCalc_uid152_fpArctan2Test_q <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_b;
                WHEN OTHERS => fracRCalc_uid152_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist15_fracRCalc_uid152_fpArctan2Test_q_2(DELAY,507)
    redist15_fracRCalc_uid152_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRCalc_uid152_fpArctan2Test_q, xout => redist15_fracRCalc_uid152_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- oFracRCalc_uid162_fpArctan2Test(BITJOIN,161)@13
    oFracRCalc_uid162_fpArctan2Test_q <= VCC_q & redist15_fracRCalc_uid152_fpArctan2Test_q_2_q;

    -- padConst_uid163_fpArctan2Test(CONSTANT,162)
    padConst_uid163_fpArctan2Test_q <= "00000000000";

    -- rightPaddedIn_uid164_fpArctan2Test(BITJOIN,163)@13
    rightPaddedIn_uid164_fpArctan2Test_q <= oFracRCalc_uid162_fpArctan2Test_q & padConst_uid163_fpArctan2Test_q;

    -- rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test(MUX,466)@13
    rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_s <= rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b;
    rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_combproc: PROCESS (rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_s, rightPaddedIn_uid164_fpArctan2Test_q, rightShiftStage0Idx1_uid459_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx2_uid462_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage0Idx3_uid465_fxpAlignedRes_uid163_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_s) IS
            WHEN "00" => rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q <= rightPaddedIn_uid164_fpArctan2Test_q;
            WHEN "01" => rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx1_uid459_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "10" => rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx2_uid462_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "11" => rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0Idx3_uid465_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP1_uid57_fpArctan2Test(CONSTANT,56)
    cstWFP1_uid57_fpArctan2Test_q <= "01011";

    -- zwEwF_uid36_fpArctan2Test(CONSTANT,35)
    zwEwF_uid36_fpArctan2Test_q <= "000000000000000";

    -- yInExpFrac_uid39_fpArctan2Test(BITJOIN,38)@2
    yInExpFrac_uid39_fpArctan2Test_q <= exp_yIn_uid23_fpArctan2Test_b & frac_yIn_uid24_fpArctan2Test_b;

    -- yInZero_uid40_fpArctan2Test(LOGICAL,39)@2 + 1
    yInZero_uid40_fpArctan2Test_qi <= "1" WHEN yInExpFrac_uid39_fpArctan2Test_q = zwEwF_uid36_fpArctan2Test_q ELSE "0";
    yInZero_uid40_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid40_fpArctan2Test_qi, xout => yInZero_uid40_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist30_yInZero_uid40_fpArctan2Test_q_4(DELAY,522)
    redist30_yInZero_uid40_fpArctan2Test_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid40_fpArctan2Test_q, xout => redist30_yInZero_uid40_fpArctan2Test_q_4_q, clk => clk, aclr => areset );

    -- redist31_yInZero_uid40_fpArctan2Test_q_10(DELAY,523)
    redist31_yInZero_uid40_fpArctan2Test_q_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_yInZero_uid40_fpArctan2Test_q_4_q, xout => redist31_yInZero_uid40_fpArctan2Test_q_10_q, clk => clk, aclr => areset );

    -- sOutAlignRes_uid157_fpArctan2Test(COMPARE,156)@12
    sOutAlignRes_uid157_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & expRCalc_uid154_fpArctan2Test_q);
    sOutAlignRes_uid157_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid55_fpArctan2Test_q);
    sOutAlignRes_uid157_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(sOutAlignRes_uid157_fpArctan2Test_a) - UNSIGNED(sOutAlignRes_uid157_fpArctan2Test_b));
    sOutAlignRes_uid157_fpArctan2Test_c(0) <= sOutAlignRes_uid157_fpArctan2Test_o(6);

    -- yInZOrsOutAlignRes_uid158_fpArctan2Test(LOGICAL,157)@12
    yInZOrsOutAlignRes_uid158_fpArctan2Test_q <= sOutAlignRes_uid157_fpArctan2Test_c or redist31_yInZero_uid40_fpArctan2Test_q_10_q;

    -- redist28_expX_uid46_fpArctan2Test_b_6(DELAY,520)
    redist28_expX_uid46_fpArctan2Test_b_6 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist27_expX_uid46_fpArctan2Test_b_5_q, xout => redist28_expX_uid46_fpArctan2Test_b_6_q, clk => clk, aclr => areset );

    -- expRCalc_uid154_fpArctan2Test(MUX,153)@11 + 1
    expRCalc_uid154_fpArctan2Test_s <= fracOutMuxSelEnc_uid150_fpArctan2Test_q;
    expRCalc_uid154_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid154_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRCalc_uid154_fpArctan2Test_s) IS
                WHEN "00" => expRCalc_uid154_fpArctan2Test_q <= redist28_expX_uid46_fpArctan2Test_b_6_q;
                WHEN "01" => expRCalc_uid154_fpArctan2Test_q <= fracRPath2_uid147_fpArctan2Test_merged_bit_select_c;
                WHEN "10" => expRCalc_uid154_fpArctan2Test_q <= fracRPath3_uid126_fpArctan2Test_merged_bit_select_c;
                WHEN "11" => expRCalc_uid154_fpArctan2Test_q <= fracOutCst_uid151_fpArctan2Test_merged_bit_select_c;
                WHEN OTHERS => expRCalc_uid154_fpArctan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged(SUB,453)@12 + 1
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid53_fpArctan2Test_q);
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b <= STD_LOGIC_VECTOR("0" & expRCalc_uid154_fpArctan2Test_q);
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i <= "0" & cstWFP1_uid57_fpArctan2Test_q;
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yInZOrsOutAlignRes_uid158_fpArctan2Test_q = "1") THEN
                sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_i;
            ELSE
                sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_a) - UNSIGNED(sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_b));
            END IF;
        END IF;
    END PROCESS;
    sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_o(4 downto 0);

    -- sValPostSOutRange_uid161_fpArctan2Test(BITSELECT,160)@13
    sValPostSOutRange_uid161_fpArctan2Test_in <= sValAlignRes_uid156_fpArctan2Test_sValPostSAlignOut_uid160_fpArctan2Test_merged_q(3 downto 0);
    sValPostSOutRange_uid161_fpArctan2Test_b <= sValPostSOutRange_uid161_fpArctan2Test_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select(BITSELECT,489)@13
    rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_b <= sValPostSOutRange_uid161_fpArctan2Test_b(3 downto 2);
    rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c <= sValPostSOutRange_uid161_fpArctan2Test_b(1 downto 0);

    -- rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test(MUX,477)@13
    rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_s <= rightShiftStageSel3Dto2_uid466_fxpAlignedRes_uid163_fpArctan2Test_merged_bit_select_c;
    rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_combproc: PROCESS (rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_s, rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage1Idx1_uid470_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage1Idx2_uid473_fxpAlignedRes_uid163_fpArctan2Test_q, rightShiftStage1Idx3_uid476_fxpAlignedRes_uid163_fpArctan2Test_q)
    BEGIN
        CASE (rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_s) IS
            WHEN "00" => rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage0_uid467_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "01" => rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx1_uid470_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "10" => rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx2_uid473_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN "11" => rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q <= rightShiftStage1Idx3_uid476_fxpAlignedRes_uid163_fpArctan2Test_q;
            WHEN OTHERS => rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstPi_uid155_fpArctan2Test(CONSTANT,154)
    cstPi_uid155_fpArctan2Test_q <= "110010010000111111011";

    -- aPostPad_uid168_fpArctan2Test(BITJOIN,167)@13
    aPostPad_uid168_fpArctan2Test_q <= cstPi_uid155_fpArctan2Test_q & padACst_uid167_fpArctan2Test_q;

    -- subRes_uid169_fpArctan2Test(SUB,168)@13
    subRes_uid169_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid168_fpArctan2Test_q);
    subRes_uid169_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & rightShiftStage1_uid478_fxpAlignedRes_uid163_fpArctan2Test_q);
    subRes_uid169_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(subRes_uid169_fpArctan2Test_a) - UNSIGNED(subRes_uid169_fpArctan2Test_b));
    subRes_uid169_fpArctan2Test_q <= subRes_uid169_fpArctan2Test_o(23 downto 0);

    -- subResNormBit_uid170_fpArctan2Test(BITSELECT,169)@13
    subResNormBit_uid170_fpArctan2Test_in <= STD_LOGIC_VECTOR(subRes_uid169_fpArctan2Test_q(22 downto 0));
    subResNormBit_uid170_fpArctan2Test_b <= STD_LOGIC_VECTOR(subResNormBit_uid170_fpArctan2Test_in(22 downto 22));

    -- expRSub_uid174_fpArctan2Test(MUX,173)@13
    expRSub_uid174_fpArctan2Test_s <= subResNormBit_uid170_fpArctan2Test_b;
    expRSub_uid174_fpArctan2Test_combproc: PROCESS (expRSub_uid174_fpArctan2Test_s, cstBias_uid53_fpArctan2Test_q, cstBiasP1_uid56_fpArctan2Test_q)
    BEGIN
        CASE (expRSub_uid174_fpArctan2Test_s) IS
            WHEN "0" => expRSub_uid174_fpArctan2Test_q <= cstBias_uid53_fpArctan2Test_q;
            WHEN "1" => expRSub_uid174_fpArctan2Test_q <= cstBiasP1_uid56_fpArctan2Test_q;
            WHEN OTHERS => expRSub_uid174_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist14_expRCalc_uid154_fpArctan2Test_q_2(DELAY,506)
    redist14_expRCalc_uid154_fpArctan2Test_q_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRCalc_uid154_fpArctan2Test_q, xout => redist14_expRCalc_uid154_fpArctan2Test_q_2_q, clk => clk, aclr => areset );

    -- xInExpFrac_uid43_fpArctan2Test(BITJOIN,42)@3
    xInExpFrac_uid43_fpArctan2Test_q <= redist39_exp_xIn_uid9_fpArctan2Test_b_3_q & redist38_frac_xIn_uid10_fpArctan2Test_b_3_q;

    -- xInZero_uid44_fpArctan2Test(LOGICAL,43)@3 + 1
    xInZero_uid44_fpArctan2Test_qi <= "1" WHEN xInExpFrac_uid43_fpArctan2Test_q = zwEwF_uid36_fpArctan2Test_q ELSE "0";
    xInZero_uid44_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid44_fpArctan2Test_qi, xout => xInZero_uid44_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist29_xInZero_uid44_fpArctan2Test_q_3(DELAY,521)
    redist29_xInZero_uid44_fpArctan2Test_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid44_fpArctan2Test_q, xout => redist29_xInZero_uid44_fpArctan2Test_q_3_q, clk => clk, aclr => areset );

    -- redist33_xInSign_uid35_fpArctan2Test_b_6(DELAY,525)
    redist33_xInSign_uid35_fpArctan2Test_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_xInSign_uid35_fpArctan2Test_b_4_q, xout => redist33_xInSign_uid35_fpArctan2Test_b_6_q, clk => clk, aclr => areset );

    -- xInIsLTEZero_uid175_fpArctan2Test(LOGICAL,174)@6 + 1
    xInIsLTEZero_uid175_fpArctan2Test_qi <= redist33_xInSign_uid35_fpArctan2Test_b_6_q or redist29_xInZero_uid44_fpArctan2Test_q_3_q;
    xInIsLTEZero_uid175_fpArctan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid175_fpArctan2Test_qi, xout => xInIsLTEZero_uid175_fpArctan2Test_q, clk => clk, aclr => areset );

    -- redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7(DELAY,505)
    redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid175_fpArctan2Test_q, xout => redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7_q, clk => clk, aclr => areset );

    -- expRFinal_uid177_fpArctan2Test(MUX,176)@13
    expRFinal_uid177_fpArctan2Test_s <= redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7_q;
    expRFinal_uid177_fpArctan2Test_combproc: PROCESS (expRFinal_uid177_fpArctan2Test_s, redist14_expRCalc_uid154_fpArctan2Test_q_2_q, expRSub_uid174_fpArctan2Test_q)
    BEGIN
        CASE (expRFinal_uid177_fpArctan2Test_s) IS
            WHEN "0" => expRFinal_uid177_fpArctan2Test_q <= redist14_expRCalc_uid154_fpArctan2Test_q_2_q;
            WHEN "1" => expRFinal_uid177_fpArctan2Test_q <= expRSub_uid174_fpArctan2Test_q;
            WHEN OTHERS => expRFinal_uid177_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid52_fpArctan2Test(CONSTANT,51)
    cstAllZWE_uid52_fpArctan2Test_q <= "00000";

    -- invXInSign_uid179_fpArctan2Test(LOGICAL,178)@6
    invXInSign_uid179_fpArctan2Test_q <= not (redist33_xInSign_uid35_fpArctan2Test_b_6_q);

    -- excRZero2_uid180_fpArctan2Test(LOGICAL,179)@6
    excRZero2_uid180_fpArctan2Test_q <= redist29_xInZero_uid44_fpArctan2Test_q_3_q and redist30_yInZero_uid40_fpArctan2Test_q_4_q and invXInSign_uid179_fpArctan2Test_q;

    -- invYInSign_uid178_fpArctan2Test(LOGICAL,177)@6
    invYInSign_uid178_fpArctan2Test_q <= not (redist35_yInSign_uid34_fpArctan2Test_b_4_q);

    -- excRZero1_uid181_fpArctan2Test(LOGICAL,180)@6
    excRZero1_uid181_fpArctan2Test_q <= excZ_div_uid450_uid65_fpArctan2Test_q and invYInSign_uid178_fpArctan2Test_q and invXInSign_uid179_fpArctan2Test_q;

    -- excRZero_uid182_fpArctan2Test(LOGICAL,181)@6
    excRZero_uid182_fpArctan2Test_q <= excRZero1_uid181_fpArctan2Test_q or excRZero2_uid180_fpArctan2Test_q;

    -- excSelBits_uid184_fpArctan2Test(BITJOIN,183)@6
    excSelBits_uid184_fpArctan2Test_q <= redist12_excRNaN_uid183_fpArctan2Test_q_2_q & GND_q & excRZero_uid182_fpArctan2Test_q;

    -- outMuxSelEnc_uid185_fpArctan2Test(LOOKUP,184)@6 + 1
    outMuxSelEnc_uid185_fpArctan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excSelBits_uid184_fpArctan2Test_q) IS
                WHEN "000" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
                WHEN "001" => outMuxSelEnc_uid185_fpArctan2Test_q <= "00";
                WHEN "010" => outMuxSelEnc_uid185_fpArctan2Test_q <= "10";
                WHEN "011" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
                WHEN "100" => outMuxSelEnc_uid185_fpArctan2Test_q <= "11";
                WHEN "101" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
                WHEN "110" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
                WHEN "111" => outMuxSelEnc_uid185_fpArctan2Test_q <= "01";
                WHEN OTHERS => -- unreachable
                               outMuxSelEnc_uid185_fpArctan2Test_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7(DELAY,503)
    redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7 : dspba_delay
    GENERIC MAP ( width => 2, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => outMuxSelEnc_uid185_fpArctan2Test_q, xout => redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7_q, clk => clk, aclr => areset );

    -- expRPostExc_uid188_fpArctan2Test(MUX,187)@13
    expRPostExc_uid188_fpArctan2Test_s <= redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7_q;
    expRPostExc_uid188_fpArctan2Test_combproc: PROCESS (expRPostExc_uid188_fpArctan2Test_s, cstAllZWE_uid52_fpArctan2Test_q, expRFinal_uid177_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
        CASE (expRPostExc_uid188_fpArctan2Test_s) IS
            WHEN "00" => expRPostExc_uid188_fpArctan2Test_q <= cstAllZWE_uid52_fpArctan2Test_q;
            WHEN "01" => expRPostExc_uid188_fpArctan2Test_q <= expRFinal_uid177_fpArctan2Test_q;
            WHEN "10" => expRPostExc_uid188_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN "11" => expRPostExc_uid188_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
            WHEN OTHERS => expRPostExc_uid188_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- subResHigh_uid171_fpArctan2Test(BITSELECT,170)@13
    subResHigh_uid171_fpArctan2Test_in <= subRes_uid169_fpArctan2Test_q(21 downto 0);
    subResHigh_uid171_fpArctan2Test_b <= subResHigh_uid171_fpArctan2Test_in(21 downto 12);

    -- subResLow_uid172_fpArctan2Test(BITSELECT,171)@13
    subResLow_uid172_fpArctan2Test_in <= subRes_uid169_fpArctan2Test_q(20 downto 0);
    subResLow_uid172_fpArctan2Test_b <= subResLow_uid172_fpArctan2Test_in(20 downto 11);

    -- fracRSub_uid173_fpArctan2Test(MUX,172)@13
    fracRSub_uid173_fpArctan2Test_s <= subResNormBit_uid170_fpArctan2Test_b;
    fracRSub_uid173_fpArctan2Test_combproc: PROCESS (fracRSub_uid173_fpArctan2Test_s, subResLow_uid172_fpArctan2Test_b, subResHigh_uid171_fpArctan2Test_b)
    BEGIN
        CASE (fracRSub_uid173_fpArctan2Test_s) IS
            WHEN "0" => fracRSub_uid173_fpArctan2Test_q <= subResLow_uid172_fpArctan2Test_b;
            WHEN "1" => fracRSub_uid173_fpArctan2Test_q <= subResHigh_uid171_fpArctan2Test_b;
            WHEN OTHERS => fracRSub_uid173_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRFinal_uid176_fpArctan2Test(MUX,175)@13
    fracRFinal_uid176_fpArctan2Test_s <= redist13_xInIsLTEZero_uid175_fpArctan2Test_q_7_q;
    fracRFinal_uid176_fpArctan2Test_combproc: PROCESS (fracRFinal_uid176_fpArctan2Test_s, redist15_fracRCalc_uid152_fpArctan2Test_q_2_q, fracRSub_uid173_fpArctan2Test_q)
    BEGIN
        CASE (fracRFinal_uid176_fpArctan2Test_s) IS
            WHEN "0" => fracRFinal_uid176_fpArctan2Test_q <= redist15_fracRCalc_uid152_fpArctan2Test_q_2_q;
            WHEN "1" => fracRFinal_uid176_fpArctan2Test_q <= fracRSub_uid173_fpArctan2Test_q;
            WHEN OTHERS => fracRFinal_uid176_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid187_fpArctan2Test(MUX,186)@13
    fracRPostExc_uid187_fpArctan2Test_s <= redist11_outMuxSelEnc_uid185_fpArctan2Test_q_7_q;
    fracRPostExc_uid187_fpArctan2Test_combproc: PROCESS (fracRPostExc_uid187_fpArctan2Test_s, cstZeroWF_uid7_fpArctan2Test_q, fracRFinal_uid176_fpArctan2Test_q, cstNaNWF_uid51_fpArctan2Test_q)
    BEGIN
        CASE (fracRPostExc_uid187_fpArctan2Test_s) IS
            WHEN "00" => fracRPostExc_uid187_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "01" => fracRPostExc_uid187_fpArctan2Test_q <= fracRFinal_uid176_fpArctan2Test_q;
            WHEN "10" => fracRPostExc_uid187_fpArctan2Test_q <= cstZeroWF_uid7_fpArctan2Test_q;
            WHEN "11" => fracRPostExc_uid187_fpArctan2Test_q <= cstNaNWF_uid51_fpArctan2Test_q;
            WHEN OTHERS => fracRPostExc_uid187_fpArctan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid191_fpArctan2Test(BITJOIN,190)@13
    R_uid191_fpArctan2Test_q <= redist10_signR_uid190_fpArctan2Test_q_7_q & expRPostExc_uid188_fpArctan2Test_q & fracRPostExc_uid187_fpArctan2Test_q;

    -- xOut(GPOUT,4)@13
    q <= R_uid191_fpArctan2Test_q;

END normal;
