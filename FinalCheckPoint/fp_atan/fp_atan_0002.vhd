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

-- VHDL created from fp_atan_0002
-- VHDL created on Mon Nov 28 22:22:45 2022


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

entity fp_atan_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fp_atan_0002;

architecture normal of fp_atan_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpArctanXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracX_uid7_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal signX_uid8_fpArctanXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstAllZWF_uid10_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstNaNWF_uid11_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid12_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBias_uid13_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasM1_uid14_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasMWF_uid15_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstWFP2_uid16_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excZ_x_uid23_fpArctanXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid23_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpArctanXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpArctanXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid33_fpArctanXTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal fracXIsZero_uid32_fpArctanXTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal fracXIsZero_uid32_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsBias_uid35_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsOne_uid36_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal piO2_uid37_fpArctanXTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal piO4_uid38_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstPiO2_uid39_fpArctanXTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal cstPiO2_uid39_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fpPiO2C_uid40_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstPiO4_uid42_fpArctanXTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal cstPiO4_uid42_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fpPiO4C_uid43_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal constOut_uid45_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal constOut_uid45_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal arctanIsConst_uid46_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal path2_uid47_fpArctanXTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid47_fpArctanXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid47_fpArctanXTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal path2_uid47_fpArctanXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid49_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid49_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal oFracU_uid52_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal biasMwShift_uid53_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal atanUIsU_uid54_fpArctanXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftBias_uid55_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftValue_uid56_fpArctanXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid56_fpArctanXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid56_fpArctanXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValue_uid56_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal xMSB_uid57_fpArctanXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zS_uid59_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePostNeg_uid60_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePostNeg_uid60_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cst01pWShift_uid61_fpArctanXTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracUExt_uid62_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal fxpShifterBits_uid63_fpArctanXTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal fxpShifterBits_uid63_fpArctanXTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y_uid65_fpArctanXTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal y_uid65_fpArctanXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpAtanXOXRes_uid70_fpArctanXTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal fxpAtanXOXRes_uid70_fpArctanXTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal normBit_uid72_fpArctanXTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal normBit_uid72_fpArctanXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3High_uid73_fpArctanXTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPath3High_uid73_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath3Low_uid74_fpArctanXTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal fracRPath3Low_uid74_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath3Pre_uid75_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3Pre_uid75_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invNormBit_uid76_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath3Ext_uid77_fpArctanXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid77_fpArctanXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid77_fpArctanXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRPath3Ext_uid77_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracPreRnd_uid79_fpArctanXTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal expfracRPath3PostRnd_uid80_fpArctanXTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal expfracRPath3PostRnd_uid80_fpArctanXTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal expfracRPath3PostRnd_uid80_fpArctanXTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal expfracRPath3PostRnd_uid80_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal shiftOut_uid84_fpArctanXTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid84_fpArctanXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid84_fpArctanXTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftOut_uid84_fpArctanXTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracRPath2_uid87_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sValPostSOutR_uid88_fpArctanXTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal sValPostSOutR_uid88_fpArctanXTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bPostPad_uid91_fpArctanXTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal path2Diff_uid92_fpArctanXTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid92_fpArctanXTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid92_fpArctanXTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal path2Diff_uid92_fpArctanXTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal normBitPath2Diff_uid93_fpArctanXTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal normBitPath2Diff_uid93_fpArctanXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path2DiffHigh_uid94_fpArctanXTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal path2DiffHigh_uid94_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal path2DiffLow_uid95_fpArctanXTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal path2DiffLow_uid95_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPath2_uid96_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath2_uid96_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPath2_uid97_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath2_uid97_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracConc_uid100_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal expFracRPath2PostRnd_uid101_fpArctanXTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid101_fpArctanXTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid101_fpArctanXTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expFracRPath2PostRnd_uid101_fpArctanXTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal pathSelBits_uid104_fpArctanXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracOutMuxSelEnc_uid105_fpArctanXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid107_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid107_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCalc_uid109_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRCalc_uid109_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excSelBits_uid110_fpArctanXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid111_fpArctanXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid113_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid113_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid114_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid114_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid115_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid116_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid117_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cst2BiasM1_uid126_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cst2Bias_uid127_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExpXIsMax_uid140_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid141_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid142_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid143_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal updatedY_uid145_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid144_z_uid48_fpArctanXTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid144_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid147_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal y_uid147_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCompExt_uid152_z_uid48_fpArctanXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid152_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid152_z_uid48_fpArctanXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompExt_uid152_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expRComp_uid153_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRComp_uid153_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal udf_uid154_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid154_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expRCompYIsOne_uid156_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRCompYIsOne_uid156_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fxpInverseRes_uid157_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fxpInverseRes_uid157_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRCalc_uid160_z_uid48_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid160_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCalc_uid161_z_uid48_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid161_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xRegAndUdf_uid162_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid163_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid164_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid167_z_uid48_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid167_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid168_z_uid48_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid168_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal R_uid171_z_uid48_fpArctanXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC0_uid173_arctanXTables_q : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid176_arctanXTables_q : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid183_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid183_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid184_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal s1sumAHighB_uid185_invPolyEval_a : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid185_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid185_invPolyEval_o : STD_LOGIC_VECTOR (18 downto 0);
    signal s1sumAHighB_uid185_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal s1_uid186_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC0_uid188_inverseTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid189_inverseTables_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid190_inverseTables_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC1_uid192_inverseTables_q : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid199_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid199_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid200_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_a : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_o : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal s1_uid202_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal prodXY_uid204_pT1_uid182_invPolyEval_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid204_pT1_uid182_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal prodXY_uid204_pT1_uid182_invPolyEval_s1 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid204_pT1_uid182_invPolyEval_pr : SIGNED (15 downto 0);
    signal prodXY_uid204_pT1_uid182_invPolyEval_q : STD_LOGIC_VECTOR (14 downto 0);
    signal osig_uid205_pT1_uid182_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal prodXY_uid207_pT1_uid198_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal prodXY_uid207_pT1_uid198_invPolyEval_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal prodXY_uid207_pT1_uid198_invPolyEval_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid207_pT1_uid198_invPolyEval_pr : SIGNED (13 downto 0);
    signal prodXY_uid207_pT1_uid198_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid208_pT1_uid198_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1Pad2_uid212_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid214_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0Idx2Pad4_uid215_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx2_uid217_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3_uid220_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal leftShiftStage1Idx1_uid225_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_i : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx1Rng4_uid232_fxpOp2Path2_uid89_fpArctanXTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1_uid234_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx2Rng8_uid235_fxpOp2Path2_uid89_fpArctanXTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx2Pad8_uid236_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2_uid237_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx3_uid238_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx1Rng1_uid241_fxpOp2Path2_uid89_fpArctanXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1_uid243_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx2Rng2_uid244_fxpOp2Path2_uid89_fpArctanXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx2_uid246_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng3_uid247_fxpOp2Path2_uid89_fpArctanXTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx3Pad3_uid248_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3_uid249_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_reset : std_logic;
    type mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(10 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0 : mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0 : signal is true;
    type mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0 : mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0 : signal is true;
    type mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_p : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_u : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_w : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_x : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_y : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_s : mulXAtanXOXRes_uid71_fpArctanXTest_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena1 : std_logic;
    signal fracOutCst_uid106_fpArctanXTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracOutCst_uid106_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracOutCst_uid106_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal expU_uid50_fpArctanXTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal expU_uid50_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expU_uid50_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yAddr_uid67_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal yAddr_uid67_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPath3_uid81_fpArctanXTest_merged_bit_select_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPath3_uid81_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPath3_uid81_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPath2_uid102_fpArctanXTest_merged_bit_select_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPath2_uid102_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPath2_uid102_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist3_signR_uid116_fpArctanXTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_expRPath3Ext_uid77_fpArctanXTest_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_oFracU_uid52_fpArctanXTest_q_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist7_path2_uid47_fpArctanXTest_n_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_excI_x_uid27_fpArctanXTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excI_x_uid27_fpArctanXTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_signX_uid8_fpArctanXTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracX_uid7_fpArctanXTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist12_fracX_uid7_fpArctanXTest_b_2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist13_fracX_uid7_fpArctanXTest_b_6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist14_fracX_uid7_fpArctanXTest_b_7_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist15_expX_uid6_fpArctanXTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_expX_uid6_fpArctanXTest_b_5_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist17_expX_uid6_fpArctanXTest_b_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist18_xIn_a_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist19_xIn_a_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist13_fracX_uid7_fpArctanXTest_b_6_outputreg_q : STD_LOGIC_VECTOR (9 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fracX_uid7_fpArctanXTest(BITSELECT,6)@0
    fracX_uid7_fpArctanXTest_b <= a(9 downto 0);

    -- redist11_fracX_uid7_fpArctanXTest_b_1(DELAY,272)
    redist11_fracX_uid7_fpArctanXTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid7_fpArctanXTest_b, xout => redist11_fracX_uid7_fpArctanXTest_b_1_q, clk => clk, aclr => areset );

    -- cstAllZWF_uid10_fpArctanXTest(CONSTANT,9)
    cstAllZWF_uid10_fpArctanXTest_q <= "0000000000";

    -- fracXIsZero_uid25_fpArctanXTest(LOGICAL,24)@1 + 1
    fracXIsZero_uid25_fpArctanXTest_qi <= "1" WHEN cstAllZWF_uid10_fpArctanXTest_q = redist11_fracX_uid7_fpArctanXTest_b_1_q ELSE "0";
    fracXIsZero_uid25_fpArctanXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpArctanXTest_qi, xout => fracXIsZero_uid25_fpArctanXTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid26_fpArctanXTest(LOGICAL,25)@2
    fracXIsNotZero_uid26_fpArctanXTest_q <= not (fracXIsZero_uid25_fpArctanXTest_q);

    -- cstAllOWE_uid9_fpArctanXTest(CONSTANT,8)
    cstAllOWE_uid9_fpArctanXTest_q <= "11111";

    -- redist18_xIn_a_1(DELAY,279)
    redist18_xIn_a_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist18_xIn_a_1_q, clk => clk, aclr => areset );

    -- expX_uid6_fpArctanXTest(BITSELECT,5)@1
    expX_uid6_fpArctanXTest_b <= redist18_xIn_a_1_q(14 downto 10);

    -- expXIsMax_uid24_fpArctanXTest(LOGICAL,23)@1 + 1
    expXIsMax_uid24_fpArctanXTest_qi <= "1" WHEN expX_uid6_fpArctanXTest_b = cstAllOWE_uid9_fpArctanXTest_q ELSE "0";
    expXIsMax_uid24_fpArctanXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpArctanXTest_qi, xout => expXIsMax_uid24_fpArctanXTest_q, clk => clk, aclr => areset );

    -- excN_x_uid28_fpArctanXTest(LOGICAL,27)@2
    excN_x_uid28_fpArctanXTest_q <= expXIsMax_uid24_fpArctanXTest_q and fracXIsNotZero_uid26_fpArctanXTest_q;

    -- invExcRNaN_uid115_fpArctanXTest(LOGICAL,114)@2
    invExcRNaN_uid115_fpArctanXTest_q <= not (excN_x_uid28_fpArctanXTest_q);

    -- redist19_xIn_a_2(DELAY,280)
    redist19_xIn_a_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_xIn_a_1_q, xout => redist19_xIn_a_2_q, clk => clk, aclr => areset );

    -- signX_uid8_fpArctanXTest(BITSELECT,7)@2
    signX_uid8_fpArctanXTest_b <= STD_LOGIC_VECTOR(redist19_xIn_a_2_q(15 downto 15));

    -- signR_uid116_fpArctanXTest(LOGICAL,115)@2
    signR_uid116_fpArctanXTest_q <= signX_uid8_fpArctanXTest_b and invExcRNaN_uid115_fpArctanXTest_q;

    -- redist3_signR_uid116_fpArctanXTest_q_5(DELAY,264)
    redist3_signR_uid116_fpArctanXTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid116_fpArctanXTest_q, xout => redist3_signR_uid116_fpArctanXTest_q_5_q, clk => clk, aclr => areset );

    -- redist10_signX_uid8_fpArctanXTest_b_5(DELAY,271)
    redist10_signX_uid8_fpArctanXTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid8_fpArctanXTest_b, xout => redist10_signX_uid8_fpArctanXTest_b_5_q, clk => clk, aclr => areset );

    -- cstBias_uid13_fpArctanXTest(CONSTANT,12)
    cstBias_uid13_fpArctanXTest_q <= "01111";

    -- piO2_uid37_fpArctanXTest(CONSTANT,36)
    piO2_uid37_fpArctanXTest_q <= "1100100100010";

    -- cstPiO2_uid39_fpArctanXTest(BITSELECT,38)@7
    cstPiO2_uid39_fpArctanXTest_in <= piO2_uid37_fpArctanXTest_q(11 downto 0);
    cstPiO2_uid39_fpArctanXTest_b <= cstPiO2_uid39_fpArctanXTest_in(11 downto 2);

    -- fpPiO2C_uid40_fpArctanXTest(BITJOIN,39)@7
    fpPiO2C_uid40_fpArctanXTest_q <= redist10_signX_uid8_fpArctanXTest_b_5_q & cstBias_uid13_fpArctanXTest_q & cstPiO2_uid39_fpArctanXTest_b;

    -- cstBiasM1_uid14_fpArctanXTest(CONSTANT,13)
    cstBiasM1_uid14_fpArctanXTest_q <= "01110";

    -- piO4_uid38_fpArctanXTest(CONSTANT,37)
    piO4_uid38_fpArctanXTest_q <= "11001001000";

    -- cstPiO4_uid42_fpArctanXTest(BITSELECT,41)@7
    cstPiO4_uid42_fpArctanXTest_in <= piO4_uid38_fpArctanXTest_q(9 downto 0);
    cstPiO4_uid42_fpArctanXTest_b <= cstPiO4_uid42_fpArctanXTest_in(9 downto 0);

    -- fpPiO4C_uid43_fpArctanXTest(BITJOIN,42)@7
    fpPiO4C_uid43_fpArctanXTest_q <= redist10_signX_uid8_fpArctanXTest_b_5_q & cstBiasM1_uid14_fpArctanXTest_q & cstPiO4_uid42_fpArctanXTest_b;

    -- excI_x_uid27_fpArctanXTest(LOGICAL,26)@2
    excI_x_uid27_fpArctanXTest_q <= expXIsMax_uid24_fpArctanXTest_q and fracXIsZero_uid25_fpArctanXTest_q;

    -- redist8_excI_x_uid27_fpArctanXTest_q_4(DELAY,269)
    redist8_excI_x_uid27_fpArctanXTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid27_fpArctanXTest_q, xout => redist8_excI_x_uid27_fpArctanXTest_q_4_q, clk => clk, aclr => areset );

    -- redist9_excI_x_uid27_fpArctanXTest_q_5(DELAY,270)
    redist9_excI_x_uid27_fpArctanXTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_excI_x_uid27_fpArctanXTest_q_4_q, xout => redist9_excI_x_uid27_fpArctanXTest_q_5_q, clk => clk, aclr => areset );

    -- constOut_uid45_fpArctanXTest(MUX,44)@7
    constOut_uid45_fpArctanXTest_s <= redist9_excI_x_uid27_fpArctanXTest_q_5_q;
    constOut_uid45_fpArctanXTest_combproc: PROCESS (constOut_uid45_fpArctanXTest_s, fpPiO4C_uid43_fpArctanXTest_q, fpPiO2C_uid40_fpArctanXTest_q)
    BEGIN
        CASE (constOut_uid45_fpArctanXTest_s) IS
            WHEN "0" => constOut_uid45_fpArctanXTest_q <= fpPiO4C_uid43_fpArctanXTest_q;
            WHEN "1" => constOut_uid45_fpArctanXTest_q <= fpPiO2C_uid40_fpArctanXTest_q;
            WHEN OTHERS => constOut_uid45_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracOutCst_uid106_fpArctanXTest_merged_bit_select(BITSELECT,253)@7
    fracOutCst_uid106_fpArctanXTest_merged_bit_select_in <= constOut_uid45_fpArctanXTest_q(14 downto 0);
    fracOutCst_uid106_fpArctanXTest_merged_bit_select_b <= fracOutCst_uid106_fpArctanXTest_merged_bit_select_in(9 downto 0);
    fracOutCst_uid106_fpArctanXTest_merged_bit_select_c <= fracOutCst_uid106_fpArctanXTest_merged_bit_select_in(14 downto 10);

    -- memoryC1_uid176_arctanXTables(LOOKUP,175)@2
    memoryC1_uid176_arctanXTables_combproc: PROCESS (yAddr_uid67_fpArctanXTest_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid67_fpArctanXTest_merged_bit_select_b) IS
            WHEN "0000000" => memoryC1_uid176_arctanXTables_q <= "111111111";
            WHEN "0000001" => memoryC1_uid176_arctanXTables_q <= "111111100";
            WHEN "0000010" => memoryC1_uid176_arctanXTables_q <= "111111001";
            WHEN "0000011" => memoryC1_uid176_arctanXTables_q <= "111110111";
            WHEN "0000100" => memoryC1_uid176_arctanXTables_q <= "111110100";
            WHEN "0000101" => memoryC1_uid176_arctanXTables_q <= "111110001";
            WHEN "0000110" => memoryC1_uid176_arctanXTables_q <= "111101111";
            WHEN "0000111" => memoryC1_uid176_arctanXTables_q <= "111101100";
            WHEN "0001000" => memoryC1_uid176_arctanXTables_q <= "111101001";
            WHEN "0001001" => memoryC1_uid176_arctanXTables_q <= "111100111";
            WHEN "0001010" => memoryC1_uid176_arctanXTables_q <= "111100101";
            WHEN "0001011" => memoryC1_uid176_arctanXTables_q <= "111100001";
            WHEN "0001100" => memoryC1_uid176_arctanXTables_q <= "111011111";
            WHEN "0001101" => memoryC1_uid176_arctanXTables_q <= "111011101";
            WHEN "0001110" => memoryC1_uid176_arctanXTables_q <= "111011010";
            WHEN "0001111" => memoryC1_uid176_arctanXTables_q <= "111010111";
            WHEN "0010000" => memoryC1_uid176_arctanXTables_q <= "111010101";
            WHEN "0010001" => memoryC1_uid176_arctanXTables_q <= "111010010";
            WHEN "0010010" => memoryC1_uid176_arctanXTables_q <= "111010000";
            WHEN "0010011" => memoryC1_uid176_arctanXTables_q <= "111001110";
            WHEN "0010100" => memoryC1_uid176_arctanXTables_q <= "111001100";
            WHEN "0010101" => memoryC1_uid176_arctanXTables_q <= "111001001";
            WHEN "0010110" => memoryC1_uid176_arctanXTables_q <= "111000110";
            WHEN "0010111" => memoryC1_uid176_arctanXTables_q <= "111000100";
            WHEN "0011000" => memoryC1_uid176_arctanXTables_q <= "111000001";
            WHEN "0011001" => memoryC1_uid176_arctanXTables_q <= "111000000";
            WHEN "0011010" => memoryC1_uid176_arctanXTables_q <= "110111101";
            WHEN "0011011" => memoryC1_uid176_arctanXTables_q <= "110111011";
            WHEN "0011100" => memoryC1_uid176_arctanXTables_q <= "110111000";
            WHEN "0011101" => memoryC1_uid176_arctanXTables_q <= "110110110";
            WHEN "0011110" => memoryC1_uid176_arctanXTables_q <= "110110100";
            WHEN "0011111" => memoryC1_uid176_arctanXTables_q <= "110110010";
            WHEN "0100000" => memoryC1_uid176_arctanXTables_q <= "110101111";
            WHEN "0100001" => memoryC1_uid176_arctanXTables_q <= "110101110";
            WHEN "0100010" => memoryC1_uid176_arctanXTables_q <= "110101011";
            WHEN "0100011" => memoryC1_uid176_arctanXTables_q <= "110101010";
            WHEN "0100100" => memoryC1_uid176_arctanXTables_q <= "110100111";
            WHEN "0100101" => memoryC1_uid176_arctanXTables_q <= "110100110";
            WHEN "0100110" => memoryC1_uid176_arctanXTables_q <= "110100011";
            WHEN "0100111" => memoryC1_uid176_arctanXTables_q <= "110100010";
            WHEN "0101000" => memoryC1_uid176_arctanXTables_q <= "110011111";
            WHEN "0101001" => memoryC1_uid176_arctanXTables_q <= "110011110";
            WHEN "0101010" => memoryC1_uid176_arctanXTables_q <= "110011100";
            WHEN "0101011" => memoryC1_uid176_arctanXTables_q <= "110011011";
            WHEN "0101100" => memoryC1_uid176_arctanXTables_q <= "110011000";
            WHEN "0101101" => memoryC1_uid176_arctanXTables_q <= "110010111";
            WHEN "0101110" => memoryC1_uid176_arctanXTables_q <= "110010101";
            WHEN "0101111" => memoryC1_uid176_arctanXTables_q <= "110010100";
            WHEN "0110000" => memoryC1_uid176_arctanXTables_q <= "110010010";
            WHEN "0110001" => memoryC1_uid176_arctanXTables_q <= "110010000";
            WHEN "0110010" => memoryC1_uid176_arctanXTables_q <= "110001111";
            WHEN "0110011" => memoryC1_uid176_arctanXTables_q <= "110001101";
            WHEN "0110100" => memoryC1_uid176_arctanXTables_q <= "110001101";
            WHEN "0110101" => memoryC1_uid176_arctanXTables_q <= "110001011";
            WHEN "0110110" => memoryC1_uid176_arctanXTables_q <= "110001001";
            WHEN "0110111" => memoryC1_uid176_arctanXTables_q <= "110001000";
            WHEN "0111000" => memoryC1_uid176_arctanXTables_q <= "110000110";
            WHEN "0111001" => memoryC1_uid176_arctanXTables_q <= "110000101";
            WHEN "0111010" => memoryC1_uid176_arctanXTables_q <= "110000100";
            WHEN "0111011" => memoryC1_uid176_arctanXTables_q <= "110000011";
            WHEN "0111100" => memoryC1_uid176_arctanXTables_q <= "110000001";
            WHEN "0111101" => memoryC1_uid176_arctanXTables_q <= "110000001";
            WHEN "0111110" => memoryC1_uid176_arctanXTables_q <= "101111111";
            WHEN "0111111" => memoryC1_uid176_arctanXTables_q <= "101111110";
            WHEN "1000000" => memoryC1_uid176_arctanXTables_q <= "101111110";
            WHEN "1000001" => memoryC1_uid176_arctanXTables_q <= "101111101";
            WHEN "1000010" => memoryC1_uid176_arctanXTables_q <= "101111011";
            WHEN "1000011" => memoryC1_uid176_arctanXTables_q <= "101111010";
            WHEN "1000100" => memoryC1_uid176_arctanXTables_q <= "101111001";
            WHEN "1000101" => memoryC1_uid176_arctanXTables_q <= "101111001";
            WHEN "1000110" => memoryC1_uid176_arctanXTables_q <= "101110111";
            WHEN "1000111" => memoryC1_uid176_arctanXTables_q <= "101110111";
            WHEN "1001000" => memoryC1_uid176_arctanXTables_q <= "101110110";
            WHEN "1001001" => memoryC1_uid176_arctanXTables_q <= "101110101";
            WHEN "1001010" => memoryC1_uid176_arctanXTables_q <= "101110100";
            WHEN "1001011" => memoryC1_uid176_arctanXTables_q <= "101110100";
            WHEN "1001100" => memoryC1_uid176_arctanXTables_q <= "101110011";
            WHEN "1001101" => memoryC1_uid176_arctanXTables_q <= "101110010";
            WHEN "1001110" => memoryC1_uid176_arctanXTables_q <= "101110010";
            WHEN "1001111" => memoryC1_uid176_arctanXTables_q <= "101110001";
            WHEN "1010000" => memoryC1_uid176_arctanXTables_q <= "101110001";
            WHEN "1010001" => memoryC1_uid176_arctanXTables_q <= "101110000";
            WHEN "1010010" => memoryC1_uid176_arctanXTables_q <= "101110000";
            WHEN "1010011" => memoryC1_uid176_arctanXTables_q <= "101101111";
            WHEN "1010100" => memoryC1_uid176_arctanXTables_q <= "101101111";
            WHEN "1010101" => memoryC1_uid176_arctanXTables_q <= "101101110";
            WHEN "1010110" => memoryC1_uid176_arctanXTables_q <= "101101110";
            WHEN "1010111" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1011000" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1011001" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1011010" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1011011" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1011100" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1011101" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1011110" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1011111" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1100000" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1100001" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1100010" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1100011" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1100100" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1100101" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1100110" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1100111" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1101000" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1101001" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1101010" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1101011" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1101100" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1101101" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1101110" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1101111" => memoryC1_uid176_arctanXTables_q <= "101101010";
            WHEN "1110000" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110001" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110010" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110011" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110100" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110101" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1110110" => memoryC1_uid176_arctanXTables_q <= "101101011";
            WHEN "1110111" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1111000" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1111001" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1111010" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1111011" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1111100" => memoryC1_uid176_arctanXTables_q <= "101101100";
            WHEN "1111101" => memoryC1_uid176_arctanXTables_q <= "101101110";
            WHEN "1111110" => memoryC1_uid176_arctanXTables_q <= "101101101";
            WHEN "1111111" => memoryC1_uid176_arctanXTables_q <= "101101110";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid176_arctanXTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest(BITSELECT,223)@2
    leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_in <= leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q(16 downto 0);
    leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_b <= leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_in(16 downto 0);

    -- leftShiftStage1Idx1_uid225_fxpU_uid64_fpArctanXTest(BITJOIN,224)@2
    leftShiftStage1Idx1_uid225_fxpU_uid64_fpArctanXTest_q <= leftShiftStage1Idx1Rng1_uid224_fxpU_uid64_fpArctanXTest_b & GND_q;

    -- leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest(BITSELECT,218)@2
    leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_in <= oFracUExt_uid62_fpArctanXTest_q(11 downto 0);
    leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_b <= leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_in(11 downto 0);

    -- zS_uid59_fpArctanXTest(CONSTANT,58)
    zS_uid59_fpArctanXTest_q <= "000000";

    -- leftShiftStage0Idx3_uid220_fxpU_uid64_fpArctanXTest(BITJOIN,219)@2
    leftShiftStage0Idx3_uid220_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx3Rng6_uid219_fxpU_uid64_fpArctanXTest_b & zS_uid59_fpArctanXTest_q;

    -- leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest(BITSELECT,215)@2
    leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_in <= oFracUExt_uid62_fpArctanXTest_q(13 downto 0);
    leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_b <= leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_in(13 downto 0);

    -- leftShiftStage0Idx2Pad4_uid215_fxpU_uid64_fpArctanXTest(CONSTANT,214)
    leftShiftStage0Idx2Pad4_uid215_fxpU_uid64_fpArctanXTest_q <= "0000";

    -- leftShiftStage0Idx2_uid217_fxpU_uid64_fpArctanXTest(BITJOIN,216)@2
    leftShiftStage0Idx2_uid217_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx2Rng4_uid216_fxpU_uid64_fpArctanXTest_b & leftShiftStage0Idx2Pad4_uid215_fxpU_uid64_fpArctanXTest_q;

    -- leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest(BITSELECT,212)@2
    leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_in <= oFracUExt_uid62_fpArctanXTest_q(15 downto 0);
    leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_b <= leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_in(15 downto 0);

    -- leftShiftStage0Idx1Pad2_uid212_fxpU_uid64_fpArctanXTest(CONSTANT,211)
    leftShiftStage0Idx1Pad2_uid212_fxpU_uid64_fpArctanXTest_q <= "00";

    -- leftShiftStage0Idx1_uid214_fxpU_uid64_fpArctanXTest(BITJOIN,213)@2
    leftShiftStage0Idx1_uid214_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx1Rng2_uid213_fxpU_uid64_fpArctanXTest_b & leftShiftStage0Idx1Pad2_uid212_fxpU_uid64_fpArctanXTest_q;

    -- cst01pWShift_uid61_fpArctanXTest(CONSTANT,60)
    cst01pWShift_uid61_fpArctanXTest_q <= "0000000";

    -- redist15_expX_uid6_fpArctanXTest_b_1(DELAY,276)
    redist15_expX_uid6_fpArctanXTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpArctanXTest_b, xout => redist15_expX_uid6_fpArctanXTest_b_1_q, clk => clk, aclr => areset );

    -- cst2Bias_uid127_z_uid48_fpArctanXTest(CONSTANT,126)
    cst2Bias_uid127_z_uid48_fpArctanXTest_q <= "11110";

    -- expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest(SUB,154)@2
    expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid127_z_uid48_fpArctanXTest_q);
    expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & redist15_expX_uid6_fpArctanXTest_b_1_q);
    expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_a) - UNSIGNED(expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_b));
    expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_q <= expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_o(5 downto 0);

    -- expRCompYIsOne_uid156_z_uid48_fpArctanXTest(BITSELECT,155)@2
    expRCompYIsOne_uid156_z_uid48_fpArctanXTest_in <= expRCompYIsOneExt_uid155_z_uid48_fpArctanXTest_q(4 downto 0);
    expRCompYIsOne_uid156_z_uid48_fpArctanXTest_b <= expRCompYIsOne_uid156_z_uid48_fpArctanXTest_in(4 downto 0);

    -- cst2BiasM1_uid126_z_uid48_fpArctanXTest(CONSTANT,125)
    cst2BiasM1_uid126_z_uid48_fpArctanXTest_q <= "11101";

    -- expRCompExt_uid152_z_uid48_fpArctanXTest(SUB,151)@1 + 1
    expRCompExt_uid152_z_uid48_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid126_z_uid48_fpArctanXTest_q);
    expRCompExt_uid152_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArctanXTest_b);
    expRCompExt_uid152_z_uid48_fpArctanXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCompExt_uid152_z_uid48_fpArctanXTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRCompExt_uid152_z_uid48_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid152_z_uid48_fpArctanXTest_a) - UNSIGNED(expRCompExt_uid152_z_uid48_fpArctanXTest_b));
        END IF;
    END PROCESS;
    expRCompExt_uid152_z_uid48_fpArctanXTest_q <= expRCompExt_uid152_z_uid48_fpArctanXTest_o(5 downto 0);

    -- expRComp_uid153_z_uid48_fpArctanXTest(BITSELECT,152)@2
    expRComp_uid153_z_uid48_fpArctanXTest_in <= expRCompExt_uid152_z_uid48_fpArctanXTest_q(4 downto 0);
    expRComp_uid153_z_uid48_fpArctanXTest_b <= expRComp_uid153_z_uid48_fpArctanXTest_in(4 downto 0);

    -- updatedY_uid145_z_uid48_fpArctanXTest(BITJOIN,144)@2
    updatedY_uid145_z_uid48_fpArctanXTest_q <= GND_q & cstAllZWF_uid10_fpArctanXTest_q;

    -- redist12_fracX_uid7_fpArctanXTest_b_2(DELAY,273)
    redist12_fracX_uid7_fpArctanXTest_b_2 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist11_fracX_uid7_fpArctanXTest_b_1_q, xout => redist12_fracX_uid7_fpArctanXTest_b_2_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid144_z_uid48_fpArctanXTest(LOGICAL,145)@2
    fracXIsZero_uid144_z_uid48_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & redist12_fracX_uid7_fpArctanXTest_b_2_q);
    fracXIsZero_uid144_z_uid48_fpArctanXTest_q <= "1" WHEN fracXIsZero_uid144_z_uid48_fpArctanXTest_a = updatedY_uid145_z_uid48_fpArctanXTest_q ELSE "0";

    -- expRCalc_uid161_z_uid48_fpArctanXTest(MUX,160)@2
    expRCalc_uid161_z_uid48_fpArctanXTest_s <= fracXIsZero_uid144_z_uid48_fpArctanXTest_q;
    expRCalc_uid161_z_uid48_fpArctanXTest_combproc: PROCESS (expRCalc_uid161_z_uid48_fpArctanXTest_s, expRComp_uid153_z_uid48_fpArctanXTest_b, expRCompYIsOne_uid156_z_uid48_fpArctanXTest_b)
    BEGIN
        CASE (expRCalc_uid161_z_uid48_fpArctanXTest_s) IS
            WHEN "0" => expRCalc_uid161_z_uid48_fpArctanXTest_q <= expRComp_uid153_z_uid48_fpArctanXTest_b;
            WHEN "1" => expRCalc_uid161_z_uid48_fpArctanXTest_q <= expRCompYIsOne_uid156_z_uid48_fpArctanXTest_b;
            WHEN OTHERS => expRCalc_uid161_z_uid48_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- excZ_x_uid23_fpArctanXTest(LOGICAL,22)@1 + 1
    excZ_x_uid23_fpArctanXTest_qi <= "1" WHEN expX_uid6_fpArctanXTest_b = cstAllZWE_uid12_fpArctanXTest_q ELSE "0";
    excZ_x_uid23_fpArctanXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid23_fpArctanXTest_qi, xout => excZ_x_uid23_fpArctanXTest_q, clk => clk, aclr => areset );

    -- udf_uid154_z_uid48_fpArctanXTest(BITSELECT,153)@2
    udf_uid154_z_uid48_fpArctanXTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => expRCompExt_uid152_z_uid48_fpArctanXTest_q(5)) & expRCompExt_uid152_z_uid48_fpArctanXTest_q));
    udf_uid154_z_uid48_fpArctanXTest_b <= STD_LOGIC_VECTOR(udf_uid154_z_uid48_fpArctanXTest_in(6 downto 6));

    -- invExpXIsMax_uid140_z_uid48_fpArctanXTest(LOGICAL,139)@2
    invExpXIsMax_uid140_z_uid48_fpArctanXTest_q <= not (expXIsMax_uid24_fpArctanXTest_q);

    -- InvExpXIsZero_uid141_z_uid48_fpArctanXTest(LOGICAL,140)@2
    InvExpXIsZero_uid141_z_uid48_fpArctanXTest_q <= not (excZ_x_uid23_fpArctanXTest_q);

    -- excR_x_uid142_z_uid48_fpArctanXTest(LOGICAL,141)@2
    excR_x_uid142_z_uid48_fpArctanXTest_q <= InvExpXIsZero_uid141_z_uid48_fpArctanXTest_q and invExpXIsMax_uid140_z_uid48_fpArctanXTest_q;

    -- xRegAndUdf_uid162_z_uid48_fpArctanXTest(LOGICAL,161)@2
    xRegAndUdf_uid162_z_uid48_fpArctanXTest_q <= excR_x_uid142_z_uid48_fpArctanXTest_q and udf_uid154_z_uid48_fpArctanXTest_b;

    -- xIOrXRUdf_uid163_z_uid48_fpArctanXTest(LOGICAL,162)@2
    xIOrXRUdf_uid163_z_uid48_fpArctanXTest_q <= excI_x_uid27_fpArctanXTest_q or xRegAndUdf_uid162_z_uid48_fpArctanXTest_q;

    -- excSelBits_uid164_z_uid48_fpArctanXTest(BITJOIN,163)@2
    excSelBits_uid164_z_uid48_fpArctanXTest_q <= excN_x_uid28_fpArctanXTest_q & excZ_x_uid23_fpArctanXTest_q & xIOrXRUdf_uid163_z_uid48_fpArctanXTest_q;

    -- outMuxSelEnc_uid165_z_uid48_fpArctanXTest(LOOKUP,164)@2
    outMuxSelEnc_uid165_z_uid48_fpArctanXTest_combproc: PROCESS (excSelBits_uid164_z_uid48_fpArctanXTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid164_z_uid48_fpArctanXTest_q) IS
            WHEN "000" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid168_z_uid48_fpArctanXTest(MUX,167)@2
    expRPostExc_uid168_z_uid48_fpArctanXTest_s <= outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q;
    expRPostExc_uid168_z_uid48_fpArctanXTest_combproc: PROCESS (expRPostExc_uid168_z_uid48_fpArctanXTest_s, cstAllZWE_uid12_fpArctanXTest_q, expRCalc_uid161_z_uid48_fpArctanXTest_q, cstAllOWE_uid9_fpArctanXTest_q)
    BEGIN
        CASE (expRPostExc_uid168_z_uid48_fpArctanXTest_s) IS
            WHEN "00" => expRPostExc_uid168_z_uid48_fpArctanXTest_q <= cstAllZWE_uid12_fpArctanXTest_q;
            WHEN "01" => expRPostExc_uid168_z_uid48_fpArctanXTest_q <= expRCalc_uid161_z_uid48_fpArctanXTest_q;
            WHEN "10" => expRPostExc_uid168_z_uid48_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
            WHEN "11" => expRPostExc_uid168_z_uid48_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
            WHEN OTHERS => expRPostExc_uid168_z_uid48_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid11_fpArctanXTest(CONSTANT,10)
    cstNaNWF_uid11_fpArctanXTest_q <= "0000000001";

    -- memoryC1_uid192_inverseTables(LOOKUP,191)@0
    memoryC1_uid192_inverseTables_combproc: PROCESS (yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b) IS
            WHEN "000000" => memoryC1_uid192_inverseTables_q <= "100000011";
            WHEN "000001" => memoryC1_uid192_inverseTables_q <= "100001100";
            WHEN "000010" => memoryC1_uid192_inverseTables_q <= "100010011";
            WHEN "000011" => memoryC1_uid192_inverseTables_q <= "100011010";
            WHEN "000100" => memoryC1_uid192_inverseTables_q <= "100100000";
            WHEN "000101" => memoryC1_uid192_inverseTables_q <= "100100111";
            WHEN "000110" => memoryC1_uid192_inverseTables_q <= "100101101";
            WHEN "000111" => memoryC1_uid192_inverseTables_q <= "100110011";
            WHEN "001000" => memoryC1_uid192_inverseTables_q <= "100111001";
            WHEN "001001" => memoryC1_uid192_inverseTables_q <= "100111110";
            WHEN "001010" => memoryC1_uid192_inverseTables_q <= "101000011";
            WHEN "001011" => memoryC1_uid192_inverseTables_q <= "101001000";
            WHEN "001100" => memoryC1_uid192_inverseTables_q <= "101001100";
            WHEN "001101" => memoryC1_uid192_inverseTables_q <= "101010001";
            WHEN "001110" => memoryC1_uid192_inverseTables_q <= "101010110";
            WHEN "001111" => memoryC1_uid192_inverseTables_q <= "101011010";
            WHEN "010000" => memoryC1_uid192_inverseTables_q <= "101011110";
            WHEN "010001" => memoryC1_uid192_inverseTables_q <= "101100010";
            WHEN "010010" => memoryC1_uid192_inverseTables_q <= "101100110";
            WHEN "010011" => memoryC1_uid192_inverseTables_q <= "101101010";
            WHEN "010100" => memoryC1_uid192_inverseTables_q <= "101101101";
            WHEN "010101" => memoryC1_uid192_inverseTables_q <= "101110001";
            WHEN "010110" => memoryC1_uid192_inverseTables_q <= "101110011";
            WHEN "010111" => memoryC1_uid192_inverseTables_q <= "101111000";
            WHEN "011000" => memoryC1_uid192_inverseTables_q <= "101111011";
            WHEN "011001" => memoryC1_uid192_inverseTables_q <= "101111101";
            WHEN "011010" => memoryC1_uid192_inverseTables_q <= "110000000";
            WHEN "011011" => memoryC1_uid192_inverseTables_q <= "110000010";
            WHEN "011100" => memoryC1_uid192_inverseTables_q <= "110000110";
            WHEN "011101" => memoryC1_uid192_inverseTables_q <= "110001000";
            WHEN "011110" => memoryC1_uid192_inverseTables_q <= "110001010";
            WHEN "011111" => memoryC1_uid192_inverseTables_q <= "110001110";
            WHEN "100000" => memoryC1_uid192_inverseTables_q <= "110001111";
            WHEN "100001" => memoryC1_uid192_inverseTables_q <= "110010010";
            WHEN "100010" => memoryC1_uid192_inverseTables_q <= "110010011";
            WHEN "100011" => memoryC1_uid192_inverseTables_q <= "110010101";
            WHEN "100100" => memoryC1_uid192_inverseTables_q <= "110011000";
            WHEN "100101" => memoryC1_uid192_inverseTables_q <= "110011010";
            WHEN "100110" => memoryC1_uid192_inverseTables_q <= "110011100";
            WHEN "100111" => memoryC1_uid192_inverseTables_q <= "110011110";
            WHEN "101000" => memoryC1_uid192_inverseTables_q <= "110100000";
            WHEN "101001" => memoryC1_uid192_inverseTables_q <= "110100010";
            WHEN "101010" => memoryC1_uid192_inverseTables_q <= "110100100";
            WHEN "101011" => memoryC1_uid192_inverseTables_q <= "110100101";
            WHEN "101100" => memoryC1_uid192_inverseTables_q <= "110100111";
            WHEN "101101" => memoryC1_uid192_inverseTables_q <= "110101000";
            WHEN "101110" => memoryC1_uid192_inverseTables_q <= "110101011";
            WHEN "101111" => memoryC1_uid192_inverseTables_q <= "110101011";
            WHEN "110000" => memoryC1_uid192_inverseTables_q <= "110101101";
            WHEN "110001" => memoryC1_uid192_inverseTables_q <= "110101111";
            WHEN "110010" => memoryC1_uid192_inverseTables_q <= "110110000";
            WHEN "110011" => memoryC1_uid192_inverseTables_q <= "110110001";
            WHEN "110100" => memoryC1_uid192_inverseTables_q <= "110110011";
            WHEN "110101" => memoryC1_uid192_inverseTables_q <= "110110100";
            WHEN "110110" => memoryC1_uid192_inverseTables_q <= "110110110";
            WHEN "110111" => memoryC1_uid192_inverseTables_q <= "110110111";
            WHEN "111000" => memoryC1_uid192_inverseTables_q <= "110111000";
            WHEN "111001" => memoryC1_uid192_inverseTables_q <= "110111001";
            WHEN "111010" => memoryC1_uid192_inverseTables_q <= "110111010";
            WHEN "111011" => memoryC1_uid192_inverseTables_q <= "110111011";
            WHEN "111100" => memoryC1_uid192_inverseTables_q <= "110111101";
            WHEN "111101" => memoryC1_uid192_inverseTables_q <= "110111101";
            WHEN "111110" => memoryC1_uid192_inverseTables_q <= "110111110";
            WHEN "111111" => memoryC1_uid192_inverseTables_q <= "111000000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid192_inverseTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- oFracX_uid143_z_uid48_fpArctanXTest(BITJOIN,142)@0
    oFracX_uid143_z_uid48_fpArctanXTest_q <= VCC_q & fracX_uid7_fpArctanXTest_b;

    -- y_uid147_z_uid48_fpArctanXTest(BITSELECT,146)@0
    y_uid147_z_uid48_fpArctanXTest_in <= oFracX_uid143_z_uid48_fpArctanXTest_q(9 downto 0);
    y_uid147_z_uid48_fpArctanXTest_b <= y_uid147_z_uid48_fpArctanXTest_in(9 downto 0);

    -- yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select(BITSELECT,260)@0
    yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b <= y_uid147_z_uid48_fpArctanXTest_b(9 downto 4);
    yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_c <= y_uid147_z_uid48_fpArctanXTest_b(3 downto 0);

    -- prodXY_uid207_pT1_uid198_invPolyEval(MULT,206)@0 + 2
    prodXY_uid207_pT1_uid198_invPolyEval_pr <= SIGNED(signed(resize(UNSIGNED(prodXY_uid207_pT1_uid198_invPolyEval_a0),5)) * SIGNED(prodXY_uid207_pT1_uid198_invPolyEval_b0));
    prodXY_uid207_pT1_uid198_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid207_pT1_uid198_invPolyEval_a0 <= (others => '0');
            prodXY_uid207_pT1_uid198_invPolyEval_b0 <= (others => '0');
            prodXY_uid207_pT1_uid198_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid207_pT1_uid198_invPolyEval_a0 <= yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_c;
            prodXY_uid207_pT1_uid198_invPolyEval_b0 <= STD_LOGIC_VECTOR(memoryC1_uid192_inverseTables_q);
            prodXY_uid207_pT1_uid198_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid207_pT1_uid198_invPolyEval_pr,13));
        END IF;
    END PROCESS;
    prodXY_uid207_pT1_uid198_invPolyEval_q <= prodXY_uid207_pT1_uid198_invPolyEval_s1;

    -- osig_uid208_pT1_uid198_invPolyEval(BITSELECT,207)@2
    osig_uid208_pT1_uid198_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid207_pT1_uid198_invPolyEval_q(12 downto 2));

    -- highBBits_uid200_invPolyEval(BITSELECT,199)@2
    highBBits_uid200_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid208_pT1_uid198_invPolyEval_b(10 downto 2));

    -- redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1(DELAY,261)
    redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b, xout => redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid189_inverseTables(LOOKUP,188)@1 + 1
    memoryC0_uid189_inverseTables_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid189_inverseTables_q <= "010000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1_q) IS
                WHEN "000000" => memoryC0_uid189_inverseTables_q <= "010000";
                WHEN "000001" => memoryC0_uid189_inverseTables_q <= "001111";
                WHEN "000010" => memoryC0_uid189_inverseTables_q <= "001111";
                WHEN "000011" => memoryC0_uid189_inverseTables_q <= "001111";
                WHEN "000100" => memoryC0_uid189_inverseTables_q <= "001111";
                WHEN "000101" => memoryC0_uid189_inverseTables_q <= "001110";
                WHEN "000110" => memoryC0_uid189_inverseTables_q <= "001110";
                WHEN "000111" => memoryC0_uid189_inverseTables_q <= "001110";
                WHEN "001000" => memoryC0_uid189_inverseTables_q <= "001110";
                WHEN "001001" => memoryC0_uid189_inverseTables_q <= "001110";
                WHEN "001010" => memoryC0_uid189_inverseTables_q <= "001101";
                WHEN "001011" => memoryC0_uid189_inverseTables_q <= "001101";
                WHEN "001100" => memoryC0_uid189_inverseTables_q <= "001101";
                WHEN "001101" => memoryC0_uid189_inverseTables_q <= "001101";
                WHEN "001110" => memoryC0_uid189_inverseTables_q <= "001101";
                WHEN "001111" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010000" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010001" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010010" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010011" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010100" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010101" => memoryC0_uid189_inverseTables_q <= "001100";
                WHEN "010110" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "010111" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011000" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011001" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011010" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011011" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011100" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011101" => memoryC0_uid189_inverseTables_q <= "001011";
                WHEN "011110" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "011111" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100000" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100001" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100010" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100011" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100100" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100101" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100110" => memoryC0_uid189_inverseTables_q <= "001010";
                WHEN "100111" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101000" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101001" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101010" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101011" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101100" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101101" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101110" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "101111" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "110000" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "110001" => memoryC0_uid189_inverseTables_q <= "001001";
                WHEN "110010" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "110011" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "110100" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "110101" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "110110" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "110111" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111000" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111001" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111010" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111011" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111100" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111101" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111110" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN "111111" => memoryC0_uid189_inverseTables_q <= "001000";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid189_inverseTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- memoryC0_uid188_inverseTables(LOOKUP,187)@1 + 1
    memoryC0_uid188_inverseTables_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid188_inverseTables_q <= "0000000100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist0_yAddr_uid149_z_uid48_fpArctanXTest_merged_bit_select_b_1_q) IS
                WHEN "000000" => memoryC0_uid188_inverseTables_q <= "0000000100";
                WHEN "000001" => memoryC0_uid188_inverseTables_q <= "1100000111";
                WHEN "000010" => memoryC0_uid188_inverseTables_q <= "1000010011";
                WHEN "000011" => memoryC0_uid188_inverseTables_q <= "0100100110";
                WHEN "000100" => memoryC0_uid188_inverseTables_q <= "0001000000";
                WHEN "000101" => memoryC0_uid188_inverseTables_q <= "1101100000";
                WHEN "000110" => memoryC0_uid188_inverseTables_q <= "1010000111";
                WHEN "000111" => memoryC0_uid188_inverseTables_q <= "0110110100";
                WHEN "001000" => memoryC0_uid188_inverseTables_q <= "0011100111";
                WHEN "001001" => memoryC0_uid188_inverseTables_q <= "0000100000";
                WHEN "001010" => memoryC0_uid188_inverseTables_q <= "1101011110";
                WHEN "001011" => memoryC0_uid188_inverseTables_q <= "1010100001";
                WHEN "001100" => memoryC0_uid188_inverseTables_q <= "0111101001";
                WHEN "001101" => memoryC0_uid188_inverseTables_q <= "0100110110";
                WHEN "001110" => memoryC0_uid188_inverseTables_q <= "0010000111";
                WHEN "001111" => memoryC0_uid188_inverseTables_q <= "1111011101";
                WHEN "010000" => memoryC0_uid188_inverseTables_q <= "1100110111";
                WHEN "010001" => memoryC0_uid188_inverseTables_q <= "1010010101";
                WHEN "010010" => memoryC0_uid188_inverseTables_q <= "0111110111";
                WHEN "010011" => memoryC0_uid188_inverseTables_q <= "0101011101";
                WHEN "010100" => memoryC0_uid188_inverseTables_q <= "0011000111";
                WHEN "010101" => memoryC0_uid188_inverseTables_q <= "0000110100";
                WHEN "010110" => memoryC0_uid188_inverseTables_q <= "1110100101";
                WHEN "010111" => memoryC0_uid188_inverseTables_q <= "1100011000";
                WHEN "011000" => memoryC0_uid188_inverseTables_q <= "1010001111";
                WHEN "011001" => memoryC0_uid188_inverseTables_q <= "1000001010";
                WHEN "011010" => memoryC0_uid188_inverseTables_q <= "0110000111";
                WHEN "011011" => memoryC0_uid188_inverseTables_q <= "0100000111";
                WHEN "011100" => memoryC0_uid188_inverseTables_q <= "0010001001";
                WHEN "011101" => memoryC0_uid188_inverseTables_q <= "0000001111";
                WHEN "011110" => memoryC0_uid188_inverseTables_q <= "1110010111";
                WHEN "011111" => memoryC0_uid188_inverseTables_q <= "1100100001";
                WHEN "100000" => memoryC0_uid188_inverseTables_q <= "1010101111";
                WHEN "100001" => memoryC0_uid188_inverseTables_q <= "1000111110";
                WHEN "100010" => memoryC0_uid188_inverseTables_q <= "0111010000";
                WHEN "100011" => memoryC0_uid188_inverseTables_q <= "0101100100";
                WHEN "100100" => memoryC0_uid188_inverseTables_q <= "0011111010";
                WHEN "100101" => memoryC0_uid188_inverseTables_q <= "0010010010";
                WHEN "100110" => memoryC0_uid188_inverseTables_q <= "0000101100";
                WHEN "100111" => memoryC0_uid188_inverseTables_q <= "1111001000";
                WHEN "101000" => memoryC0_uid188_inverseTables_q <= "1101100110";
                WHEN "101001" => memoryC0_uid188_inverseTables_q <= "1100000110";
                WHEN "101010" => memoryC0_uid188_inverseTables_q <= "1010101000";
                WHEN "101011" => memoryC0_uid188_inverseTables_q <= "1001001100";
                WHEN "101100" => memoryC0_uid188_inverseTables_q <= "0111110001";
                WHEN "101101" => memoryC0_uid188_inverseTables_q <= "0110011000";
                WHEN "101110" => memoryC0_uid188_inverseTables_q <= "0101000000";
                WHEN "101111" => memoryC0_uid188_inverseTables_q <= "0011101011";
                WHEN "110000" => memoryC0_uid188_inverseTables_q <= "0010010110";
                WHEN "110001" => memoryC0_uid188_inverseTables_q <= "0001000011";
                WHEN "110010" => memoryC0_uid188_inverseTables_q <= "1111110010";
                WHEN "110011" => memoryC0_uid188_inverseTables_q <= "1110100010";
                WHEN "110100" => memoryC0_uid188_inverseTables_q <= "1101010011";
                WHEN "110101" => memoryC0_uid188_inverseTables_q <= "1100000110";
                WHEN "110110" => memoryC0_uid188_inverseTables_q <= "1010111010";
                WHEN "110111" => memoryC0_uid188_inverseTables_q <= "1001101111";
                WHEN "111000" => memoryC0_uid188_inverseTables_q <= "1000100110";
                WHEN "111001" => memoryC0_uid188_inverseTables_q <= "0111011110";
                WHEN "111010" => memoryC0_uid188_inverseTables_q <= "0110010111";
                WHEN "111011" => memoryC0_uid188_inverseTables_q <= "0101010001";
                WHEN "111100" => memoryC0_uid188_inverseTables_q <= "0100001100";
                WHEN "111101" => memoryC0_uid188_inverseTables_q <= "0011001001";
                WHEN "111110" => memoryC0_uid188_inverseTables_q <= "0010000110";
                WHEN "111111" => memoryC0_uid188_inverseTables_q <= "0001000100";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid188_inverseTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- os_uid190_inverseTables(BITJOIN,189)@2
    os_uid190_inverseTables_q <= memoryC0_uid189_inverseTables_q & memoryC0_uid188_inverseTables_q;

    -- s1sumAHighB_uid201_invPolyEval(ADD,200)@2
    s1sumAHighB_uid201_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => os_uid190_inverseTables_q(15)) & os_uid190_inverseTables_q));
    s1sumAHighB_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 9 => highBBits_uid200_invPolyEval_b(8)) & highBBits_uid200_invPolyEval_b));
    s1sumAHighB_uid201_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid201_invPolyEval_a) + SIGNED(s1sumAHighB_uid201_invPolyEval_b));
    s1sumAHighB_uid201_invPolyEval_q <= s1sumAHighB_uid201_invPolyEval_o(16 downto 0);

    -- lowRangeB_uid199_invPolyEval(BITSELECT,198)@2
    lowRangeB_uid199_invPolyEval_in <= osig_uid208_pT1_uid198_invPolyEval_b(1 downto 0);
    lowRangeB_uid199_invPolyEval_b <= lowRangeB_uid199_invPolyEval_in(1 downto 0);

    -- s1_uid202_invPolyEval(BITJOIN,201)@2
    s1_uid202_invPolyEval_q <= s1sumAHighB_uid201_invPolyEval_q & lowRangeB_uid199_invPolyEval_b;

    -- fxpInverseRes_uid157_z_uid48_fpArctanXTest(BITSELECT,156)@2
    fxpInverseRes_uid157_z_uid48_fpArctanXTest_in <= s1_uid202_invPolyEval_q(15 downto 0);
    fxpInverseRes_uid157_z_uid48_fpArctanXTest_b <= fxpInverseRes_uid157_z_uid48_fpArctanXTest_in(15 downto 5);

    -- fxpInverseResFrac_uid159_z_uid48_fpArctanXTest(BITSELECT,158)@2
    fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_in <= fxpInverseRes_uid157_z_uid48_fpArctanXTest_b(9 downto 0);
    fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_b <= fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_in(9 downto 0);

    -- fracRCalc_uid160_z_uid48_fpArctanXTest(MUX,159)@2
    fracRCalc_uid160_z_uid48_fpArctanXTest_s <= fracXIsZero_uid144_z_uid48_fpArctanXTest_q;
    fracRCalc_uid160_z_uid48_fpArctanXTest_combproc: PROCESS (fracRCalc_uid160_z_uid48_fpArctanXTest_s, fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_b, cstAllZWF_uid10_fpArctanXTest_q)
    BEGIN
        CASE (fracRCalc_uid160_z_uid48_fpArctanXTest_s) IS
            WHEN "0" => fracRCalc_uid160_z_uid48_fpArctanXTest_q <= fxpInverseResFrac_uid159_z_uid48_fpArctanXTest_b;
            WHEN "1" => fracRCalc_uid160_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
            WHEN OTHERS => fracRCalc_uid160_z_uid48_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid167_z_uid48_fpArctanXTest(MUX,166)@2
    fracRPostExc_uid167_z_uid48_fpArctanXTest_s <= outMuxSelEnc_uid165_z_uid48_fpArctanXTest_q;
    fracRPostExc_uid167_z_uid48_fpArctanXTest_combproc: PROCESS (fracRPostExc_uid167_z_uid48_fpArctanXTest_s, cstAllZWF_uid10_fpArctanXTest_q, fracRCalc_uid160_z_uid48_fpArctanXTest_q, cstNaNWF_uid11_fpArctanXTest_q)
    BEGIN
        CASE (fracRPostExc_uid167_z_uid48_fpArctanXTest_s) IS
            WHEN "00" => fracRPostExc_uid167_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
            WHEN "01" => fracRPostExc_uid167_z_uid48_fpArctanXTest_q <= fracRCalc_uid160_z_uid48_fpArctanXTest_q;
            WHEN "10" => fracRPostExc_uid167_z_uid48_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
            WHEN "11" => fracRPostExc_uid167_z_uid48_fpArctanXTest_q <= cstNaNWF_uid11_fpArctanXTest_q;
            WHEN OTHERS => fracRPostExc_uid167_z_uid48_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid171_z_uid48_fpArctanXTest(BITJOIN,170)@2
    R_uid171_z_uid48_fpArctanXTest_q <= signR_uid116_fpArctanXTest_q & expRPostExc_uid168_z_uid48_fpArctanXTest_q & fracRPostExc_uid167_z_uid48_fpArctanXTest_q;

    -- path2_uid47_fpArctanXTest(COMPARE,46)@2
    path2_uid47_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & redist15_expX_uid6_fpArctanXTest_b_1_q);
    path2_uid47_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid13_fpArctanXTest_q);
    path2_uid47_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid47_fpArctanXTest_a) - UNSIGNED(path2_uid47_fpArctanXTest_b));
    path2_uid47_fpArctanXTest_n(0) <= not (path2_uid47_fpArctanXTest_o(6));

    -- u_uid49_fpArctanXTest(MUX,48)@2
    u_uid49_fpArctanXTest_s <= path2_uid47_fpArctanXTest_n;
    u_uid49_fpArctanXTest_combproc: PROCESS (u_uid49_fpArctanXTest_s, redist19_xIn_a_2_q, R_uid171_z_uid48_fpArctanXTest_q)
    BEGIN
        CASE (u_uid49_fpArctanXTest_s) IS
            WHEN "0" => u_uid49_fpArctanXTest_q <= redist19_xIn_a_2_q;
            WHEN "1" => u_uid49_fpArctanXTest_q <= R_uid171_z_uid48_fpArctanXTest_q;
            WHEN OTHERS => u_uid49_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expU_uid50_fpArctanXTest_merged_bit_select(BITSELECT,254)@2
    expU_uid50_fpArctanXTest_merged_bit_select_in <= u_uid49_fpArctanXTest_q(14 downto 0);
    expU_uid50_fpArctanXTest_merged_bit_select_b <= expU_uid50_fpArctanXTest_merged_bit_select_in(14 downto 10);
    expU_uid50_fpArctanXTest_merged_bit_select_c <= expU_uid50_fpArctanXTest_merged_bit_select_in(9 downto 0);

    -- oFracU_uid52_fpArctanXTest(BITJOIN,51)@2
    oFracU_uid52_fpArctanXTest_q <= VCC_q & expU_uid50_fpArctanXTest_merged_bit_select_c;

    -- oFracUExt_uid62_fpArctanXTest(BITJOIN,61)@2
    oFracUExt_uid62_fpArctanXTest_q <= cst01pWShift_uid61_fpArctanXTest_q & oFracU_uid52_fpArctanXTest_q;

    -- leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest(MUX,221)@2
    leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_s <= leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_b;
    leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_combproc: PROCESS (leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_s, oFracUExt_uid62_fpArctanXTest_q, leftShiftStage0Idx1_uid214_fxpU_uid64_fpArctanXTest_q, leftShiftStage0Idx2_uid217_fxpU_uid64_fpArctanXTest_q, leftShiftStage0Idx3_uid220_fxpU_uid64_fpArctanXTest_q)
    BEGIN
        CASE (leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_s) IS
            WHEN "00" => leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q <= oFracUExt_uid62_fpArctanXTest_q;
            WHEN "01" => leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx1_uid214_fxpU_uid64_fpArctanXTest_q;
            WHEN "10" => leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx2_uid217_fxpU_uid64_fpArctanXTest_q;
            WHEN "11" => leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0Idx3_uid220_fxpU_uid64_fpArctanXTest_q;
            WHEN OTHERS => leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftBias_uid55_fpArctanXTest(CONSTANT,54)
    shiftBias_uid55_fpArctanXTest_q <= "01000";

    -- shiftValue_uid56_fpArctanXTest(SUB,55)@2
    shiftValue_uid56_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & expU_uid50_fpArctanXTest_merged_bit_select_b);
    shiftValue_uid56_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid55_fpArctanXTest_q);
    shiftValue_uid56_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid56_fpArctanXTest_a) - UNSIGNED(shiftValue_uid56_fpArctanXTest_b));
    shiftValue_uid56_fpArctanXTest_q <= shiftValue_uid56_fpArctanXTest_o(5 downto 0);

    -- xMSB_uid57_fpArctanXTest(BITSELECT,56)@2
    xMSB_uid57_fpArctanXTest_b <= STD_LOGIC_VECTOR(shiftValue_uid56_fpArctanXTest_q(5 downto 5));

    -- shiftValuePostNeg_uid60_fpArctanXTest(MUX,59)@2
    shiftValuePostNeg_uid60_fpArctanXTest_s <= xMSB_uid57_fpArctanXTest_b;
    shiftValuePostNeg_uid60_fpArctanXTest_combproc: PROCESS (shiftValuePostNeg_uid60_fpArctanXTest_s, shiftValue_uid56_fpArctanXTest_q, zS_uid59_fpArctanXTest_q)
    BEGIN
        CASE (shiftValuePostNeg_uid60_fpArctanXTest_s) IS
            WHEN "0" => shiftValuePostNeg_uid60_fpArctanXTest_q <= shiftValue_uid56_fpArctanXTest_q;
            WHEN "1" => shiftValuePostNeg_uid60_fpArctanXTest_q <= zS_uid59_fpArctanXTest_q;
            WHEN OTHERS => shiftValuePostNeg_uid60_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpShifterBits_uid63_fpArctanXTest(BITSELECT,62)@2
    fxpShifterBits_uid63_fpArctanXTest_in <= shiftValuePostNeg_uid60_fpArctanXTest_q(2 downto 0);
    fxpShifterBits_uid63_fpArctanXTest_b <= fxpShifterBits_uid63_fpArctanXTest_in(2 downto 0);

    -- leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select(BITSELECT,255)@2
    leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_b <= fxpShifterBits_uid63_fpArctanXTest_b(2 downto 1);
    leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_c <= fxpShifterBits_uid63_fpArctanXTest_b(0 downto 0);

    -- leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest(MUX,226)@2
    leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_s <= leftShiftStageSel2Dto1_uid221_fxpU_uid64_fpArctanXTest_merged_bit_select_c;
    leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_combproc: PROCESS (leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_s, leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q, leftShiftStage1Idx1_uid225_fxpU_uid64_fpArctanXTest_q)
    BEGIN
        CASE (leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_s) IS
            WHEN "0" => leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_q <= leftShiftStage0_uid222_fxpU_uid64_fpArctanXTest_q;
            WHEN "1" => leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_q <= leftShiftStage1Idx1_uid225_fxpU_uid64_fpArctanXTest_q;
            WHEN OTHERS => leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- y_uid65_fpArctanXTest(BITSELECT,64)@2
    y_uid65_fpArctanXTest_in <= leftShiftStage1_uid227_fxpU_uid64_fpArctanXTest_q(16 downto 0);
    y_uid65_fpArctanXTest_b <= y_uid65_fpArctanXTest_in(16 downto 1);

    -- yAddr_uid67_fpArctanXTest_merged_bit_select(BITSELECT,256)@2
    yAddr_uid67_fpArctanXTest_merged_bit_select_b <= y_uid65_fpArctanXTest_b(15 downto 9);
    yAddr_uid67_fpArctanXTest_merged_bit_select_c <= y_uid65_fpArctanXTest_b(8 downto 3);

    -- prodXY_uid204_pT1_uid182_invPolyEval(MULT,203)@2 + 2
    prodXY_uid204_pT1_uid182_invPolyEval_pr <= SIGNED(signed(resize(UNSIGNED(prodXY_uid204_pT1_uid182_invPolyEval_a0),7)) * SIGNED(prodXY_uid204_pT1_uid182_invPolyEval_b0));
    prodXY_uid204_pT1_uid182_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid204_pT1_uid182_invPolyEval_a0 <= (others => '0');
            prodXY_uid204_pT1_uid182_invPolyEval_b0 <= (others => '0');
            prodXY_uid204_pT1_uid182_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid204_pT1_uid182_invPolyEval_a0 <= yAddr_uid67_fpArctanXTest_merged_bit_select_c;
            prodXY_uid204_pT1_uid182_invPolyEval_b0 <= STD_LOGIC_VECTOR(memoryC1_uid176_arctanXTables_q);
            prodXY_uid204_pT1_uid182_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid204_pT1_uid182_invPolyEval_pr,15));
        END IF;
    END PROCESS;
    prodXY_uid204_pT1_uid182_invPolyEval_q <= prodXY_uid204_pT1_uid182_invPolyEval_s1;

    -- osig_uid205_pT1_uid182_invPolyEval(BITSELECT,204)@4
    osig_uid205_pT1_uid182_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid204_pT1_uid182_invPolyEval_q(14 downto 4));

    -- highBBits_uid184_invPolyEval(BITSELECT,183)@4
    highBBits_uid184_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid205_pT1_uid182_invPolyEval_b(10 downto 2));

    -- redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2(DELAY,262)
    redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid67_fpArctanXTest_merged_bit_select_b, xout => redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC0_uid173_arctanXTables(LOOKUP,172)@4
    memoryC0_uid173_arctanXTables_combproc: PROCESS (redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist1_yAddr_uid67_fpArctanXTest_merged_bit_select_b_2_q) IS
            WHEN "0000000" => memoryC0_uid173_arctanXTables_q <= "010000000000000100";
            WHEN "0000001" => memoryC0_uid173_arctanXTables_q <= "010000000000000011";
            WHEN "0000010" => memoryC0_uid173_arctanXTables_q <= "001111111111111111";
            WHEN "0000011" => memoryC0_uid173_arctanXTables_q <= "001111111111111000";
            WHEN "0000100" => memoryC0_uid173_arctanXTables_q <= "001111111111101111";
            WHEN "0000101" => memoryC0_uid173_arctanXTables_q <= "001111111111100011";
            WHEN "0000110" => memoryC0_uid173_arctanXTables_q <= "001111111111010100";
            WHEN "0000111" => memoryC0_uid173_arctanXTables_q <= "001111111111000011";
            WHEN "0001000" => memoryC0_uid173_arctanXTables_q <= "001111111110101111";
            WHEN "0001001" => memoryC0_uid173_arctanXTables_q <= "001111111110011000";
            WHEN "0001010" => memoryC0_uid173_arctanXTables_q <= "001111111101111111";
            WHEN "0001011" => memoryC0_uid173_arctanXTables_q <= "001111111101100100";
            WHEN "0001100" => memoryC0_uid173_arctanXTables_q <= "001111111101000101";
            WHEN "0001101" => memoryC0_uid173_arctanXTables_q <= "001111111100100100";
            WHEN "0001110" => memoryC0_uid173_arctanXTables_q <= "001111111100000001";
            WHEN "0001111" => memoryC0_uid173_arctanXTables_q <= "001111111011011011";
            WHEN "0010000" => memoryC0_uid173_arctanXTables_q <= "001111111010110010";
            WHEN "0010001" => memoryC0_uid173_arctanXTables_q <= "001111111010000111";
            WHEN "0010010" => memoryC0_uid173_arctanXTables_q <= "001111111001011001";
            WHEN "0010011" => memoryC0_uid173_arctanXTables_q <= "001111111000101001";
            WHEN "0010100" => memoryC0_uid173_arctanXTables_q <= "001111110111110110";
            WHEN "0010101" => memoryC0_uid173_arctanXTables_q <= "001111110111000001";
            WHEN "0010110" => memoryC0_uid173_arctanXTables_q <= "001111110110001010";
            WHEN "0010111" => memoryC0_uid173_arctanXTables_q <= "001111110101010000";
            WHEN "0011000" => memoryC0_uid173_arctanXTables_q <= "001111110100010100";
            WHEN "0011001" => memoryC0_uid173_arctanXTables_q <= "001111110011010101";
            WHEN "0011010" => memoryC0_uid173_arctanXTables_q <= "001111110010010100";
            WHEN "0011011" => memoryC0_uid173_arctanXTables_q <= "001111110001010001";
            WHEN "0011100" => memoryC0_uid173_arctanXTables_q <= "001111110000001100";
            WHEN "0011101" => memoryC0_uid173_arctanXTables_q <= "001111101111000100";
            WHEN "0011110" => memoryC0_uid173_arctanXTables_q <= "001111101101111010";
            WHEN "0011111" => memoryC0_uid173_arctanXTables_q <= "001111101100101110";
            WHEN "0100000" => memoryC0_uid173_arctanXTables_q <= "001111101011100000";
            WHEN "0100001" => memoryC0_uid173_arctanXTables_q <= "001111101010001111";
            WHEN "0100010" => memoryC0_uid173_arctanXTables_q <= "001111101000111101";
            WHEN "0100011" => memoryC0_uid173_arctanXTables_q <= "001111100111101000";
            WHEN "0100100" => memoryC0_uid173_arctanXTables_q <= "001111100110010010";
            WHEN "0100101" => memoryC0_uid173_arctanXTables_q <= "001111100100111001";
            WHEN "0100110" => memoryC0_uid173_arctanXTables_q <= "001111100011011111";
            WHEN "0100111" => memoryC0_uid173_arctanXTables_q <= "001111100010000010";
            WHEN "0101000" => memoryC0_uid173_arctanXTables_q <= "001111100000100100";
            WHEN "0101001" => memoryC0_uid173_arctanXTables_q <= "001111011111000011";
            WHEN "0101010" => memoryC0_uid173_arctanXTables_q <= "001111011101100001";
            WHEN "0101011" => memoryC0_uid173_arctanXTables_q <= "001111011011111101";
            WHEN "0101100" => memoryC0_uid173_arctanXTables_q <= "001111011010011000";
            WHEN "0101101" => memoryC0_uid173_arctanXTables_q <= "001111011000110000";
            WHEN "0101110" => memoryC0_uid173_arctanXTables_q <= "001111010111000111";
            WHEN "0101111" => memoryC0_uid173_arctanXTables_q <= "001111010101011100";
            WHEN "0110000" => memoryC0_uid173_arctanXTables_q <= "001111010011110000";
            WHEN "0110001" => memoryC0_uid173_arctanXTables_q <= "001111010010000010";
            WHEN "0110010" => memoryC0_uid173_arctanXTables_q <= "001111010000010010";
            WHEN "0110011" => memoryC0_uid173_arctanXTables_q <= "001111001110100001";
            WHEN "0110100" => memoryC0_uid173_arctanXTables_q <= "001111001100101110";
            WHEN "0110101" => memoryC0_uid173_arctanXTables_q <= "001111001010111010";
            WHEN "0110110" => memoryC0_uid173_arctanXTables_q <= "001111001001000101";
            WHEN "0110111" => memoryC0_uid173_arctanXTables_q <= "001111000111001110";
            WHEN "0111000" => memoryC0_uid173_arctanXTables_q <= "001111000101010110";
            WHEN "0111001" => memoryC0_uid173_arctanXTables_q <= "001111000011011100";
            WHEN "0111010" => memoryC0_uid173_arctanXTables_q <= "001111000001100001";
            WHEN "0111011" => memoryC0_uid173_arctanXTables_q <= "001110111111100101";
            WHEN "0111100" => memoryC0_uid173_arctanXTables_q <= "001110111101101000";
            WHEN "0111101" => memoryC0_uid173_arctanXTables_q <= "001110111011101001";
            WHEN "0111110" => memoryC0_uid173_arctanXTables_q <= "001110111001101010";
            WHEN "0111111" => memoryC0_uid173_arctanXTables_q <= "001110110111101001";
            WHEN "1000000" => memoryC0_uid173_arctanXTables_q <= "001110110101100111";
            WHEN "1000001" => memoryC0_uid173_arctanXTables_q <= "001110110011100100";
            WHEN "1000010" => memoryC0_uid173_arctanXTables_q <= "001110110001100001";
            WHEN "1000011" => memoryC0_uid173_arctanXTables_q <= "001110101111011100";
            WHEN "1000100" => memoryC0_uid173_arctanXTables_q <= "001110101101010110";
            WHEN "1000101" => memoryC0_uid173_arctanXTables_q <= "001110101011001111";
            WHEN "1000110" => memoryC0_uid173_arctanXTables_q <= "001110101001001000";
            WHEN "1000111" => memoryC0_uid173_arctanXTables_q <= "001110100110111111";
            WHEN "1001000" => memoryC0_uid173_arctanXTables_q <= "001110100100110110";
            WHEN "1001001" => memoryC0_uid173_arctanXTables_q <= "001110100010101100";
            WHEN "1001010" => memoryC0_uid173_arctanXTables_q <= "001110100000100001";
            WHEN "1001011" => memoryC0_uid173_arctanXTables_q <= "001110011110010101";
            WHEN "1001100" => memoryC0_uid173_arctanXTables_q <= "001110011100001001";
            WHEN "1001101" => memoryC0_uid173_arctanXTables_q <= "001110011001111100";
            WHEN "1001110" => memoryC0_uid173_arctanXTables_q <= "001110010111101110";
            WHEN "1001111" => memoryC0_uid173_arctanXTables_q <= "001110010101100000";
            WHEN "1010000" => memoryC0_uid173_arctanXTables_q <= "001110010011010001";
            WHEN "1010001" => memoryC0_uid173_arctanXTables_q <= "001110010001000010";
            WHEN "1010010" => memoryC0_uid173_arctanXTables_q <= "001110001110110010";
            WHEN "1010011" => memoryC0_uid173_arctanXTables_q <= "001110001100100010";
            WHEN "1010100" => memoryC0_uid173_arctanXTables_q <= "001110001010010001";
            WHEN "1010101" => memoryC0_uid173_arctanXTables_q <= "001110001000000000";
            WHEN "1010110" => memoryC0_uid173_arctanXTables_q <= "001110000101101110";
            WHEN "1010111" => memoryC0_uid173_arctanXTables_q <= "001110000011011100";
            WHEN "1011000" => memoryC0_uid173_arctanXTables_q <= "001110000001001001";
            WHEN "1011001" => memoryC0_uid173_arctanXTables_q <= "001101111110110110";
            WHEN "1011010" => memoryC0_uid173_arctanXTables_q <= "001101111100100011";
            WHEN "1011011" => memoryC0_uid173_arctanXTables_q <= "001101111010001111";
            WHEN "1011100" => memoryC0_uid173_arctanXTables_q <= "001101110111111100";
            WHEN "1011101" => memoryC0_uid173_arctanXTables_q <= "001101110101101000";
            WHEN "1011110" => memoryC0_uid173_arctanXTables_q <= "001101110011010011";
            WHEN "1011111" => memoryC0_uid173_arctanXTables_q <= "001101110000111111";
            WHEN "1100000" => memoryC0_uid173_arctanXTables_q <= "001101101110101010";
            WHEN "1100001" => memoryC0_uid173_arctanXTables_q <= "001101101100010101";
            WHEN "1100010" => memoryC0_uid173_arctanXTables_q <= "001101101010000000";
            WHEN "1100011" => memoryC0_uid173_arctanXTables_q <= "001101100111101011";
            WHEN "1100100" => memoryC0_uid173_arctanXTables_q <= "001101100101010110";
            WHEN "1100101" => memoryC0_uid173_arctanXTables_q <= "001101100011000000";
            WHEN "1100110" => memoryC0_uid173_arctanXTables_q <= "001101100000101011";
            WHEN "1100111" => memoryC0_uid173_arctanXTables_q <= "001101011110010101";
            WHEN "1101000" => memoryC0_uid173_arctanXTables_q <= "001101011011111111";
            WHEN "1101001" => memoryC0_uid173_arctanXTables_q <= "001101011001101010";
            WHEN "1101010" => memoryC0_uid173_arctanXTables_q <= "001101010111010100";
            WHEN "1101011" => memoryC0_uid173_arctanXTables_q <= "001101010100111111";
            WHEN "1101100" => memoryC0_uid173_arctanXTables_q <= "001101010010101001";
            WHEN "1101101" => memoryC0_uid173_arctanXTables_q <= "001101010000010011";
            WHEN "1101110" => memoryC0_uid173_arctanXTables_q <= "001101001101111110";
            WHEN "1101111" => memoryC0_uid173_arctanXTables_q <= "001101001011101001";
            WHEN "1110000" => memoryC0_uid173_arctanXTables_q <= "001101001001010011";
            WHEN "1110001" => memoryC0_uid173_arctanXTables_q <= "001101000110111110";
            WHEN "1110010" => memoryC0_uid173_arctanXTables_q <= "001101000100101001";
            WHEN "1110011" => memoryC0_uid173_arctanXTables_q <= "001101000010010100";
            WHEN "1110100" => memoryC0_uid173_arctanXTables_q <= "001100111111111111";
            WHEN "1110101" => memoryC0_uid173_arctanXTables_q <= "001100111101101010";
            WHEN "1110110" => memoryC0_uid173_arctanXTables_q <= "001100111011010110";
            WHEN "1110111" => memoryC0_uid173_arctanXTables_q <= "001100111001000001";
            WHEN "1111000" => memoryC0_uid173_arctanXTables_q <= "001100110110101101";
            WHEN "1111001" => memoryC0_uid173_arctanXTables_q <= "001100110100011001";
            WHEN "1111010" => memoryC0_uid173_arctanXTables_q <= "001100110010000101";
            WHEN "1111011" => memoryC0_uid173_arctanXTables_q <= "001100101111110010";
            WHEN "1111100" => memoryC0_uid173_arctanXTables_q <= "001100101101011111";
            WHEN "1111101" => memoryC0_uid173_arctanXTables_q <= "001100101011001011";
            WHEN "1111110" => memoryC0_uid173_arctanXTables_q <= "001100101000111001";
            WHEN "1111111" => memoryC0_uid173_arctanXTables_q <= "001100100110100110";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid173_arctanXTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid185_invPolyEval(ADD,184)@4
    s1sumAHighB_uid185_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => memoryC0_uid173_arctanXTables_q(17)) & memoryC0_uid173_arctanXTables_q));
    s1sumAHighB_uid185_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 9 => highBBits_uid184_invPolyEval_b(8)) & highBBits_uid184_invPolyEval_b));
    s1sumAHighB_uid185_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid185_invPolyEval_a) + SIGNED(s1sumAHighB_uid185_invPolyEval_b));
    s1sumAHighB_uid185_invPolyEval_q <= s1sumAHighB_uid185_invPolyEval_o(18 downto 0);

    -- lowRangeB_uid183_invPolyEval(BITSELECT,182)@4
    lowRangeB_uid183_invPolyEval_in <= osig_uid205_pT1_uid182_invPolyEval_b(1 downto 0);
    lowRangeB_uid183_invPolyEval_b <= lowRangeB_uid183_invPolyEval_in(1 downto 0);

    -- s1_uid186_invPolyEval(BITJOIN,185)@4
    s1_uid186_invPolyEval_q <= s1sumAHighB_uid185_invPolyEval_q & lowRangeB_uid183_invPolyEval_b;

    -- fxpAtanXOXRes_uid70_fpArctanXTest(BITSELECT,69)@4
    fxpAtanXOXRes_uid70_fpArctanXTest_in <= s1_uid186_invPolyEval_q(18 downto 0);
    fxpAtanXOXRes_uid70_fpArctanXTest_b <= fxpAtanXOXRes_uid70_fpArctanXTest_in(18 downto 5);

    -- redist6_oFracU_uid52_fpArctanXTest_q_2(DELAY,267)
    redist6_oFracU_uid52_fpArctanXTest_q_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracU_uid52_fpArctanXTest_q, xout => redist6_oFracU_uid52_fpArctanXTest_q_2_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- mulXAtanXOXRes_uid71_fpArctanXTest_cma(CHAINMULTADD,252)@4 + 2
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_reset <= areset;
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena0 <= '1';
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena1 <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena0;
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_p(0) <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0(0) * mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0(0);
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid71_fpArctanXTest_cma_p(0),25);
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_w(0) <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_u(0);
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_x(0) <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_w(0);
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_y(0) <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_x(0);
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid71_fpArctanXTest_cma_a0(0) <= RESIZE(UNSIGNED(redist6_oFracU_uid52_fpArctanXTest_q_2_q),11);
                mulXAtanXOXRes_uid71_fpArctanXTest_cma_c0(0) <= RESIZE(UNSIGNED(fxpAtanXOXRes_uid70_fpArctanXTest_b),14);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid71_fpArctanXTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid71_fpArctanXTest_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid71_fpArctanXTest_cma_s(0) <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid71_fpArctanXTest_cma_s(0)(24 downto 0)), xout => mulXAtanXOXRes_uid71_fpArctanXTest_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid71_fpArctanXTest_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid71_fpArctanXTest_cma_qq(24 downto 0));

    -- normBit_uid72_fpArctanXTest(BITSELECT,71)@6
    normBit_uid72_fpArctanXTest_in <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid71_fpArctanXTest_cma_q(23 downto 0));
    normBit_uid72_fpArctanXTest_b <= STD_LOGIC_VECTOR(normBit_uid72_fpArctanXTest_in(23 downto 23));

    -- invNormBit_uid76_fpArctanXTest(LOGICAL,75)@6
    invNormBit_uid76_fpArctanXTest_q <= not (normBit_uid72_fpArctanXTest_b);

    -- redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4(DELAY,263)
    redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid50_fpArctanXTest_merged_bit_select_b, xout => redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- expRPath3Ext_uid77_fpArctanXTest(SUB,76)@6
    expRPath3Ext_uid77_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4_q);
    expRPath3Ext_uid77_fpArctanXTest_b <= STD_LOGIC_VECTOR("00000" & invNormBit_uid76_fpArctanXTest_q);
    expRPath3Ext_uid77_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid77_fpArctanXTest_a) - UNSIGNED(expRPath3Ext_uid77_fpArctanXTest_b));
    expRPath3Ext_uid77_fpArctanXTest_q <= expRPath3Ext_uid77_fpArctanXTest_o(5 downto 0);

    -- redist5_expRPath3Ext_uid77_fpArctanXTest_q_1(DELAY,266)
    redist5_expRPath3Ext_uid77_fpArctanXTest_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPath3Ext_uid77_fpArctanXTest_q, xout => redist5_expRPath3Ext_uid77_fpArctanXTest_q_1_q, clk => clk, aclr => areset );

    -- fracRPath3High_uid73_fpArctanXTest(BITSELECT,72)@6
    fracRPath3High_uid73_fpArctanXTest_in <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_q(22 downto 0);
    fracRPath3High_uid73_fpArctanXTest_b <= fracRPath3High_uid73_fpArctanXTest_in(22 downto 12);

    -- fracRPath3Low_uid74_fpArctanXTest(BITSELECT,73)@6
    fracRPath3Low_uid74_fpArctanXTest_in <= mulXAtanXOXRes_uid71_fpArctanXTest_cma_q(21 downto 0);
    fracRPath3Low_uid74_fpArctanXTest_b <= fracRPath3Low_uid74_fpArctanXTest_in(21 downto 11);

    -- fracRPath3Pre_uid75_fpArctanXTest(MUX,74)@6 + 1
    fracRPath3Pre_uid75_fpArctanXTest_s <= normBit_uid72_fpArctanXTest_b;
    fracRPath3Pre_uid75_fpArctanXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPath3Pre_uid75_fpArctanXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPath3Pre_uid75_fpArctanXTest_s) IS
                WHEN "0" => fracRPath3Pre_uid75_fpArctanXTest_q <= fracRPath3Low_uid74_fpArctanXTest_b;
                WHEN "1" => fracRPath3Pre_uid75_fpArctanXTest_q <= fracRPath3High_uid73_fpArctanXTest_b;
                WHEN OTHERS => fracRPath3Pre_uid75_fpArctanXTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracPreRnd_uid79_fpArctanXTest(BITJOIN,78)@7
    expFracPreRnd_uid79_fpArctanXTest_q <= redist5_expRPath3Ext_uid77_fpArctanXTest_q_1_q & fracRPath3Pre_uid75_fpArctanXTest_q;

    -- expfracRPath3PostRnd_uid80_fpArctanXTest(ADD,79)@7
    expfracRPath3PostRnd_uid80_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid79_fpArctanXTest_q);
    expfracRPath3PostRnd_uid80_fpArctanXTest_b <= STD_LOGIC_VECTOR("00000000000000000" & VCC_q);
    expfracRPath3PostRnd_uid80_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expfracRPath3PostRnd_uid80_fpArctanXTest_a) + UNSIGNED(expfracRPath3PostRnd_uid80_fpArctanXTest_b));
    expfracRPath3PostRnd_uid80_fpArctanXTest_q <= expfracRPath3PostRnd_uid80_fpArctanXTest_o(17 downto 0);

    -- fracRPath3_uid81_fpArctanXTest_merged_bit_select(BITSELECT,257)@7
    fracRPath3_uid81_fpArctanXTest_merged_bit_select_in <= expfracRPath3PostRnd_uid80_fpArctanXTest_q(15 downto 0);
    fracRPath3_uid81_fpArctanXTest_merged_bit_select_b <= fracRPath3_uid81_fpArctanXTest_merged_bit_select_in(10 downto 1);
    fracRPath3_uid81_fpArctanXTest_merged_bit_select_c <= fracRPath3_uid81_fpArctanXTest_merged_bit_select_in(15 downto 11);

    -- rightShiftStage1Idx3Pad3_uid248_fxpOp2Path2_uid89_fpArctanXTest(CONSTANT,247)
    rightShiftStage1Idx3Pad3_uid248_fxpOp2Path2_uid89_fpArctanXTest_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid247_fxpOp2Path2_uid89_fpArctanXTest(BITSELECT,246)@7
    rightShiftStage1Idx3Rng3_uid247_fxpOp2Path2_uid89_fpArctanXTest_b <= rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q(11 downto 3);

    -- rightShiftStage1Idx3_uid249_fxpOp2Path2_uid89_fpArctanXTest(BITJOIN,248)@7
    rightShiftStage1Idx3_uid249_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage1Idx3Pad3_uid248_fxpOp2Path2_uid89_fpArctanXTest_q & rightShiftStage1Idx3Rng3_uid247_fxpOp2Path2_uid89_fpArctanXTest_b;

    -- rightShiftStage1Idx2Rng2_uid244_fxpOp2Path2_uid89_fpArctanXTest(BITSELECT,243)@7
    rightShiftStage1Idx2Rng2_uid244_fxpOp2Path2_uid89_fpArctanXTest_b <= rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q(11 downto 2);

    -- rightShiftStage1Idx2_uid246_fxpOp2Path2_uid89_fpArctanXTest(BITJOIN,245)@7
    rightShiftStage1Idx2_uid246_fxpOp2Path2_uid89_fpArctanXTest_q <= leftShiftStage0Idx1Pad2_uid212_fxpU_uid64_fpArctanXTest_q & rightShiftStage1Idx2Rng2_uid244_fxpOp2Path2_uid89_fpArctanXTest_b;

    -- rightShiftStage1Idx1Rng1_uid241_fxpOp2Path2_uid89_fpArctanXTest(BITSELECT,240)@7
    rightShiftStage1Idx1Rng1_uid241_fxpOp2Path2_uid89_fpArctanXTest_b <= rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q(11 downto 1);

    -- rightShiftStage1Idx1_uid243_fxpOp2Path2_uid89_fpArctanXTest(BITJOIN,242)@7
    rightShiftStage1Idx1_uid243_fxpOp2Path2_uid89_fpArctanXTest_q <= GND_q & rightShiftStage1Idx1Rng1_uid241_fxpOp2Path2_uid89_fpArctanXTest_b;

    -- rightShiftStage0Idx3_uid238_fxpOp2Path2_uid89_fpArctanXTest(CONSTANT,237)
    rightShiftStage0Idx3_uid238_fxpOp2Path2_uid89_fpArctanXTest_q <= "000000000000";

    -- rightShiftStage0Idx2Pad8_uid236_fxpOp2Path2_uid89_fpArctanXTest(CONSTANT,235)
    rightShiftStage0Idx2Pad8_uid236_fxpOp2Path2_uid89_fpArctanXTest_q <= "00000000";

    -- rightShiftStage0Idx2Rng8_uid235_fxpOp2Path2_uid89_fpArctanXTest(BITSELECT,234)@7
    rightShiftStage0Idx2Rng8_uid235_fxpOp2Path2_uid89_fpArctanXTest_b <= oFracRPath2_uid87_fpArctanXTest_q(11 downto 8);

    -- rightShiftStage0Idx2_uid237_fxpOp2Path2_uid89_fpArctanXTest(BITJOIN,236)@7
    rightShiftStage0Idx2_uid237_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage0Idx2Pad8_uid236_fxpOp2Path2_uid89_fpArctanXTest_q & rightShiftStage0Idx2Rng8_uid235_fxpOp2Path2_uid89_fpArctanXTest_b;

    -- rightShiftStage0Idx1Rng4_uid232_fxpOp2Path2_uid89_fpArctanXTest(BITSELECT,231)@7
    rightShiftStage0Idx1Rng4_uid232_fxpOp2Path2_uid89_fpArctanXTest_b <= oFracRPath2_uid87_fpArctanXTest_q(11 downto 4);

    -- rightShiftStage0Idx1_uid234_fxpOp2Path2_uid89_fpArctanXTest(BITJOIN,233)@7
    rightShiftStage0Idx1_uid234_fxpOp2Path2_uid89_fpArctanXTest_q <= leftShiftStage0Idx2Pad4_uid215_fxpU_uid64_fpArctanXTest_q & rightShiftStage0Idx1Rng4_uid232_fxpOp2Path2_uid89_fpArctanXTest_b;

    -- oFracRPath2_uid87_fpArctanXTest(BITJOIN,86)@7
    oFracRPath2_uid87_fpArctanXTest_q <= VCC_q & fracRPath3Pre_uid75_fpArctanXTest_q;

    -- rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest(MUX,239)@7
    rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_s <= rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_b;
    rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_combproc: PROCESS (rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_s, oFracRPath2_uid87_fpArctanXTest_q, rightShiftStage0Idx1_uid234_fxpOp2Path2_uid89_fpArctanXTest_q, rightShiftStage0Idx2_uid237_fxpOp2Path2_uid89_fpArctanXTest_q, rightShiftStage0Idx3_uid238_fxpOp2Path2_uid89_fpArctanXTest_q)
    BEGIN
        CASE (rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_s) IS
            WHEN "00" => rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q <= oFracRPath2_uid87_fpArctanXTest_q;
            WHEN "01" => rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage0Idx1_uid234_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN "10" => rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage0Idx2_uid237_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN "11" => rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage0Idx3_uid238_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN OTHERS => rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP2_uid16_fpArctanXTest(CONSTANT,15)
    cstWFP2_uid16_fpArctanXTest_q <= "01100";

    -- cstBiasMWF_uid15_fpArctanXTest(CONSTANT,14)
    cstBiasMWF_uid15_fpArctanXTest_q <= "00101";

    -- shiftOut_uid84_fpArctanXTest(COMPARE,83)@6
    shiftOut_uid84_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4_q);
    shiftOut_uid84_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid15_fpArctanXTest_q);
    shiftOut_uid84_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid84_fpArctanXTest_a) - UNSIGNED(shiftOut_uid84_fpArctanXTest_b));
    shiftOut_uid84_fpArctanXTest_c(0) <= shiftOut_uid84_fpArctanXTest_o(6);

    -- shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged(SUB,228)@6 + 1
    shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArctanXTest_q));
    shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_b <= STD_LOGIC_VECTOR(expRPath3Ext_uid77_fpArctanXTest_q);
    shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_i <= "0" & cstWFP2_uid16_fpArctanXTest_q;
    shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (shiftOut_uid84_fpArctanXTest_c = "1") THEN
                shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_o <= shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_i;
            ELSE
                shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_o <= STD_LOGIC_VECTOR(SIGNED(shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_a) - SIGNED(shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_b));
            END IF;
        END IF;
    END PROCESS;
    shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_q <= shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_o(4 downto 0);

    -- sValPostSOutR_uid88_fpArctanXTest(BITSELECT,87)@7
    sValPostSOutR_uid88_fpArctanXTest_in <= shiftValPath2PreSub_uid83_fpArctanXTest_sValPostSOut_uid86_fpArctanXTest_merged_q(3 downto 0);
    sValPostSOutR_uid88_fpArctanXTest_b <= sValPostSOutR_uid88_fpArctanXTest_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select(BITSELECT,258)@7
    rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_b <= sValPostSOutR_uid88_fpArctanXTest_b(3 downto 2);
    rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_c <= sValPostSOutR_uid88_fpArctanXTest_b(1 downto 0);

    -- rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest(MUX,250)@7
    rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_s <= rightShiftStageSel3Dto2_uid239_fxpOp2Path2_uid89_fpArctanXTest_merged_bit_select_c;
    rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_combproc: PROCESS (rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_s, rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q, rightShiftStage1Idx1_uid243_fxpOp2Path2_uid89_fpArctanXTest_q, rightShiftStage1Idx2_uid246_fxpOp2Path2_uid89_fpArctanXTest_q, rightShiftStage1Idx3_uid249_fxpOp2Path2_uid89_fpArctanXTest_q)
    BEGIN
        CASE (rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_s) IS
            WHEN "00" => rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage0_uid240_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN "01" => rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage1Idx1_uid243_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN "10" => rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage1Idx2_uid246_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN "11" => rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q <= rightShiftStage1Idx3_uid249_fxpOp2Path2_uid89_fpArctanXTest_q;
            WHEN OTHERS => rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bPostPad_uid91_fpArctanXTest(BITJOIN,90)@7
    bPostPad_uid91_fpArctanXTest_q <= rightShiftStage1_uid251_fxpOp2Path2_uid89_fpArctanXTest_q & GND_q;

    -- path2Diff_uid92_fpArctanXTest(SUB,91)@7
    path2Diff_uid92_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & piO2_uid37_fpArctanXTest_q);
    path2Diff_uid92_fpArctanXTest_b <= STD_LOGIC_VECTOR("0" & bPostPad_uid91_fpArctanXTest_q);
    path2Diff_uid92_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid92_fpArctanXTest_a) - UNSIGNED(path2Diff_uid92_fpArctanXTest_b));
    path2Diff_uid92_fpArctanXTest_q <= path2Diff_uid92_fpArctanXTest_o(13 downto 0);

    -- normBitPath2Diff_uid93_fpArctanXTest(BITSELECT,92)@7
    normBitPath2Diff_uid93_fpArctanXTest_in <= STD_LOGIC_VECTOR(path2Diff_uid92_fpArctanXTest_q(12 downto 0));
    normBitPath2Diff_uid93_fpArctanXTest_b <= STD_LOGIC_VECTOR(normBitPath2Diff_uid93_fpArctanXTest_in(12 downto 12));

    -- expRPath2_uid97_fpArctanXTest(MUX,96)@7
    expRPath2_uid97_fpArctanXTest_s <= normBitPath2Diff_uid93_fpArctanXTest_b;
    expRPath2_uid97_fpArctanXTest_combproc: PROCESS (expRPath2_uid97_fpArctanXTest_s, cstBiasM1_uid14_fpArctanXTest_q, cstBias_uid13_fpArctanXTest_q)
    BEGIN
        CASE (expRPath2_uid97_fpArctanXTest_s) IS
            WHEN "0" => expRPath2_uid97_fpArctanXTest_q <= cstBiasM1_uid14_fpArctanXTest_q;
            WHEN "1" => expRPath2_uid97_fpArctanXTest_q <= cstBias_uid13_fpArctanXTest_q;
            WHEN OTHERS => expRPath2_uid97_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path2DiffHigh_uid94_fpArctanXTest(BITSELECT,93)@7
    path2DiffHigh_uid94_fpArctanXTest_in <= path2Diff_uid92_fpArctanXTest_q(11 downto 0);
    path2DiffHigh_uid94_fpArctanXTest_b <= path2DiffHigh_uid94_fpArctanXTest_in(11 downto 1);

    -- path2DiffLow_uid95_fpArctanXTest(BITSELECT,94)@7
    path2DiffLow_uid95_fpArctanXTest_in <= path2Diff_uid92_fpArctanXTest_q(10 downto 0);
    path2DiffLow_uid95_fpArctanXTest_b <= path2DiffLow_uid95_fpArctanXTest_in(10 downto 0);

    -- fracRPath2_uid96_fpArctanXTest(MUX,95)@7
    fracRPath2_uid96_fpArctanXTest_s <= normBitPath2Diff_uid93_fpArctanXTest_b;
    fracRPath2_uid96_fpArctanXTest_combproc: PROCESS (fracRPath2_uid96_fpArctanXTest_s, path2DiffLow_uid95_fpArctanXTest_b, path2DiffHigh_uid94_fpArctanXTest_b)
    BEGIN
        CASE (fracRPath2_uid96_fpArctanXTest_s) IS
            WHEN "0" => fracRPath2_uid96_fpArctanXTest_q <= path2DiffLow_uid95_fpArctanXTest_b;
            WHEN "1" => fracRPath2_uid96_fpArctanXTest_q <= path2DiffHigh_uid94_fpArctanXTest_b;
            WHEN OTHERS => fracRPath2_uid96_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracConc_uid100_fpArctanXTest(BITJOIN,99)@7
    expFracConc_uid100_fpArctanXTest_q <= expRPath2_uid97_fpArctanXTest_q & fracRPath2_uid96_fpArctanXTest_q;

    -- expFracRPath2PostRnd_uid101_fpArctanXTest(ADD,100)@7
    expFracRPath2PostRnd_uid101_fpArctanXTest_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid100_fpArctanXTest_q);
    expFracRPath2PostRnd_uid101_fpArctanXTest_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    expFracRPath2PostRnd_uid101_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid101_fpArctanXTest_a) + UNSIGNED(expFracRPath2PostRnd_uid101_fpArctanXTest_b));
    expFracRPath2PostRnd_uid101_fpArctanXTest_q <= expFracRPath2PostRnd_uid101_fpArctanXTest_o(16 downto 0);

    -- fracRPath2_uid102_fpArctanXTest_merged_bit_select(BITSELECT,259)@7
    fracRPath2_uid102_fpArctanXTest_merged_bit_select_in <= expFracRPath2PostRnd_uid101_fpArctanXTest_q(15 downto 0);
    fracRPath2_uid102_fpArctanXTest_merged_bit_select_b <= fracRPath2_uid102_fpArctanXTest_merged_bit_select_in(10 downto 1);
    fracRPath2_uid102_fpArctanXTest_merged_bit_select_c <= fracRPath2_uid102_fpArctanXTest_merged_bit_select_in(15 downto 11);

    -- redist16_expX_uid6_fpArctanXTest_b_5(DELAY,277)
    redist16_expX_uid6_fpArctanXTest_b_5 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_expX_uid6_fpArctanXTest_b_1_q, xout => redist16_expX_uid6_fpArctanXTest_b_5_q, clk => clk, aclr => areset );

    -- redist17_expX_uid6_fpArctanXTest_b_6(DELAY,278)
    redist17_expX_uid6_fpArctanXTest_b_6 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_expX_uid6_fpArctanXTest_b_5_q, xout => redist17_expX_uid6_fpArctanXTest_b_6_q, clk => clk, aclr => areset );

    -- expXIsBias_uid35_fpArctanXTest(LOGICAL,34)@6
    expXIsBias_uid35_fpArctanXTest_q <= "1" WHEN redist16_expX_uid6_fpArctanXTest_b_5_q = cstBias_uid13_fpArctanXTest_q ELSE "0";

    -- updatedY_uid33_fpArctanXTest(BITJOIN,32)@6
    updatedY_uid33_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q & cstAllZWF_uid10_fpArctanXTest_q;

    -- redist13_fracX_uid7_fpArctanXTest_b_6(DELAY,274)
    redist13_fracX_uid7_fpArctanXTest_b_6 : dspba_delay
    GENERIC MAP ( width => 10, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_fracX_uid7_fpArctanXTest_b_2_q, xout => redist13_fracX_uid7_fpArctanXTest_b_6_q, clk => clk, aclr => areset );

    -- redist13_fracX_uid7_fpArctanXTest_b_6_outputreg(DELAY,281)
    redist13_fracX_uid7_fpArctanXTest_b_6_outputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_fracX_uid7_fpArctanXTest_b_6_q, xout => redist13_fracX_uid7_fpArctanXTest_b_6_outputreg_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid32_fpArctanXTest(LOGICAL,33)@6
    fracXIsZero_uid32_fpArctanXTest_a <= STD_LOGIC_VECTOR("0000000000" & redist13_fracX_uid7_fpArctanXTest_b_6_outputreg_q);
    fracXIsZero_uid32_fpArctanXTest_q <= "1" WHEN fracXIsZero_uid32_fpArctanXTest_a = updatedY_uid33_fpArctanXTest_q ELSE "0";

    -- inIsOne_uid36_fpArctanXTest(LOGICAL,35)@6
    inIsOne_uid36_fpArctanXTest_q <= fracXIsZero_uid32_fpArctanXTest_q and expXIsBias_uid35_fpArctanXTest_q;

    -- arctanIsConst_uid46_fpArctanXTest(LOGICAL,45)@6
    arctanIsConst_uid46_fpArctanXTest_q <= redist8_excI_x_uid27_fpArctanXTest_q_4_q or inIsOne_uid36_fpArctanXTest_q;

    -- biasMwShift_uid53_fpArctanXTest(CONSTANT,52)
    biasMwShift_uid53_fpArctanXTest_q <= "01001";

    -- atanUIsU_uid54_fpArctanXTest(COMPARE,53)@6
    atanUIsU_uid54_fpArctanXTest_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid53_fpArctanXTest_q);
    atanUIsU_uid54_fpArctanXTest_b <= STD_LOGIC_VECTOR("00" & redist2_expU_uid50_fpArctanXTest_merged_bit_select_b_4_q);
    atanUIsU_uid54_fpArctanXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid54_fpArctanXTest_a) - UNSIGNED(atanUIsU_uid54_fpArctanXTest_b));
    atanUIsU_uid54_fpArctanXTest_n(0) <= not (atanUIsU_uid54_fpArctanXTest_o(6));

    -- redist7_path2_uid47_fpArctanXTest_n_4(DELAY,268)
    redist7_path2_uid47_fpArctanXTest_n_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => path2_uid47_fpArctanXTest_n, xout => redist7_path2_uid47_fpArctanXTest_n_4_q, clk => clk, aclr => areset );

    -- pathSelBits_uid104_fpArctanXTest(BITJOIN,103)@6
    pathSelBits_uid104_fpArctanXTest_q <= arctanIsConst_uid46_fpArctanXTest_q & atanUIsU_uid54_fpArctanXTest_n & redist7_path2_uid47_fpArctanXTest_n_4_q;

    -- fracOutMuxSelEnc_uid105_fpArctanXTest(LOOKUP,104)@6 + 1
    fracOutMuxSelEnc_uid105_fpArctanXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (pathSelBits_uid104_fpArctanXTest_q) IS
                WHEN "000" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "10";
                WHEN "001" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "01";
                WHEN "010" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "00";
                WHEN "011" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "01";
                WHEN "100" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "11";
                WHEN "101" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "11";
                WHEN "110" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "11";
                WHEN "111" => fracOutMuxSelEnc_uid105_fpArctanXTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               fracOutMuxSelEnc_uid105_fpArctanXTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRCalc_uid109_fpArctanXTest(MUX,108)@7
    expRCalc_uid109_fpArctanXTest_s <= fracOutMuxSelEnc_uid105_fpArctanXTest_q;
    expRCalc_uid109_fpArctanXTest_combproc: PROCESS (expRCalc_uid109_fpArctanXTest_s, redist17_expX_uid6_fpArctanXTest_b_6_q, fracRPath2_uid102_fpArctanXTest_merged_bit_select_c, fracRPath3_uid81_fpArctanXTest_merged_bit_select_c, fracOutCst_uid106_fpArctanXTest_merged_bit_select_c)
    BEGIN
        CASE (expRCalc_uid109_fpArctanXTest_s) IS
            WHEN "00" => expRCalc_uid109_fpArctanXTest_q <= redist17_expX_uid6_fpArctanXTest_b_6_q;
            WHEN "01" => expRCalc_uid109_fpArctanXTest_q <= fracRPath2_uid102_fpArctanXTest_merged_bit_select_c;
            WHEN "10" => expRCalc_uid109_fpArctanXTest_q <= fracRPath3_uid81_fpArctanXTest_merged_bit_select_c;
            WHEN "11" => expRCalc_uid109_fpArctanXTest_q <= fracOutCst_uid106_fpArctanXTest_merged_bit_select_c;
            WHEN OTHERS => expRCalc_uid109_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid12_fpArctanXTest(CONSTANT,11)
    cstAllZWE_uid12_fpArctanXTest_q <= "00000";

    -- excSelBits_uid110_fpArctanXTest(BITJOIN,109)@2
    excSelBits_uid110_fpArctanXTest_q <= excN_x_uid28_fpArctanXTest_q & GND_q & excZ_x_uid23_fpArctanXTest_q;

    -- outMuxSelEnc_uid111_fpArctanXTest(LOOKUP,110)@2 + 1
    outMuxSelEnc_uid111_fpArctanXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excSelBits_uid110_fpArctanXTest_q) IS
                WHEN "000" => outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
                WHEN "001" => outMuxSelEnc_uid111_fpArctanXTest_q <= "00";
                WHEN "010" => outMuxSelEnc_uid111_fpArctanXTest_q <= "10";
                WHEN "011" => outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
                WHEN "100" => outMuxSelEnc_uid111_fpArctanXTest_q <= "11";
                WHEN "101" => outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
                WHEN "110" => outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
                WHEN "111" => outMuxSelEnc_uid111_fpArctanXTest_q <= "01";
                WHEN OTHERS => -- unreachable
                               outMuxSelEnc_uid111_fpArctanXTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5(DELAY,265)
    redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5 : dspba_delay
    GENERIC MAP ( width => 2, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => outMuxSelEnc_uid111_fpArctanXTest_q, xout => redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5_q, clk => clk, aclr => areset );

    -- expRPostExc_uid114_fpArctanXTest(MUX,113)@7
    expRPostExc_uid114_fpArctanXTest_s <= redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5_q;
    expRPostExc_uid114_fpArctanXTest_combproc: PROCESS (expRPostExc_uid114_fpArctanXTest_s, cstAllZWE_uid12_fpArctanXTest_q, expRCalc_uid109_fpArctanXTest_q, cstAllOWE_uid9_fpArctanXTest_q)
    BEGIN
        CASE (expRPostExc_uid114_fpArctanXTest_s) IS
            WHEN "00" => expRPostExc_uid114_fpArctanXTest_q <= cstAllZWE_uid12_fpArctanXTest_q;
            WHEN "01" => expRPostExc_uid114_fpArctanXTest_q <= expRCalc_uid109_fpArctanXTest_q;
            WHEN "10" => expRPostExc_uid114_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
            WHEN "11" => expRPostExc_uid114_fpArctanXTest_q <= cstAllOWE_uid9_fpArctanXTest_q;
            WHEN OTHERS => expRPostExc_uid114_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist14_fracX_uid7_fpArctanXTest_b_7(DELAY,275)
    redist14_fracX_uid7_fpArctanXTest_b_7 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_fracX_uid7_fpArctanXTest_b_6_outputreg_q, xout => redist14_fracX_uid7_fpArctanXTest_b_7_q, clk => clk, aclr => areset );

    -- fracRCalc_uid107_fpArctanXTest(MUX,106)@7
    fracRCalc_uid107_fpArctanXTest_s <= fracOutMuxSelEnc_uid105_fpArctanXTest_q;
    fracRCalc_uid107_fpArctanXTest_combproc: PROCESS (fracRCalc_uid107_fpArctanXTest_s, redist14_fracX_uid7_fpArctanXTest_b_7_q, fracRPath2_uid102_fpArctanXTest_merged_bit_select_b, fracRPath3_uid81_fpArctanXTest_merged_bit_select_b, fracOutCst_uid106_fpArctanXTest_merged_bit_select_b)
    BEGIN
        CASE (fracRCalc_uid107_fpArctanXTest_s) IS
            WHEN "00" => fracRCalc_uid107_fpArctanXTest_q <= redist14_fracX_uid7_fpArctanXTest_b_7_q;
            WHEN "01" => fracRCalc_uid107_fpArctanXTest_q <= fracRPath2_uid102_fpArctanXTest_merged_bit_select_b;
            WHEN "10" => fracRCalc_uid107_fpArctanXTest_q <= fracRPath3_uid81_fpArctanXTest_merged_bit_select_b;
            WHEN "11" => fracRCalc_uid107_fpArctanXTest_q <= fracOutCst_uid106_fpArctanXTest_merged_bit_select_b;
            WHEN OTHERS => fracRCalc_uid107_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid113_fpArctanXTest(MUX,112)@7
    fracRPostExc_uid113_fpArctanXTest_s <= redist4_outMuxSelEnc_uid111_fpArctanXTest_q_5_q;
    fracRPostExc_uid113_fpArctanXTest_combproc: PROCESS (fracRPostExc_uid113_fpArctanXTest_s, cstAllZWF_uid10_fpArctanXTest_q, fracRCalc_uid107_fpArctanXTest_q, cstNaNWF_uid11_fpArctanXTest_q)
    BEGIN
        CASE (fracRPostExc_uid113_fpArctanXTest_s) IS
            WHEN "00" => fracRPostExc_uid113_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
            WHEN "01" => fracRPostExc_uid113_fpArctanXTest_q <= fracRCalc_uid107_fpArctanXTest_q;
            WHEN "10" => fracRPostExc_uid113_fpArctanXTest_q <= cstAllZWF_uid10_fpArctanXTest_q;
            WHEN "11" => fracRPostExc_uid113_fpArctanXTest_q <= cstNaNWF_uid11_fpArctanXTest_q;
            WHEN OTHERS => fracRPostExc_uid113_fpArctanXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid117_fpArctanXTest(BITJOIN,116)@7
    R_uid117_fpArctanXTest_q <= redist3_signR_uid116_fpArctanXTest_q_5_q & expRPostExc_uid114_fpArctanXTest_q & fracRPostExc_uid113_fpArctanXTest_q;

    -- xOut(GPOUT,4)@7
    q <= R_uid117_fpArctanXTest_q;

END normal;
