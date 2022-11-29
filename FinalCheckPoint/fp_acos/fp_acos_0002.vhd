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

-- VHDL created from fp_acos_0002
-- VHDL created on Mon Nov 28 22:25:44 2022


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

entity fp_acos_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fp_acos_0002;

architecture normal of fp_acos_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracX_uid7_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal singX_uid8_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstAllZWF_uid10_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstNaNWF_uid11_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid12_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBias_uid13_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasM1_uid14_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasMwFMwShift_uid15_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cstBiasM2_uid16_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstBiasP1_uid17_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excZ_x_uid25_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid29_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid30_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid31_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid32_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid33_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expGT0_uid34_fpArccosXTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expGT0_uid34_fpArccosXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expGT0_uid34_fpArccosXTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expGT0_uid34_fpArccosXTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expEQ0_uid35_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid37_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid36_fpArccosXTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsZero_uid36_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invFracXIsZero_uid39_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXZFracNotZero_uid40_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inputOutOfRange_uid41_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid42_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftValue_uid43_fpArccosXTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValue_uid43_fpArccosXTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValue_uid43_fpArccosXTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValue_uid43_fpArccosXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftOutVal_uid45_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cst01pWShift_uid48_fpArccosXTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal oFracXExt_uid49_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal inputIsMax_uid51_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid52_fpArccosXTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal y_uid52_fpArccosXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal firstPath_uid53_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal padACst_uid54_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aPostPad_uid55_fpArccosXTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal oMy_uid56_fpArccosXTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal oMy_uid56_fpArccosXTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal oMy_uid56_fpArccosXTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal oMy_uid56_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal l_uid57_fpArccosXTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal l_uid57_fpArccosXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expL_uid59_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expL_uid59_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expL_uid59_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expL_uid59_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fpLOutFrac_uid60_fpArccosXTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fpLOutFrac_uid60_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expLRange_uid61_fpArccosXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expLRange_uid61_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fpL_uid62_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal fracSqrtFPL_uid65_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal oSqrtFPLFrac_uid66_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expSqrtFPL_uid67_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal srVal_uid68_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal srVal_uid68_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal srVal_uid68_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal srVal_uid68_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal srValRange_uid69_fpArccosXTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal srValRange_uid69_fpArccosXTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal fxpArcSinXO2XRes_uid75_fpArccosXTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal fxpArcSinXO2XRes_uid75_fpArccosXTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fpArcsinXO2XRes_uid77_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal oFracArcsinL_uid81_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal srValArcsinL_uid83_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal srValArcsinL_uid83_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal srValArcsinL_uid83_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal srValArcsinL_uid83_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal srValArcsinLRange_uid84_fpArccosXTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal srValArcsinLRange_uid84_fpArccosXTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal pi_uid87_fpArccosXTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal padBCst_uid88_fpArccosXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bPostPad_uid89_fpArccosXTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal path1NegCase_uid90_fpArccosXTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal path1NegCase_uid90_fpArccosXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal path1NegCase_uid90_fpArccosXTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal path1NegCase_uid90_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path1NegCaseN_uid91_fpArccosXTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal path1NegCaseN_uid91_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path1NegCaseFracHigh_uid92_fpArccosXTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal path1NegCaseFracHigh_uid92_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path1NegCaseFracLow_uid93_fpArccosXTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal path1NegCaseFracLow_uid93_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path1NegCaseFrac_uid94_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal path1NegCaseFrac_uid94_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal path1NegCaseExp_uid95_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal path1NegCaseExp_uid95_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal path1NegCaseExp_uid95_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal path1NegCaseExp_uid95_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal path1NegCaseExpRange_uid96_fpArccosXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal path1NegCaseExpRange_uid96_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal path1NegCaseUR_uid97_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path1ResFP_uid99_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal path1ResFP_uid99_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yAddr_uid101_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal mPPolyEval_uid102_fpArccosXTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal mPPolyEval_uid102_fpArccosXTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal fxpArccosX_uid104_fpArccosXTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal fxpArccosX_uid104_fpArccosXTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal pi2_uid105_fpArccosXTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aPostPad_uid107_fpArccosXTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal path2Diff_uid108_fpArccosXTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal path2Diff_uid108_fpArccosXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal path2Diff_uid108_fpArccosXTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal path2Diff_uid108_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal normBit_uid109_fpArccosXTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal normBit_uid109_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path2NegCaseFPFrac_uid110_fpArccosXTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal path2NegCaseFPFrac_uid110_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path2NegCaseFPL_uid111_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path2NegCaseFPFrac_uid112_fpArccosXTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal path2NegCaseFPFrac_uid112_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path2NegCaseFPS_uid113_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path2NegCaseFP_uid114_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal path2NegCaseFP_uid114_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path2PosCaseFPFraction_uid115_fpArccosXTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal path2PosCaseFPFraction_uid115_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal path2PosCaseFP_uid116_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal path2ResFP_uid117_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal path2ResFP_uid117_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal pathSelBits_uid118_fpArccosXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracOutMuxSelEnc_uid119_fpArccosXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal piF_uid121_fpArccosXTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal piF_uid121_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRCalc_uid124_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid124_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRCalc_uid127_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRCalc_uid127_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xRegAndOutOfRange_uid128_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid129_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid129_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid130_fpArccosXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid131_fpArccosXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid133_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid133_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid134_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid134_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sR_uid135_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid139_fpLOut1_uid58_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid139_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid141_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid142_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid144_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid147_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid148_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid149_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid151_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid154_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid155_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid156_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid158_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid161_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid162_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid165_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid168_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid169_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid169_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid170_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expX_uid177_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal signX_uid178_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid186_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid187_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid188_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid189_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid190_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid191_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid192_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expREven_uid196_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expROdd_uid199_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal addrFull_uid204_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracPaddingOne_uid212_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal oFracX_uid215_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal oFracXZ_mergedSignalTM_uid218_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal oFracXSignExt_mergedSignalTM_uid223_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal paddingY_uid226_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal updatedY_uid227_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal pLTOne_uid229_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal fracPENotOne_uid233_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPENotOneAndCRRoundsExp_uid234_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid235_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid237_sqrtFPL_uid64_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid237_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid237_sqrtFPL_uid64_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expR_uid237_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal invSignX_uid238_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid239_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid240_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid241_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid242_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excConc_uid243_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracSelIn_uid244_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRR_uid248_sqrtFPL_uid64_fpArccosXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRR_uid248_sqrtFPL_uid64_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal negZero_uid256_sqrtFPL_uid64_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal negZero_uid256_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC0_uid259_arcCosXTables_q : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC1_uid262_arcCosXTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid265_arcCosXTables_q : STD_LOGIC_VECTOR (6 downto 0);
    signal lowRangeB_uid273_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid273_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid274_invPolyEval_b : STD_LOGIC_VECTOR (6 downto 0);
    signal s1sumAHighB_uid275_invPolyEval_a : STD_LOGIC_VECTOR (10 downto 0);
    signal s1sumAHighB_uid275_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal s1sumAHighB_uid275_invPolyEval_o : STD_LOGIC_VECTOR (10 downto 0);
    signal s1sumAHighB_uid275_invPolyEval_q : STD_LOGIC_VECTOR (10 downto 0);
    signal s1_uid276_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid279_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid279_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid280_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal s2sumAHighB_uid281_invPolyEval_a : STD_LOGIC_VECTOR (17 downto 0);
    signal s2sumAHighB_uid281_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal s2sumAHighB_uid281_invPolyEval_o : STD_LOGIC_VECTOR (17 downto 0);
    signal s2sumAHighB_uid281_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal s2_uid282_invPolyEval_q : STD_LOGIC_VECTOR (19 downto 0);
    signal expY_uid285_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal signX_uid286_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid287_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid294_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid296_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid297_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid298_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid299_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid300_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid301_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid306_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid308_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid310_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid311_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid312_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid313_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid314_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid315_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracY_uid321_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expSum_uid322_arcsinL_uid79_fpArccosXTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid322_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid322_arcsinL_uid79_fpArccosXTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid322_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal biasInc_uid323_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal signR_uid326_arcsinL_uid79_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid326_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid327_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracPreRound_uid333_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal roundBitAndNormalizationOp_uid335_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid340_arcsinL_uid79_fpArccosXTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid340_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid340_arcsinL_uid79_fpArccosXTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid340_arcsinL_uid79_fpArccosXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid342_arcsinL_uid79_fpArccosXTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expOvf_uid342_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expOvf_uid342_arcsinL_uid79_fpArccosXTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expOvf_uid342_arcsinL_uid79_fpArccosXTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid343_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid344_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid345_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid346_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid347_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid348_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid349_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid350_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid351_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid352_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid353_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid354_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid355_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid356_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid357_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid358_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid368_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid370_arcsinL_uid79_fpArccosXTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC0_uid372_arcCosX2Tables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid373_arcCosX2Tables_q : STD_LOGIC_VECTOR (6 downto 0);
    signal os_uid374_arcCosX2Tables_q : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC1_uid376_arcCosX2Tables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid377_arcCosX2Tables_q : STD_LOGIC_VECTOR (0 downto 0);
    signal os_uid378_arcCosX2Tables_q : STD_LOGIC_VECTOR (10 downto 0);
    signal lowRangeB_uid384_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid384_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid385_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal s1sumAHighB_uid386_invPolyEval_a : STD_LOGIC_VECTOR (17 downto 0);
    signal s1sumAHighB_uid386_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal s1sumAHighB_uid386_invPolyEval_o : STD_LOGIC_VECTOR (17 downto 0);
    signal s1sumAHighB_uid386_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal s1_uid387_invPolyEval_q : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid389_sqrtTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid390_sqrtTables_q : STD_LOGIC_VECTOR (5 downto 0);
    signal os_uid391_sqrtTables_q : STD_LOGIC_VECTOR (15 downto 0);
    signal memoryC1_uid393_sqrtTables_q : STD_LOGIC_VECTOR (9 downto 0);
    signal lowRangeB_uid400_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid400_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid401_invPolyEval_b : STD_LOGIC_VECTOR (9 downto 0);
    signal s1sumAHighB_uid402_invPolyEval_a : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid402_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid402_invPolyEval_o : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid402_invPolyEval_q : STD_LOGIC_VECTOR (16 downto 0);
    signal s1_uid403_invPolyEval_q : STD_LOGIC_VECTOR (18 downto 0);
    signal prodXY_uid405_pT1_uid272_invPolyEval_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid405_pT1_uid272_invPolyEval_b0 : STD_LOGIC_VECTOR (6 downto 0);
    signal prodXY_uid405_pT1_uid272_invPolyEval_s1 : STD_LOGIC_VECTOR (12 downto 0);
    signal prodXY_uid405_pT1_uid272_invPolyEval_pr : SIGNED (13 downto 0);
    signal prodXY_uid405_pT1_uid272_invPolyEval_q : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid406_pT1_uid272_invPolyEval_b : STD_LOGIC_VECTOR (7 downto 0);
    signal osig_uid409_pT2_uid278_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid415_pT1_uid383_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid418_pT1_uid399_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_a : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_i : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_o : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx1Rng8_uid423_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1_uid425_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx2Rng16_uid426_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2_uid428_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx3_uid429_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx1Rng2_uid432_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage1Idx1_uid434_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx2Rng4_uid435_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx2_uid437_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx3Rng6_uid438_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Pad6_uid439_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid440_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage2Idx1Rng1_uid443_fxpX_uid50_fpArccosXTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx1_uid445_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx1Rng4_uid451_alignSqrt_uid70_fpArccosXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx1_uid453_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx2Rng8_uid454_alignSqrt_uid70_fpArccosXTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx2_uid456_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1Rng1_uid460_alignSqrt_uid70_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx1_uid462_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx2Rng2_uid463_alignSqrt_uid70_fpArccosXTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx2_uid465_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx3Rng3_uid466_alignSqrt_uid70_fpArccosXTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx3_uid468_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx1Rng4_uid474_alignArcsinL_uid85_fpArccosXTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx1_uid476_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx2Rng8_uid477_alignArcsinL_uid85_fpArccosXTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx2_uid479_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1Rng1_uid483_alignArcsinL_uid85_fpArccosXTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx1_uid485_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx2Rng2_uid486_alignArcsinL_uid85_fpArccosXTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx2_uid488_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx3Rng3_uid489_alignArcsinL_uid85_fpArccosXTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx3_uid491_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_reset : std_logic;
    type squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0 : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0 : signal is true;
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_c0 : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0type(0 to 0);
    attribute preserve of squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_c0 : signal is true;
    type squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_p : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_u : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_w : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_x : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_y : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_s : squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ptype(0 to 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena0 : std_logic;
    signal squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena1 : std_logic;
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_reset : std_logic;
    type prodXY_uid408_pT2_uid278_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(5 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_a0 : prodXY_uid408_pT2_uid278_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid408_pT2_uid278_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid408_pT2_uid278_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_c0 : prodXY_uid408_pT2_uid278_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid408_pT2_uid278_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid408_pT2_uid278_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(6 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_l : prodXY_uid408_pT2_uid278_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_p : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_u : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_w : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_x : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_y : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_s : prodXY_uid408_pT2_uid278_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_qq : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_q : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid408_pT2_uid278_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_reset : std_logic;
    type prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(10 downto 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0 : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0 : signal is true;
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_c0 : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_c0 : signal is true;
    type prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(21 downto 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_p : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_u : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_w : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_x : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_y : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_s : prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ptype(0 to 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_qq : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_q : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena0 : std_logic;
    signal prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena1 : std_logic;
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_reset : std_logic;
    type prodXY_uid414_pT1_uid383_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(3 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_a0 : prodXY_uid414_pT1_uid383_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid414_pT1_uid383_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid414_pT1_uid383_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_c0 : prodXY_uid414_pT1_uid383_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid414_pT1_uid383_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid414_pT1_uid383_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(4 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_l : prodXY_uid414_pT1_uid383_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_p : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_u : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_w : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_x : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_y : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_s : prodXY_uid414_pT1_uid383_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_qq : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid414_pT1_uid383_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_reset : std_logic;
    type prodXY_uid417_pT1_uid399_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(4 downto 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_a0 : prodXY_uid417_pT1_uid399_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid417_pT1_uid399_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_c0 : prodXY_uid414_pT1_uid383_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid417_pT1_uid399_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid417_pT1_uid399_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(5 downto 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_l : prodXY_uid417_pT1_uid399_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_p : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_u : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_w : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_x : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_y : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_s : prodXY_uid417_pT1_uid399_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_qq : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid417_pT1_uid399_invPolyEval_cma_ena1 : std_logic;
    signal rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (11 downto 0);
    signal rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal fracArcsinL_uid80_fpArccosXTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracArcsinL_uid80_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal fracArcsinL_uid80_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal yAddr_uid72_fpArccosXTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal yAddr_uid72_fpArccosXTest_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_yAddr_uid72_fpArccosXTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist3_signR_uid326_arcsinL_uid79_fpArccosXTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_signX_uid286_arcsinL_uid79_fpArccosXTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist8_fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist15_excRNaN_uid129_fpArccosXTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_yAddr_uid101_fpArccosXTest_b_13_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist19_expSqrtFPL_uid67_fpArccosXTest_b_6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_l_uid57_fpArccosXTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist22_firstPath_uid53_fpArccosXTest_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_inputIsMax_uid51_fpArccosXTest_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_singX_uid8_fpArccosXTest_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_fracX_uid7_fpArccosXTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_reset0 : std_logic;
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_iq : STD_LOGIC_VECTOR (9 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i : signal is true;
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq : std_logic;
    attribute preserve of redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq : signal is true;
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q : signal is true;
    signal redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_reset0 : std_logic;
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_iq : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i : signal is true;
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq : std_logic;
    attribute preserve of redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq : signal is true;
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q : signal is true;
    signal redist16_mPPolyEval_uid102_fpArccosXTest_b_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_reset0 : std_logic;
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i : signal is true;
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq : std_logic;
    attribute preserve of redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq : signal is true;
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q : signal is true;
    signal redist17_yAddr_uid101_fpArccosXTest_b_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_reset0 : std_logic;
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i : signal is true;
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq : std_logic;
    attribute preserve of redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq : signal is true;
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q : signal is true;
    signal redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllOWE_uid9_fpArccosXTest(CONSTANT,8)
    cstAllOWE_uid9_fpArccosXTest_q <= "11111";

    -- cstBiasP1_uid17_fpArccosXTest(CONSTANT,16)
    cstBiasP1_uid17_fpArccosXTest_q <= "10000";

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_notEnable(LOGICAL,563)
    redist17_yAddr_uid101_fpArccosXTest_b_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_nor(LOGICAL,564)
    redist17_yAddr_uid101_fpArccosXTest_b_11_nor_q <= not (redist17_yAddr_uid101_fpArccosXTest_b_11_notEnable_q or redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q);

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_mem_last(CONSTANT,560)
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_last_q <= "01000";

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_cmp(LOGICAL,561)
    redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_b <= STD_LOGIC_VECTOR("0" & redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_q);
    redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_q <= "1" WHEN redist17_yAddr_uid101_fpArccosXTest_b_11_mem_last_q = redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_b ELSE "0";

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg(REG,562)
    redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg_q <= STD_LOGIC_VECTOR(redist17_yAddr_uid101_fpArccosXTest_b_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena(REG,565)
    redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist17_yAddr_uid101_fpArccosXTest_b_11_nor_q = "1") THEN
                redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist17_yAddr_uid101_fpArccosXTest_b_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_enaAnd(LOGICAL,566)
    redist17_yAddr_uid101_fpArccosXTest_b_11_enaAnd_q <= redist17_yAddr_uid101_fpArccosXTest_b_11_sticky_ena_q and VCC_q;

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt(COUNTER,558)
    -- low=0, high=9, step=1, init=0
    redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq <= '1';
            ELSE
                redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq <= '0';
            END IF;
            IF (redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_eq = '1') THEN
                redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i <= redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i + 7;
            ELSE
                redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i <= redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_i, 4)));

    -- rightShiftStage2Idx1Rng1_uid443_fxpX_uid50_fpArccosXTest(BITSELECT,442)@1
    rightShiftStage2Idx1Rng1_uid443_fxpX_uid50_fpArccosXTest_b <= rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q(17 downto 1);

    -- rightShiftStage2Idx1_uid445_fxpX_uid50_fpArccosXTest(BITJOIN,444)@1
    rightShiftStage2Idx1_uid445_fxpX_uid50_fpArccosXTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid443_fxpX_uid50_fpArccosXTest_b;

    -- rightShiftStage1Idx3Pad6_uid439_fxpX_uid50_fpArccosXTest(CONSTANT,438)
    rightShiftStage1Idx3Pad6_uid439_fxpX_uid50_fpArccosXTest_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid438_fxpX_uid50_fpArccosXTest(BITSELECT,437)@1
    rightShiftStage1Idx3Rng6_uid438_fxpX_uid50_fpArccosXTest_b <= rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q(17 downto 6);

    -- rightShiftStage1Idx3_uid440_fxpX_uid50_fpArccosXTest(BITJOIN,439)@1
    rightShiftStage1Idx3_uid440_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx3Pad6_uid439_fxpX_uid50_fpArccosXTest_q & rightShiftStage1Idx3Rng6_uid438_fxpX_uid50_fpArccosXTest_b;

    -- zs_uid149_fpLOut1_uid58_fpArccosXTest(CONSTANT,148)
    zs_uid149_fpLOut1_uid58_fpArccosXTest_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid435_fxpX_uid50_fpArccosXTest(BITSELECT,434)@1
    rightShiftStage1Idx2Rng4_uid435_fxpX_uid50_fpArccosXTest_b <= rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q(17 downto 4);

    -- rightShiftStage1Idx2_uid437_fxpX_uid50_fpArccosXTest(BITJOIN,436)@1
    rightShiftStage1Idx2_uid437_fxpX_uid50_fpArccosXTest_q <= zs_uid149_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage1Idx2Rng4_uid435_fxpX_uid50_fpArccosXTest_b;

    -- zs_uid156_fpLOut1_uid58_fpArccosXTest(CONSTANT,155)
    zs_uid156_fpLOut1_uid58_fpArccosXTest_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid432_fxpX_uid50_fpArccosXTest(BITSELECT,431)@1
    rightShiftStage1Idx1Rng2_uid432_fxpX_uid50_fpArccosXTest_b <= rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q(17 downto 2);

    -- rightShiftStage1Idx1_uid434_fxpX_uid50_fpArccosXTest(BITJOIN,433)@1
    rightShiftStage1Idx1_uid434_fxpX_uid50_fpArccosXTest_q <= zs_uid156_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage1Idx1Rng2_uid432_fxpX_uid50_fpArccosXTest_b;

    -- rightShiftStage0Idx3_uid429_fxpX_uid50_fpArccosXTest(CONSTANT,428)
    rightShiftStage0Idx3_uid429_fxpX_uid50_fpArccosXTest_q <= "000000000000000000";

    -- padACst_uid54_fpArccosXTest(CONSTANT,53)
    padACst_uid54_fpArccosXTest_q <= "0000000000000000";

    -- rightShiftStage0Idx2Rng16_uid426_fxpX_uid50_fpArccosXTest(BITSELECT,425)@1
    rightShiftStage0Idx2Rng16_uid426_fxpX_uid50_fpArccosXTest_b <= oFracXExt_uid49_fpArccosXTest_q(17 downto 16);

    -- rightShiftStage0Idx2_uid428_fxpX_uid50_fpArccosXTest(BITJOIN,427)@1
    rightShiftStage0Idx2_uid428_fxpX_uid50_fpArccosXTest_q <= padACst_uid54_fpArccosXTest_q & rightShiftStage0Idx2Rng16_uid426_fxpX_uid50_fpArccosXTest_b;

    -- zs_uid142_fpLOut1_uid58_fpArccosXTest(CONSTANT,141)
    zs_uid142_fpLOut1_uid58_fpArccosXTest_q <= "00000000";

    -- rightShiftStage0Idx1Rng8_uid423_fxpX_uid50_fpArccosXTest(BITSELECT,422)@1
    rightShiftStage0Idx1Rng8_uid423_fxpX_uid50_fpArccosXTest_b <= oFracXExt_uid49_fpArccosXTest_q(17 downto 8);

    -- rightShiftStage0Idx1_uid425_fxpX_uid50_fpArccosXTest(BITJOIN,424)@1
    rightShiftStage0Idx1_uid425_fxpX_uid50_fpArccosXTest_q <= zs_uid142_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage0Idx1Rng8_uid423_fxpX_uid50_fpArccosXTest_b;

    -- fracX_uid7_fpArccosXTest(BITSELECT,6)@0
    fracX_uid7_fpArccosXTest_b <= a(9 downto 0);

    -- redist25_fracX_uid7_fpArccosXTest_b_1(DELAY,536)
    redist25_fracX_uid7_fpArccosXTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid7_fpArccosXTest_b, xout => redist25_fracX_uid7_fpArccosXTest_b_1_q, clk => clk, aclr => areset );

    -- oFracX_uid42_fpArccosXTest(BITJOIN,41)@1
    oFracX_uid42_fpArccosXTest_q <= VCC_q & redist25_fracX_uid7_fpArccosXTest_b_1_q;

    -- cst01pWShift_uid48_fpArccosXTest(CONSTANT,47)
    cst01pWShift_uid48_fpArccosXTest_q <= "0000000";

    -- oFracXExt_uid49_fpArccosXTest(BITJOIN,48)@1
    oFracXExt_uid49_fpArccosXTest_q <= oFracX_uid42_fpArccosXTest_q & cst01pWShift_uid48_fpArccosXTest_q;

    -- rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest(MUX,430)@1
    rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_s <= rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_b;
    rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_combproc: PROCESS (rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_s, oFracXExt_uid49_fpArccosXTest_q, rightShiftStage0Idx1_uid425_fxpX_uid50_fpArccosXTest_q, rightShiftStage0Idx2_uid428_fxpX_uid50_fpArccosXTest_q, rightShiftStage0Idx3_uid429_fxpX_uid50_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q <= oFracXExt_uid49_fpArccosXTest_q;
            WHEN "01" => rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx1_uid425_fxpX_uid50_fpArccosXTest_q;
            WHEN "10" => rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx2_uid428_fxpX_uid50_fpArccosXTest_q;
            WHEN "11" => rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0Idx3_uid429_fxpX_uid50_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest(MUX,441)@1
    rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_s <= rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_c;
    rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_combproc: PROCESS (rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_s, rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q, rightShiftStage1Idx1_uid434_fxpX_uid50_fpArccosXTest_q, rightShiftStage1Idx2_uid437_fxpX_uid50_fpArccosXTest_q, rightShiftStage1Idx3_uid440_fxpX_uid50_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q <= rightShiftStage0_uid431_fxpX_uid50_fpArccosXTest_q;
            WHEN "01" => rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx1_uid434_fxpX_uid50_fpArccosXTest_q;
            WHEN "10" => rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx2_uid437_fxpX_uid50_fpArccosXTest_q;
            WHEN "11" => rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1Idx3_uid440_fxpX_uid50_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftOutVal_uid45_fpArccosXTest(CONSTANT,44)
    shiftOutVal_uid45_fpArccosXTest_q <= "10001";

    -- cstBiasMwFMwShift_uid15_fpArccosXTest(CONSTANT,14)
    cstBiasMwFMwShift_uid15_fpArccosXTest_q <= "111111";

    -- shiftValue_uid43_fpArccosXTest(COMPARE,42)@0
    shiftValue_uid43_fpArccosXTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 6 => cstBiasMwFMwShift_uid15_fpArccosXTest_q(5)) & cstBiasMwFMwShift_uid15_fpArccosXTest_q));
    shiftValue_uid43_fpArccosXTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & expX_uid6_fpArccosXTest_b));
    shiftValue_uid43_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValue_uid43_fpArccosXTest_a) - SIGNED(shiftValue_uid43_fpArccosXTest_b));
    shiftValue_uid43_fpArccosXTest_n(0) <= not (shiftValue_uid43_fpArccosXTest_o(7));

    -- expX_uid6_fpArccosXTest(BITSELECT,5)@0
    expX_uid6_fpArccosXTest_b <= a(14 downto 10);

    -- cstBias_uid13_fpArccosXTest(CONSTANT,12)
    cstBias_uid13_fpArccosXTest_q <= "01111";

    -- shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged(SUB,419)@0 + 1
    shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpArccosXTest_b);
    shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_i <= "0" & shiftOutVal_uid45_fpArccosXTest_q;
    shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (shiftValue_uid43_fpArccosXTest_n = "1") THEN
                shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_o <= shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_i;
            ELSE
                shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_a) - UNSIGNED(shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_b));
            END IF;
        END IF;
    END PROCESS;
    shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_q <= shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_o(4 downto 0);

    -- rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select(BITSELECT,509)@1
    rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_b <= shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_q(4 downto 3);
    rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_c <= shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_q(2 downto 1);
    rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_d <= shiftValuePre_uid44_fpArccosXTest_shiftValue_uid47_fpArccosXTest_merged_q(0 downto 0);

    -- rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest(MUX,446)@1
    rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_s <= rightShiftStageSel4Dto3_uid430_fxpX_uid50_fpArccosXTest_merged_bit_select_d;
    rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_combproc: PROCESS (rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_s, rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q, rightShiftStage2Idx1_uid445_fxpX_uid50_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_s) IS
            WHEN "0" => rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q <= rightShiftStage1_uid442_fxpX_uid50_fpArccosXTest_q;
            WHEN "1" => rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q <= rightShiftStage2Idx1_uid445_fxpX_uid50_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- y_uid52_fpArccosXTest(BITSELECT,51)@1
    y_uid52_fpArccosXTest_in <= rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q(16 downto 0);
    y_uid52_fpArccosXTest_b <= y_uid52_fpArccosXTest_in(16 downto 1);

    -- yAddr_uid101_fpArccosXTest(BITSELECT,100)@1
    yAddr_uid101_fpArccosXTest_b <= y_uid52_fpArccosXTest_b(15 downto 10);

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr(REG,559)
    redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr_q <= "1001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr_q <= STD_LOGIC_VECTOR(redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist17_yAddr_uid101_fpArccosXTest_b_11_mem(DUALMEM,557)
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ia <= STD_LOGIC_VECTOR(yAddr_uid101_fpArccosXTest_b);
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_aa <= redist17_yAddr_uid101_fpArccosXTest_b_11_wraddr_q;
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ab <= redist17_yAddr_uid101_fpArccosXTest_b_11_rdcnt_q;
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_reset0 <= areset;
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 6,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist17_yAddr_uid101_fpArccosXTest_b_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_reset0,
        clock1 => clk,
        address_a => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_aa,
        data_a => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_ab,
        q_b => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_iq
    );
    redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q <= redist17_yAddr_uid101_fpArccosXTest_b_11_mem_iq(5 downto 0);

    -- memoryC1_uid377_arcCosX2Tables(LOOKUP,376)@12
    memoryC1_uid377_arcCosX2Tables_combproc: PROCESS (redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q) IS
            WHEN "000000" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000001" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000010" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000011" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000100" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000101" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000110" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "000111" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001000" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001001" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001010" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001011" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001100" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001101" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001110" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "001111" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010000" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010001" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010010" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010011" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010100" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010101" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010110" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "010111" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011000" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011001" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011010" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011011" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011100" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011101" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011110" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "011111" => memoryC1_uid377_arcCosX2Tables_q <= "1";
            WHEN "100000" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100001" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100010" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100011" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100100" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100101" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100110" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "100111" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101000" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101001" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101010" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101011" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101100" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101101" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101110" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "101111" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110000" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110001" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110010" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110011" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110100" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110101" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110110" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "110111" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111000" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111001" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111010" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111011" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111100" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111101" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111110" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN "111111" => memoryC1_uid377_arcCosX2Tables_q <= "0";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid377_arcCosX2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- memoryC1_uid376_arcCosX2Tables(LOOKUP,375)@12
    memoryC1_uid376_arcCosX2Tables_combproc: PROCESS (redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q) IS
            WHEN "000000" => memoryC1_uid376_arcCosX2Tables_q <= "1000000000";
            WHEN "000001" => memoryC1_uid376_arcCosX2Tables_q <= "1000000000";
            WHEN "000010" => memoryC1_uid376_arcCosX2Tables_q <= "0111111111";
            WHEN "000011" => memoryC1_uid376_arcCosX2Tables_q <= "1000000000";
            WHEN "000100" => memoryC1_uid376_arcCosX2Tables_q <= "0111111110";
            WHEN "000101" => memoryC1_uid376_arcCosX2Tables_q <= "0111111110";
            WHEN "000110" => memoryC1_uid376_arcCosX2Tables_q <= "0111111110";
            WHEN "000111" => memoryC1_uid376_arcCosX2Tables_q <= "0111111100";
            WHEN "001000" => memoryC1_uid376_arcCosX2Tables_q <= "0111111100";
            WHEN "001001" => memoryC1_uid376_arcCosX2Tables_q <= "0111111010";
            WHEN "001010" => memoryC1_uid376_arcCosX2Tables_q <= "0111111001";
            WHEN "001011" => memoryC1_uid376_arcCosX2Tables_q <= "0111110111";
            WHEN "001100" => memoryC1_uid376_arcCosX2Tables_q <= "0111110110";
            WHEN "001101" => memoryC1_uid376_arcCosX2Tables_q <= "0111110101";
            WHEN "001110" => memoryC1_uid376_arcCosX2Tables_q <= "0111110010";
            WHEN "001111" => memoryC1_uid376_arcCosX2Tables_q <= "0111110000";
            WHEN "010000" => memoryC1_uid376_arcCosX2Tables_q <= "0111101110";
            WHEN "010001" => memoryC1_uid376_arcCosX2Tables_q <= "0111101100";
            WHEN "010010" => memoryC1_uid376_arcCosX2Tables_q <= "0111101001";
            WHEN "010011" => memoryC1_uid376_arcCosX2Tables_q <= "0111100111";
            WHEN "010100" => memoryC1_uid376_arcCosX2Tables_q <= "0111100011";
            WHEN "010101" => memoryC1_uid376_arcCosX2Tables_q <= "0111100001";
            WHEN "010110" => memoryC1_uid376_arcCosX2Tables_q <= "0111011100";
            WHEN "010111" => memoryC1_uid376_arcCosX2Tables_q <= "0111011001";
            WHEN "011000" => memoryC1_uid376_arcCosX2Tables_q <= "0111010110";
            WHEN "011001" => memoryC1_uid376_arcCosX2Tables_q <= "0111010010";
            WHEN "011010" => memoryC1_uid376_arcCosX2Tables_q <= "0111001101";
            WHEN "011011" => memoryC1_uid376_arcCosX2Tables_q <= "0111001001";
            WHEN "011100" => memoryC1_uid376_arcCosX2Tables_q <= "0111000101";
            WHEN "011101" => memoryC1_uid376_arcCosX2Tables_q <= "0111000000";
            WHEN "011110" => memoryC1_uid376_arcCosX2Tables_q <= "0110111001";
            WHEN "011111" => memoryC1_uid376_arcCosX2Tables_q <= "0110110100";
            WHEN "100000" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100001" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100010" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100011" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100100" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100101" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100110" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "100111" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101000" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101001" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101010" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101011" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101100" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101101" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101110" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "101111" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110000" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110001" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110010" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110011" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110100" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110101" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110110" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "110111" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111000" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111001" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111010" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111011" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111100" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111101" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111110" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN "111111" => memoryC1_uid376_arcCosX2Tables_q <= "0000000000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid376_arcCosX2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- os_uid378_arcCosX2Tables(BITJOIN,377)@12
    os_uid378_arcCosX2Tables_q <= memoryC1_uid377_arcCosX2Tables_q & memoryC1_uid376_arcCosX2Tables_q;

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_notEnable(LOGICAL,553)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_nor(LOGICAL,554)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_nor_q <= not (redist16_mPPolyEval_uid102_fpArccosXTest_b_11_notEnable_q or redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q);

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_last(CONSTANT,550)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_last_q <= "01000";

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp(LOGICAL,551)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_b <= STD_LOGIC_VECTOR("0" & redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_q);
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_q <= "1" WHEN redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_last_q = redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_b ELSE "0";

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg(REG,552)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg_q <= STD_LOGIC_VECTOR(redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena(REG,555)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_mPPolyEval_uid102_fpArccosXTest_b_11_nor_q = "1") THEN
                redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_mPPolyEval_uid102_fpArccosXTest_b_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_enaAnd(LOGICAL,556)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_enaAnd_q <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_sticky_ena_q and VCC_q;

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt(COUNTER,548)
    -- low=0, high=9, step=1, init=0
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i = TO_UNSIGNED(8, 4)) THEN
                redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq <= '1';
            ELSE
                redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq <= '0';
            END IF;
            IF (redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_eq = '1') THEN
                redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i + 7;
            ELSE
                redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_i, 4)));

    -- mPPolyEval_uid102_fpArccosXTest(BITSELECT,101)@1
    mPPolyEval_uid102_fpArccosXTest_in <= y_uid52_fpArccosXTest_b(9 downto 0);
    mPPolyEval_uid102_fpArccosXTest_b <= mPPolyEval_uid102_fpArccosXTest_in(9 downto 6);

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr(REG,549)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr_q <= "1001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr_q <= STD_LOGIC_VECTOR(redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem(DUALMEM,547)
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ia <= STD_LOGIC_VECTOR(mPPolyEval_uid102_fpArccosXTest_b);
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_aa <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_wraddr_q;
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ab <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_rdcnt_q;
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_reset0 <= areset;
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 4,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 4,
        widthad_b => 4,
        numwords_b => 10,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_reset0,
        clock1 => clk,
        address_a => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_aa,
        data_a => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_ab,
        q_b => redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_iq
    );
    redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_q <= redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_iq(3 downto 0);

    -- prodXY_uid414_pT1_uid383_invPolyEval_cma(CHAINMULTADD,497)@12 + 2
    prodXY_uid414_pT1_uid383_invPolyEval_cma_reset <= areset;
    prodXY_uid414_pT1_uid383_invPolyEval_cma_ena0 <= '1';
    prodXY_uid414_pT1_uid383_invPolyEval_cma_ena1 <= prodXY_uid414_pT1_uid383_invPolyEval_cma_ena0;
    prodXY_uid414_pT1_uid383_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid414_pT1_uid383_invPolyEval_cma_a0(0),5));
    prodXY_uid414_pT1_uid383_invPolyEval_cma_p(0) <= prodXY_uid414_pT1_uid383_invPolyEval_cma_l(0) * prodXY_uid414_pT1_uid383_invPolyEval_cma_c0(0);
    prodXY_uid414_pT1_uid383_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid414_pT1_uid383_invPolyEval_cma_p(0),16);
    prodXY_uid414_pT1_uid383_invPolyEval_cma_w(0) <= prodXY_uid414_pT1_uid383_invPolyEval_cma_u(0);
    prodXY_uid414_pT1_uid383_invPolyEval_cma_x(0) <= prodXY_uid414_pT1_uid383_invPolyEval_cma_w(0);
    prodXY_uid414_pT1_uid383_invPolyEval_cma_y(0) <= prodXY_uid414_pT1_uid383_invPolyEval_cma_x(0);
    prodXY_uid414_pT1_uid383_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid414_pT1_uid383_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid414_pT1_uid383_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid414_pT1_uid383_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid414_pT1_uid383_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist16_mPPolyEval_uid102_fpArccosXTest_b_11_mem_q),4);
                prodXY_uid414_pT1_uid383_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(os_uid378_arcCosX2Tables_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid414_pT1_uid383_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid414_pT1_uid383_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid414_pT1_uid383_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid414_pT1_uid383_invPolyEval_cma_s(0) <= prodXY_uid414_pT1_uid383_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid414_pT1_uid383_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 15, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid414_pT1_uid383_invPolyEval_cma_s(0)(14 downto 0)), xout => prodXY_uid414_pT1_uid383_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid414_pT1_uid383_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid414_pT1_uid383_invPolyEval_cma_qq(14 downto 0));

    -- osig_uid415_pT1_uid383_invPolyEval(BITSELECT,414)@14
    osig_uid415_pT1_uid383_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid414_pT1_uid383_invPolyEval_cma_q(14 downto 2));

    -- highBBits_uid385_invPolyEval(BITSELECT,384)@14
    highBBits_uid385_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid415_pT1_uid383_invPolyEval_b(12 downto 2));

    -- redist18_yAddr_uid101_fpArccosXTest_b_13(DELAY,529)
    redist18_yAddr_uid101_fpArccosXTest_b_13 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist17_yAddr_uid101_fpArccosXTest_b_11_mem_q, xout => redist18_yAddr_uid101_fpArccosXTest_b_13_q, clk => clk, aclr => areset );

    -- memoryC0_uid373_arcCosX2Tables(LOOKUP,372)@14
    memoryC0_uid373_arcCosX2Tables_combproc: PROCESS (redist18_yAddr_uid101_fpArccosXTest_b_13_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist18_yAddr_uid101_fpArccosXTest_b_13_q) IS
            WHEN "000000" => memoryC0_uid373_arcCosX2Tables_q <= "0110010";
            WHEN "000001" => memoryC0_uid373_arcCosX2Tables_q <= "0110001";
            WHEN "000010" => memoryC0_uid373_arcCosX2Tables_q <= "0110001";
            WHEN "000011" => memoryC0_uid373_arcCosX2Tables_q <= "0110000";
            WHEN "000100" => memoryC0_uid373_arcCosX2Tables_q <= "0110000";
            WHEN "000101" => memoryC0_uid373_arcCosX2Tables_q <= "0101111";
            WHEN "000110" => memoryC0_uid373_arcCosX2Tables_q <= "0101111";
            WHEN "000111" => memoryC0_uid373_arcCosX2Tables_q <= "0101110";
            WHEN "001000" => memoryC0_uid373_arcCosX2Tables_q <= "0101110";
            WHEN "001001" => memoryC0_uid373_arcCosX2Tables_q <= "0101101";
            WHEN "001010" => memoryC0_uid373_arcCosX2Tables_q <= "0101101";
            WHEN "001011" => memoryC0_uid373_arcCosX2Tables_q <= "0101100";
            WHEN "001100" => memoryC0_uid373_arcCosX2Tables_q <= "0101100";
            WHEN "001101" => memoryC0_uid373_arcCosX2Tables_q <= "0101011";
            WHEN "001110" => memoryC0_uid373_arcCosX2Tables_q <= "0101011";
            WHEN "001111" => memoryC0_uid373_arcCosX2Tables_q <= "0101010";
            WHEN "010000" => memoryC0_uid373_arcCosX2Tables_q <= "0101010";
            WHEN "010001" => memoryC0_uid373_arcCosX2Tables_q <= "0101001";
            WHEN "010010" => memoryC0_uid373_arcCosX2Tables_q <= "0101001";
            WHEN "010011" => memoryC0_uid373_arcCosX2Tables_q <= "0101000";
            WHEN "010100" => memoryC0_uid373_arcCosX2Tables_q <= "0101000";
            WHEN "010101" => memoryC0_uid373_arcCosX2Tables_q <= "0100111";
            WHEN "010110" => memoryC0_uid373_arcCosX2Tables_q <= "0100111";
            WHEN "010111" => memoryC0_uid373_arcCosX2Tables_q <= "0100110";
            WHEN "011000" => memoryC0_uid373_arcCosX2Tables_q <= "0100101";
            WHEN "011001" => memoryC0_uid373_arcCosX2Tables_q <= "0100101";
            WHEN "011010" => memoryC0_uid373_arcCosX2Tables_q <= "0100100";
            WHEN "011011" => memoryC0_uid373_arcCosX2Tables_q <= "0100100";
            WHEN "011100" => memoryC0_uid373_arcCosX2Tables_q <= "0100011";
            WHEN "011101" => memoryC0_uid373_arcCosX2Tables_q <= "0100011";
            WHEN "011110" => memoryC0_uid373_arcCosX2Tables_q <= "0100010";
            WHEN "011111" => memoryC0_uid373_arcCosX2Tables_q <= "0100010";
            WHEN "100000" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100001" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100010" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100011" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100100" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100101" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100110" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "100111" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101000" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101001" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101010" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101011" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101100" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101101" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101110" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "101111" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110000" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110001" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110010" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110011" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110100" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110101" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110110" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "110111" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111000" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111001" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111010" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111011" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111100" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111101" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111110" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN "111111" => memoryC0_uid373_arcCosX2Tables_q <= "0000000";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid373_arcCosX2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- memoryC0_uid372_arcCosX2Tables(LOOKUP,371)@14
    memoryC0_uid372_arcCosX2Tables_combproc: PROCESS (redist18_yAddr_uid101_fpArccosXTest_b_13_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist18_yAddr_uid101_fpArccosXTest_b_13_q) IS
            WHEN "000000" => memoryC0_uid372_arcCosX2Tables_q <= "0100010100";
            WHEN "000001" => memoryC0_uid372_arcCosX2Tables_q <= "1100010100";
            WHEN "000010" => memoryC0_uid372_arcCosX2Tables_q <= "0100010100";
            WHEN "000011" => memoryC0_uid372_arcCosX2Tables_q <= "1100010011";
            WHEN "000100" => memoryC0_uid372_arcCosX2Tables_q <= "0100010011";
            WHEN "000101" => memoryC0_uid372_arcCosX2Tables_q <= "1100010001";
            WHEN "000110" => memoryC0_uid372_arcCosX2Tables_q <= "0100001111";
            WHEN "000111" => memoryC0_uid372_arcCosX2Tables_q <= "1100001101";
            WHEN "001000" => memoryC0_uid372_arcCosX2Tables_q <= "0100001001";
            WHEN "001001" => memoryC0_uid372_arcCosX2Tables_q <= "1100000101";
            WHEN "001010" => memoryC0_uid372_arcCosX2Tables_q <= "0011111111";
            WHEN "001011" => memoryC0_uid372_arcCosX2Tables_q <= "1011111000";
            WHEN "001100" => memoryC0_uid372_arcCosX2Tables_q <= "0011101111";
            WHEN "001101" => memoryC0_uid372_arcCosX2Tables_q <= "1011100101";
            WHEN "001110" => memoryC0_uid372_arcCosX2Tables_q <= "0011011010";
            WHEN "001111" => memoryC0_uid372_arcCosX2Tables_q <= "1011001100";
            WHEN "010000" => memoryC0_uid372_arcCosX2Tables_q <= "0010111100";
            WHEN "010001" => memoryC0_uid372_arcCosX2Tables_q <= "1010101010";
            WHEN "010010" => memoryC0_uid372_arcCosX2Tables_q <= "0010010110";
            WHEN "010011" => memoryC0_uid372_arcCosX2Tables_q <= "1001111111";
            WHEN "010100" => memoryC0_uid372_arcCosX2Tables_q <= "0001100110";
            WHEN "010101" => memoryC0_uid372_arcCosX2Tables_q <= "1001001001";
            WHEN "010110" => memoryC0_uid372_arcCosX2Tables_q <= "0000101010";
            WHEN "010111" => memoryC0_uid372_arcCosX2Tables_q <= "1000000111";
            WHEN "011000" => memoryC0_uid372_arcCosX2Tables_q <= "1111100000";
            WHEN "011001" => memoryC0_uid372_arcCosX2Tables_q <= "0110110110";
            WHEN "011010" => memoryC0_uid372_arcCosX2Tables_q <= "1110001000";
            WHEN "011011" => memoryC0_uid372_arcCosX2Tables_q <= "0101010101";
            WHEN "011100" => memoryC0_uid372_arcCosX2Tables_q <= "1100011110";
            WHEN "011101" => memoryC0_uid372_arcCosX2Tables_q <= "0011100010";
            WHEN "011110" => memoryC0_uid372_arcCosX2Tables_q <= "1010100010";
            WHEN "011111" => memoryC0_uid372_arcCosX2Tables_q <= "0001011011";
            WHEN "100000" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100001" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100010" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100011" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100100" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100101" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100110" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "100111" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101000" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101001" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101010" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101011" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101100" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101101" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101110" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "101111" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110000" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110001" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110010" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110011" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110100" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110101" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110110" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "110111" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111000" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111001" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111010" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111011" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111100" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111101" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111110" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN "111111" => memoryC0_uid372_arcCosX2Tables_q <= "0000000100";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid372_arcCosX2Tables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- os_uid374_arcCosX2Tables(BITJOIN,373)@14
    os_uid374_arcCosX2Tables_q <= memoryC0_uid373_arcCosX2Tables_q & memoryC0_uid372_arcCosX2Tables_q;

    -- s1sumAHighB_uid386_invPolyEval(ADD,385)@14
    s1sumAHighB_uid386_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => os_uid374_arcCosX2Tables_q(16)) & os_uid374_arcCosX2Tables_q));
    s1sumAHighB_uid386_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 11 => highBBits_uid385_invPolyEval_b(10)) & highBBits_uid385_invPolyEval_b));
    s1sumAHighB_uid386_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid386_invPolyEval_a) + SIGNED(s1sumAHighB_uid386_invPolyEval_b));
    s1sumAHighB_uid386_invPolyEval_q <= s1sumAHighB_uid386_invPolyEval_o(17 downto 0);

    -- lowRangeB_uid384_invPolyEval(BITSELECT,383)@14
    lowRangeB_uid384_invPolyEval_in <= osig_uid415_pT1_uid383_invPolyEval_b(1 downto 0);
    lowRangeB_uid384_invPolyEval_b <= lowRangeB_uid384_invPolyEval_in(1 downto 0);

    -- s1_uid387_invPolyEval(BITJOIN,386)@14
    s1_uid387_invPolyEval_q <= s1sumAHighB_uid386_invPolyEval_q & lowRangeB_uid384_invPolyEval_b;

    -- fxpArccosX_uid104_fpArccosXTest(BITSELECT,103)@14
    fxpArccosX_uid104_fpArccosXTest_in <= s1_uid387_invPolyEval_q(17 downto 0);
    fxpArccosX_uid104_fpArccosXTest_b <= fxpArccosX_uid104_fpArccosXTest_in(17 downto 4);

    -- pi2_uid105_fpArccosXTest(CONSTANT,104)
    pi2_uid105_fpArccosXTest_q <= "11001001000100";

    -- aPostPad_uid107_fpArccosXTest(BITJOIN,106)@14
    aPostPad_uid107_fpArccosXTest_q <= pi2_uid105_fpArccosXTest_q & GND_q;

    -- path2Diff_uid108_fpArccosXTest(SUB,107)@14
    path2Diff_uid108_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid107_fpArccosXTest_q);
    path2Diff_uid108_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & fxpArccosX_uid104_fpArccosXTest_b);
    path2Diff_uid108_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid108_fpArccosXTest_a) - UNSIGNED(path2Diff_uid108_fpArccosXTest_b));
    path2Diff_uid108_fpArccosXTest_q <= path2Diff_uid108_fpArccosXTest_o(15 downto 0);

    -- path2NegCaseFPFrac_uid110_fpArccosXTest(BITSELECT,109)@14
    path2NegCaseFPFrac_uid110_fpArccosXTest_in <= path2Diff_uid108_fpArccosXTest_q(13 downto 0);
    path2NegCaseFPFrac_uid110_fpArccosXTest_b <= path2NegCaseFPFrac_uid110_fpArccosXTest_in(13 downto 4);

    -- path2NegCaseFPL_uid111_fpArccosXTest(BITJOIN,110)@14
    path2NegCaseFPL_uid111_fpArccosXTest_q <= GND_q & cstBiasP1_uid17_fpArccosXTest_q & path2NegCaseFPFrac_uid110_fpArccosXTest_b;

    -- path2NegCaseFPFrac_uid112_fpArccosXTest(BITSELECT,111)@14
    path2NegCaseFPFrac_uid112_fpArccosXTest_in <= path2Diff_uid108_fpArccosXTest_q(12 downto 0);
    path2NegCaseFPFrac_uid112_fpArccosXTest_b <= path2NegCaseFPFrac_uid112_fpArccosXTest_in(12 downto 3);

    -- path2NegCaseFPS_uid113_fpArccosXTest(BITJOIN,112)@14
    path2NegCaseFPS_uid113_fpArccosXTest_q <= GND_q & cstBias_uid13_fpArccosXTest_q & path2NegCaseFPFrac_uid112_fpArccosXTest_b;

    -- normBit_uid109_fpArccosXTest(BITSELECT,108)@14
    normBit_uid109_fpArccosXTest_in <= STD_LOGIC_VECTOR(path2Diff_uid108_fpArccosXTest_q(14 downto 0));
    normBit_uid109_fpArccosXTest_b <= STD_LOGIC_VECTOR(normBit_uid109_fpArccosXTest_in(14 downto 14));

    -- path2NegCaseFP_uid114_fpArccosXTest(MUX,113)@14
    path2NegCaseFP_uid114_fpArccosXTest_s <= normBit_uid109_fpArccosXTest_b;
    path2NegCaseFP_uid114_fpArccosXTest_combproc: PROCESS (path2NegCaseFP_uid114_fpArccosXTest_s, path2NegCaseFPS_uid113_fpArccosXTest_q, path2NegCaseFPL_uid111_fpArccosXTest_q)
    BEGIN
        CASE (path2NegCaseFP_uid114_fpArccosXTest_s) IS
            WHEN "0" => path2NegCaseFP_uid114_fpArccosXTest_q <= path2NegCaseFPS_uid113_fpArccosXTest_q;
            WHEN "1" => path2NegCaseFP_uid114_fpArccosXTest_q <= path2NegCaseFPL_uid111_fpArccosXTest_q;
            WHEN OTHERS => path2NegCaseFP_uid114_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path2PosCaseFPFraction_uid115_fpArccosXTest(BITSELECT,114)@14
    path2PosCaseFPFraction_uid115_fpArccosXTest_in <= fxpArccosX_uid104_fpArccosXTest_b(12 downto 0);
    path2PosCaseFPFraction_uid115_fpArccosXTest_b <= path2PosCaseFPFraction_uid115_fpArccosXTest_in(12 downto 3);

    -- path2PosCaseFP_uid116_fpArccosXTest(BITJOIN,115)@14
    path2PosCaseFP_uid116_fpArccosXTest_q <= GND_q & cstBias_uid13_fpArccosXTest_q & path2PosCaseFPFraction_uid115_fpArccosXTest_b;

    -- singX_uid8_fpArccosXTest(BITSELECT,7)@0
    singX_uid8_fpArccosXTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- redist24_singX_uid8_fpArccosXTest_b_14(DELAY,535)
    redist24_singX_uid8_fpArccosXTest_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid8_fpArccosXTest_b, xout => redist24_singX_uid8_fpArccosXTest_b_14_q, clk => clk, aclr => areset );

    -- path2ResFP_uid117_fpArccosXTest(MUX,116)@14
    path2ResFP_uid117_fpArccosXTest_s <= redist24_singX_uid8_fpArccosXTest_b_14_q;
    path2ResFP_uid117_fpArccosXTest_combproc: PROCESS (path2ResFP_uid117_fpArccosXTest_s, path2PosCaseFP_uid116_fpArccosXTest_q, path2NegCaseFP_uid114_fpArccosXTest_q)
    BEGIN
        CASE (path2ResFP_uid117_fpArccosXTest_s) IS
            WHEN "0" => path2ResFP_uid117_fpArccosXTest_q <= path2PosCaseFP_uid116_fpArccosXTest_q;
            WHEN "1" => path2ResFP_uid117_fpArccosXTest_q <= path2NegCaseFP_uid114_fpArccosXTest_q;
            WHEN OTHERS => path2ResFP_uid117_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select(BITSELECT,502)@14
    fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_in <= path2ResFP_uid117_fpArccosXTest_q(14 downto 0);
    fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_b <= fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_in(9 downto 0);
    fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_c <= fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_in(14 downto 10);

    -- rightShiftStage1Idx3Rng3_uid489_alignArcsinL_uid85_fpArccosXTest(BITSELECT,488)@14
    rightShiftStage1Idx3Rng3_uid489_alignArcsinL_uid85_fpArccosXTest_b <= rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q(10 downto 3);

    -- rightShiftStage1Idx3_uid491_alignArcsinL_uid85_fpArccosXTest(BITJOIN,490)@14
    rightShiftStage1Idx3_uid491_alignArcsinL_uid85_fpArccosXTest_q <= padBCst_uid88_fpArccosXTest_q & rightShiftStage1Idx3Rng3_uid489_alignArcsinL_uid85_fpArccosXTest_b;

    -- rightShiftStage1Idx2Rng2_uid486_alignArcsinL_uid85_fpArccosXTest(BITSELECT,485)@14
    rightShiftStage1Idx2Rng2_uid486_alignArcsinL_uid85_fpArccosXTest_b <= rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q(10 downto 2);

    -- rightShiftStage1Idx2_uid488_alignArcsinL_uid85_fpArccosXTest(BITJOIN,487)@14
    rightShiftStage1Idx2_uid488_alignArcsinL_uid85_fpArccosXTest_q <= zs_uid156_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage1Idx2Rng2_uid486_alignArcsinL_uid85_fpArccosXTest_b;

    -- rightShiftStage1Idx1Rng1_uid483_alignArcsinL_uid85_fpArccosXTest(BITSELECT,482)@14
    rightShiftStage1Idx1Rng1_uid483_alignArcsinL_uid85_fpArccosXTest_b <= rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q(10 downto 1);

    -- rightShiftStage1Idx1_uid485_alignArcsinL_uid85_fpArccosXTest(BITJOIN,484)@14
    rightShiftStage1Idx1_uid485_alignArcsinL_uid85_fpArccosXTest_q <= GND_q & rightShiftStage1Idx1Rng1_uid483_alignArcsinL_uid85_fpArccosXTest_b;

    -- rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest(CONSTANT,456)
    rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q <= "00000000000";

    -- rightShiftStage0Idx2Rng8_uid477_alignArcsinL_uid85_fpArccosXTest(BITSELECT,476)@14
    rightShiftStage0Idx2Rng8_uid477_alignArcsinL_uid85_fpArccosXTest_b <= oFracArcsinL_uid81_fpArccosXTest_q(10 downto 8);

    -- rightShiftStage0Idx2_uid479_alignArcsinL_uid85_fpArccosXTest(BITJOIN,478)@14
    rightShiftStage0Idx2_uid479_alignArcsinL_uid85_fpArccosXTest_q <= zs_uid142_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage0Idx2Rng8_uid477_alignArcsinL_uid85_fpArccosXTest_b;

    -- rightShiftStage0Idx1Rng4_uid474_alignArcsinL_uid85_fpArccosXTest(BITSELECT,473)@14
    rightShiftStage0Idx1Rng4_uid474_alignArcsinL_uid85_fpArccosXTest_b <= oFracArcsinL_uid81_fpArccosXTest_q(10 downto 4);

    -- rightShiftStage0Idx1_uid476_alignArcsinL_uid85_fpArccosXTest(BITJOIN,475)@14
    rightShiftStage0Idx1_uid476_alignArcsinL_uid85_fpArccosXTest_q <= zs_uid149_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage0Idx1Rng4_uid474_alignArcsinL_uid85_fpArccosXTest_b;

    -- fracArcsinL_uid80_fpArccosXTest_merged_bit_select(BITSELECT,508)@14
    fracArcsinL_uid80_fpArccosXTest_merged_bit_select_in <= R_uid370_arcsinL_uid79_fpArccosXTest_q(14 downto 0);
    fracArcsinL_uid80_fpArccosXTest_merged_bit_select_b <= fracArcsinL_uid80_fpArccosXTest_merged_bit_select_in(9 downto 0);
    fracArcsinL_uid80_fpArccosXTest_merged_bit_select_c <= fracArcsinL_uid80_fpArccosXTest_merged_bit_select_in(14 downto 10);

    -- oFracArcsinL_uid81_fpArccosXTest(BITJOIN,80)@14
    oFracArcsinL_uid81_fpArccosXTest_q <= VCC_q & fracArcsinL_uid80_fpArccosXTest_merged_bit_select_b;

    -- rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest(MUX,481)@14
    rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_s <= rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_b;
    rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_combproc: PROCESS (rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_s, oFracArcsinL_uid81_fpArccosXTest_q, rightShiftStage0Idx1_uid476_alignArcsinL_uid85_fpArccosXTest_q, rightShiftStage0Idx2_uid479_alignArcsinL_uid85_fpArccosXTest_q, rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q <= oFracArcsinL_uid81_fpArccosXTest_q;
            WHEN "01" => rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage0Idx1_uid476_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN "10" => rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage0Idx2_uid479_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN "11" => rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- srValArcsinL_uid83_fpArccosXTest(SUB,82)@14
    srValArcsinL_uid83_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    srValArcsinL_uid83_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & fracArcsinL_uid80_fpArccosXTest_merged_bit_select_c);
    srValArcsinL_uid83_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srValArcsinL_uid83_fpArccosXTest_a) - UNSIGNED(srValArcsinL_uid83_fpArccosXTest_b));
    srValArcsinL_uid83_fpArccosXTest_q <= srValArcsinL_uid83_fpArccosXTest_o(5 downto 0);

    -- srValArcsinLRange_uid84_fpArccosXTest(BITSELECT,83)@14
    srValArcsinLRange_uid84_fpArccosXTest_in <= srValArcsinL_uid83_fpArccosXTest_q(3 downto 0);
    srValArcsinLRange_uid84_fpArccosXTest_b <= srValArcsinLRange_uid84_fpArccosXTest_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select(BITSELECT,500)@14
    rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_b <= srValArcsinLRange_uid84_fpArccosXTest_b(3 downto 2);
    rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_c <= srValArcsinLRange_uid84_fpArccosXTest_b(1 downto 0);

    -- rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest(MUX,492)@14
    rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_s <= rightShiftStageSel3Dto2_uid481_alignArcsinL_uid85_fpArccosXTest_merged_bit_select_c;
    rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_combproc: PROCESS (rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_s, rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q, rightShiftStage1Idx1_uid485_alignArcsinL_uid85_fpArccosXTest_q, rightShiftStage1Idx2_uid488_alignArcsinL_uid85_fpArccosXTest_q, rightShiftStage1Idx3_uid491_alignArcsinL_uid85_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage0_uid482_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN "01" => rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage1Idx1_uid485_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN "10" => rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage1Idx2_uid488_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN "11" => rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q <= rightShiftStage1Idx3_uid491_alignArcsinL_uid85_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- padBCst_uid88_fpArccosXTest(CONSTANT,87)
    padBCst_uid88_fpArccosXTest_q <= "000";

    -- bPostPad_uid89_fpArccosXTest(BITJOIN,88)@14
    bPostPad_uid89_fpArccosXTest_q <= rightShiftStage1_uid493_alignArcsinL_uid85_fpArccosXTest_q & padBCst_uid88_fpArccosXTest_q;

    -- pi_uid87_fpArccosXTest(CONSTANT,86)
    pi_uid87_fpArccosXTest_q <= "110010010001000";

    -- path1NegCase_uid90_fpArccosXTest(SUB,89)@14
    path1NegCase_uid90_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & pi_uid87_fpArccosXTest_q);
    path1NegCase_uid90_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & bPostPad_uid89_fpArccosXTest_q);
    path1NegCase_uid90_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCase_uid90_fpArccosXTest_a) - UNSIGNED(path1NegCase_uid90_fpArccosXTest_b));
    path1NegCase_uid90_fpArccosXTest_q <= path1NegCase_uid90_fpArccosXTest_o(15 downto 0);

    -- path1NegCaseN_uid91_fpArccosXTest(BITSELECT,90)@14
    path1NegCaseN_uid91_fpArccosXTest_in <= STD_LOGIC_VECTOR(path1NegCase_uid90_fpArccosXTest_q(14 downto 0));
    path1NegCaseN_uid91_fpArccosXTest_b <= STD_LOGIC_VECTOR(path1NegCaseN_uid91_fpArccosXTest_in(14 downto 14));

    -- path1NegCaseExp_uid95_fpArccosXTest(ADD,94)@14
    path1NegCaseExp_uid95_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    path1NegCaseExp_uid95_fpArccosXTest_b <= STD_LOGIC_VECTOR("00000" & path1NegCaseN_uid91_fpArccosXTest_b);
    path1NegCaseExp_uid95_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path1NegCaseExp_uid95_fpArccosXTest_a) + UNSIGNED(path1NegCaseExp_uid95_fpArccosXTest_b));
    path1NegCaseExp_uid95_fpArccosXTest_q <= path1NegCaseExp_uid95_fpArccosXTest_o(5 downto 0);

    -- path1NegCaseExpRange_uid96_fpArccosXTest(BITSELECT,95)@14
    path1NegCaseExpRange_uid96_fpArccosXTest_in <= path1NegCaseExp_uid95_fpArccosXTest_q(4 downto 0);
    path1NegCaseExpRange_uid96_fpArccosXTest_b <= path1NegCaseExpRange_uid96_fpArccosXTest_in(4 downto 0);

    -- path1NegCaseFracHigh_uid92_fpArccosXTest(BITSELECT,91)@14
    path1NegCaseFracHigh_uid92_fpArccosXTest_in <= path1NegCase_uid90_fpArccosXTest_q(13 downto 0);
    path1NegCaseFracHigh_uid92_fpArccosXTest_b <= path1NegCaseFracHigh_uid92_fpArccosXTest_in(13 downto 4);

    -- path1NegCaseFracLow_uid93_fpArccosXTest(BITSELECT,92)@14
    path1NegCaseFracLow_uid93_fpArccosXTest_in <= path1NegCase_uid90_fpArccosXTest_q(12 downto 0);
    path1NegCaseFracLow_uid93_fpArccosXTest_b <= path1NegCaseFracLow_uid93_fpArccosXTest_in(12 downto 3);

    -- path1NegCaseFrac_uid94_fpArccosXTest(MUX,93)@14
    path1NegCaseFrac_uid94_fpArccosXTest_s <= path1NegCaseN_uid91_fpArccosXTest_b;
    path1NegCaseFrac_uid94_fpArccosXTest_combproc: PROCESS (path1NegCaseFrac_uid94_fpArccosXTest_s, path1NegCaseFracLow_uid93_fpArccosXTest_b, path1NegCaseFracHigh_uid92_fpArccosXTest_b)
    BEGIN
        CASE (path1NegCaseFrac_uid94_fpArccosXTest_s) IS
            WHEN "0" => path1NegCaseFrac_uid94_fpArccosXTest_q <= path1NegCaseFracLow_uid93_fpArccosXTest_b;
            WHEN "1" => path1NegCaseFrac_uid94_fpArccosXTest_q <= path1NegCaseFracHigh_uid92_fpArccosXTest_b;
            WHEN OTHERS => path1NegCaseFrac_uid94_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path1NegCaseUR_uid97_fpArccosXTest(BITJOIN,96)@14
    path1NegCaseUR_uid97_fpArccosXTest_q <= GND_q & path1NegCaseExpRange_uid96_fpArccosXTest_b & path1NegCaseFrac_uid94_fpArccosXTest_q;

    -- aPostPad_uid55_fpArccosXTest(BITJOIN,54)@1
    aPostPad_uid55_fpArccosXTest_q <= VCC_q & padACst_uid54_fpArccosXTest_q;

    -- oMy_uid56_fpArccosXTest(SUB,55)@1
    oMy_uid56_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid55_fpArccosXTest_q);
    oMy_uid56_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & y_uid52_fpArccosXTest_b);
    oMy_uid56_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMy_uid56_fpArccosXTest_a) - UNSIGNED(oMy_uid56_fpArccosXTest_b));
    oMy_uid56_fpArccosXTest_q <= oMy_uid56_fpArccosXTest_o(17 downto 0);

    -- l_uid57_fpArccosXTest(BITSELECT,56)@1
    l_uid57_fpArccosXTest_in <= oMy_uid56_fpArccosXTest_q(15 downto 0);
    l_uid57_fpArccosXTest_b <= l_uid57_fpArccosXTest_in(15 downto 0);

    -- vCount_uid139_fpLOut1_uid58_fpArccosXTest(LOGICAL,138)@1 + 1
    vCount_uid139_fpLOut1_uid58_fpArccosXTest_qi <= "1" WHEN l_uid57_fpArccosXTest_b = padACst_uid54_fpArccosXTest_q ELSE "0";
    vCount_uid139_fpLOut1_uid58_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid139_fpLOut1_uid58_fpArccosXTest_qi, xout => vCount_uid139_fpLOut1_uid58_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist21_l_uid57_fpArccosXTest_b_1(DELAY,532)
    redist21_l_uid57_fpArccosXTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => l_uid57_fpArccosXTest_b, xout => redist21_l_uid57_fpArccosXTest_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid141_fpLOut1_uid58_fpArccosXTest(MUX,140)@2
    vStagei_uid141_fpLOut1_uid58_fpArccosXTest_s <= vCount_uid139_fpLOut1_uid58_fpArccosXTest_q;
    vStagei_uid141_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vStagei_uid141_fpLOut1_uid58_fpArccosXTest_s, redist21_l_uid57_fpArccosXTest_b_1_q, padACst_uid54_fpArccosXTest_q)
    BEGIN
        CASE (vStagei_uid141_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q <= redist21_l_uid57_fpArccosXTest_b_1_q;
            WHEN "1" => vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q <= padACst_uid54_fpArccosXTest_q;
            WHEN OTHERS => vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select(BITSELECT,503)@2
    rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b <= vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q(15 downto 8);
    rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c <= vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q(7 downto 0);

    -- vCount_uid144_fpLOut1_uid58_fpArccosXTest(LOGICAL,143)@2
    vCount_uid144_fpLOut1_uid58_fpArccosXTest_q <= "1" WHEN rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b = zs_uid142_fpLOut1_uid58_fpArccosXTest_q ELSE "0";

    -- cStage_uid147_fpLOut1_uid58_fpArccosXTest(BITJOIN,146)@2
    cStage_uid147_fpLOut1_uid58_fpArccosXTest_q <= rVStage_uid143_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c & zs_uid142_fpLOut1_uid58_fpArccosXTest_q;

    -- vStagei_uid148_fpLOut1_uid58_fpArccosXTest(MUX,147)@2
    vStagei_uid148_fpLOut1_uid58_fpArccosXTest_s <= vCount_uid144_fpLOut1_uid58_fpArccosXTest_q;
    vStagei_uid148_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vStagei_uid148_fpLOut1_uid58_fpArccosXTest_s, vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q, cStage_uid147_fpLOut1_uid58_fpArccosXTest_q)
    BEGIN
        CASE (vStagei_uid148_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q <= vStagei_uid141_fpLOut1_uid58_fpArccosXTest_q;
            WHEN "1" => vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q <= cStage_uid147_fpLOut1_uid58_fpArccosXTest_q;
            WHEN OTHERS => vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select(BITSELECT,504)@2
    rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b <= vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q(15 downto 12);
    rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c <= vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q(11 downto 0);

    -- vCount_uid151_fpLOut1_uid58_fpArccosXTest(LOGICAL,150)@2
    vCount_uid151_fpLOut1_uid58_fpArccosXTest_q <= "1" WHEN rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b = zs_uid149_fpLOut1_uid58_fpArccosXTest_q ELSE "0";

    -- cStage_uid154_fpLOut1_uid58_fpArccosXTest(BITJOIN,153)@2
    cStage_uid154_fpLOut1_uid58_fpArccosXTest_q <= rVStage_uid150_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c & zs_uid149_fpLOut1_uid58_fpArccosXTest_q;

    -- vStagei_uid155_fpLOut1_uid58_fpArccosXTest(MUX,154)@2
    vStagei_uid155_fpLOut1_uid58_fpArccosXTest_s <= vCount_uid151_fpLOut1_uid58_fpArccosXTest_q;
    vStagei_uid155_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vStagei_uid155_fpLOut1_uid58_fpArccosXTest_s, vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q, cStage_uid154_fpLOut1_uid58_fpArccosXTest_q)
    BEGIN
        CASE (vStagei_uid155_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q <= vStagei_uid148_fpLOut1_uid58_fpArccosXTest_q;
            WHEN "1" => vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q <= cStage_uid154_fpLOut1_uid58_fpArccosXTest_q;
            WHEN OTHERS => vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select(BITSELECT,505)@2
    rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b <= vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q(15 downto 14);
    rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c <= vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q(13 downto 0);

    -- vCount_uid158_fpLOut1_uid58_fpArccosXTest(LOGICAL,157)@2
    vCount_uid158_fpLOut1_uid58_fpArccosXTest_q <= "1" WHEN rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b = zs_uid156_fpLOut1_uid58_fpArccosXTest_q ELSE "0";

    -- cStage_uid161_fpLOut1_uid58_fpArccosXTest(BITJOIN,160)@2
    cStage_uid161_fpLOut1_uid58_fpArccosXTest_q <= rVStage_uid157_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c & zs_uid156_fpLOut1_uid58_fpArccosXTest_q;

    -- vStagei_uid162_fpLOut1_uid58_fpArccosXTest(MUX,161)@2
    vStagei_uid162_fpLOut1_uid58_fpArccosXTest_s <= vCount_uid158_fpLOut1_uid58_fpArccosXTest_q;
    vStagei_uid162_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vStagei_uid162_fpLOut1_uid58_fpArccosXTest_s, vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q, cStage_uid161_fpLOut1_uid58_fpArccosXTest_q)
    BEGIN
        CASE (vStagei_uid162_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q <= vStagei_uid155_fpLOut1_uid58_fpArccosXTest_q;
            WHEN "1" => vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q <= cStage_uid161_fpLOut1_uid58_fpArccosXTest_q;
            WHEN OTHERS => vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select(BITSELECT,506)@2
    rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b <= vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q(15 downto 15);
    rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c <= vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q(14 downto 0);

    -- vCount_uid165_fpLOut1_uid58_fpArccosXTest(LOGICAL,164)@2
    vCount_uid165_fpLOut1_uid58_fpArccosXTest_q <= "1" WHEN rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_b = GND_q ELSE "0";

    -- vCount_uid170_fpLOut1_uid58_fpArccosXTest(BITJOIN,169)@2
    vCount_uid170_fpLOut1_uid58_fpArccosXTest_q <= vCount_uid139_fpLOut1_uid58_fpArccosXTest_q & vCount_uid144_fpLOut1_uid58_fpArccosXTest_q & vCount_uid151_fpLOut1_uid58_fpArccosXTest_q & vCount_uid158_fpLOut1_uid58_fpArccosXTest_q & vCount_uid165_fpLOut1_uid58_fpArccosXTest_q;

    -- vCountBig_uid172_fpLOut1_uid58_fpArccosXTest(COMPARE,171)@2
    vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_a <= STD_LOGIC_VECTOR("00" & cstBiasP1_uid17_fpArccosXTest_q);
    vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & vCount_uid170_fpLOut1_uid58_fpArccosXTest_q);
    vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_a) - UNSIGNED(vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_b));
    vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_c(0) <= vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_o(6);

    -- vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest(MUX,173)@2
    vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_s <= vCountBig_uid172_fpLOut1_uid58_fpArccosXTest_c;
    vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_s, vCount_uid170_fpLOut1_uid58_fpArccosXTest_q, cstBiasP1_uid17_fpArccosXTest_q)
    BEGIN
        CASE (vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_q <= vCount_uid170_fpLOut1_uid58_fpArccosXTest_q;
            WHEN "1" => vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_q <= cstBiasP1_uid17_fpArccosXTest_q;
            WHEN OTHERS => vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstBiasM2_uid16_fpArccosXTest(CONSTANT,15)
    cstBiasM2_uid16_fpArccosXTest_q <= "01101";

    -- expL_uid59_fpArccosXTest(SUB,58)@2
    expL_uid59_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM2_uid16_fpArccosXTest_q);
    expL_uid59_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & vCountFinal_uid174_fpLOut1_uid58_fpArccosXTest_q);
    expL_uid59_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expL_uid59_fpArccosXTest_a) - UNSIGNED(expL_uid59_fpArccosXTest_b));
    expL_uid59_fpArccosXTest_q <= expL_uid59_fpArccosXTest_o(5 downto 0);

    -- expLRange_uid61_fpArccosXTest(BITSELECT,60)@2
    expLRange_uid61_fpArccosXTest_in <= expL_uid59_fpArccosXTest_q(4 downto 0);
    expLRange_uid61_fpArccosXTest_b <= expLRange_uid61_fpArccosXTest_in(4 downto 0);

    -- cStage_uid168_fpLOut1_uid58_fpArccosXTest(BITJOIN,167)@2
    cStage_uid168_fpLOut1_uid58_fpArccosXTest_q <= rVStage_uid164_fpLOut1_uid58_fpArccosXTest_merged_bit_select_c & GND_q;

    -- vStagei_uid169_fpLOut1_uid58_fpArccosXTest(MUX,168)@2
    vStagei_uid169_fpLOut1_uid58_fpArccosXTest_s <= vCount_uid165_fpLOut1_uid58_fpArccosXTest_q;
    vStagei_uid169_fpLOut1_uid58_fpArccosXTest_combproc: PROCESS (vStagei_uid169_fpLOut1_uid58_fpArccosXTest_s, vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q, cStage_uid168_fpLOut1_uid58_fpArccosXTest_q)
    BEGIN
        CASE (vStagei_uid169_fpLOut1_uid58_fpArccosXTest_s) IS
            WHEN "0" => vStagei_uid169_fpLOut1_uid58_fpArccosXTest_q <= vStagei_uid162_fpLOut1_uid58_fpArccosXTest_q;
            WHEN "1" => vStagei_uid169_fpLOut1_uid58_fpArccosXTest_q <= cStage_uid168_fpLOut1_uid58_fpArccosXTest_q;
            WHEN OTHERS => vStagei_uid169_fpLOut1_uid58_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fpLOutFrac_uid60_fpArccosXTest(BITSELECT,59)@2
    fpLOutFrac_uid60_fpArccosXTest_in <= vStagei_uid169_fpLOut1_uid58_fpArccosXTest_q(14 downto 0);
    fpLOutFrac_uid60_fpArccosXTest_b <= fpLOutFrac_uid60_fpArccosXTest_in(14 downto 5);

    -- fpL_uid62_fpArccosXTest(BITJOIN,61)@2
    fpL_uid62_fpArccosXTest_q <= GND_q & expLRange_uid61_fpArccosXTest_b & fpLOutFrac_uid60_fpArccosXTest_b;

    -- signX_uid178_sqrtFPL_uid64_fpArccosXTest(BITSELECT,177)@2
    signX_uid178_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR(fpL_uid62_fpArccosXTest_q(15 downto 15));

    -- redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4(DELAY,524)
    redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid178_sqrtFPL_uid64_fpArccosXTest_b, xout => redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q, clk => clk, aclr => areset );

    -- expX_uid177_sqrtFPL_uid64_fpArccosXTest(BITSELECT,176)@2
    expX_uid177_sqrtFPL_uid64_fpArccosXTest_b <= fpL_uid62_fpArccosXTest_q(14 downto 10);

    -- redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4(DELAY,525)
    redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid177_sqrtFPL_uid64_fpArccosXTest_b, xout => redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q, clk => clk, aclr => areset );

    -- excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest(LOGICAL,183)@6
    excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest_q <= "1" WHEN redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q = cstAllZWE_uid12_fpArccosXTest_q ELSE "0";

    -- negZero_uid256_sqrtFPL_uid64_fpArccosXTest(LOGICAL,255)@6 + 1
    negZero_uid256_sqrtFPL_uid64_fpArccosXTest_qi <= excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest_q and redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q;
    negZero_uid256_sqrtFPL_uid64_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => negZero_uid256_sqrtFPL_uid64_fpArccosXTest_qi, xout => negZero_uid256_sqrtFPL_uid64_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_notEnable(LOGICAL,543)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_nor(LOGICAL,544)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_nor_q <= not (redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_notEnable_q or redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q);

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_last(CONSTANT,540)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_last_q <= "01";

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmp(LOGICAL,541)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmp_q <= "1" WHEN redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_last_q = redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_q ELSE "0";

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg(REG,542)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg_q <= STD_LOGIC_VECTOR(redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena(REG,545)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_nor_q = "1") THEN
                redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_enaAnd(LOGICAL,546)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_enaAnd_q <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_sticky_ena_q and VCC_q;

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt(COUNTER,538)
    -- low=0, high=2, step=1, init=0
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq <= '1';
            ELSE
                redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq <= '0';
            END IF;
            IF (redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_eq = '1') THEN
                redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i + 2;
            ELSE
                redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_i, 2)));

    -- frac_x_uid183_sqrtFPL_uid64_fpArccosXTest(BITSELECT,182)@2
    frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b <= fpL_uid62_fpArccosXTest_q(9 downto 0);

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr(REG,539)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr_q <= STD_LOGIC_VECTOR(redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem(DUALMEM,537)
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ia <= STD_LOGIC_VECTOR(frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b);
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_aa <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_wraddr_q;
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ab <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_rdcnt_q;
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_reset0 <= areset;
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 10,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_reset0,
        clock1 => clk,
        address_a => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_aa,
        data_a => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_ab,
        q_b => redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_iq
    );
    redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_q <= redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_iq(9 downto 0);

    -- oFracX_uid215_sqrtFPL_uid64_fpArccosXTest(BITJOIN,214)@6
    oFracX_uid215_sqrtFPL_uid64_fpArccosXTest_q <= VCC_q & redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_q;

    -- oFracXZ_mergedSignalTM_uid218_sqrtFPL_uid64_fpArccosXTest(BITJOIN,217)@6
    oFracXZ_mergedSignalTM_uid218_sqrtFPL_uid64_fpArccosXTest_q <= oFracX_uid215_sqrtFPL_uid64_fpArccosXTest_q & GND_q;

    -- oFracXSignExt_mergedSignalTM_uid223_sqrtFPL_uid64_fpArccosXTest(BITJOIN,222)@6
    oFracXSignExt_mergedSignalTM_uid223_sqrtFPL_uid64_fpArccosXTest_q <= GND_q & oFracX_uid215_sqrtFPL_uid64_fpArccosXTest_q;

    -- expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest(BITSELECT,199)@2
    expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_in <= STD_LOGIC_VECTOR(expX_uid177_sqrtFPL_uid64_fpArccosXTest_b(0 downto 0));
    expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR(expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_in(0 downto 0));

    -- expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest(LOGICAL,200)@2
    expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q <= not (expX0PS_uid200_sqrtFPL_uid64_fpArccosXTest_b);

    -- redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4(DELAY,522)
    redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q, xout => redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4_q, clk => clk, aclr => areset );

    -- normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest(MUX,224)@6
    normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_s <= redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4_q;
    normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_combproc: PROCESS (normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_s, oFracXSignExt_mergedSignalTM_uid223_sqrtFPL_uid64_fpArccosXTest_q, oFracXZ_mergedSignalTM_uid218_sqrtFPL_uid64_fpArccosXTest_q)
    BEGIN
        CASE (normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_s) IS
            WHEN "0" => normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_q <= oFracXSignExt_mergedSignalTM_uid223_sqrtFPL_uid64_fpArccosXTest_q;
            WHEN "1" => normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_q <= oFracXZ_mergedSignalTM_uid218_sqrtFPL_uid64_fpArccosXTest_q;
            WHEN OTHERS => normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- paddingY_uid226_sqrtFPL_uid64_fpArccosXTest(CONSTANT,225)
    paddingY_uid226_sqrtFPL_uid64_fpArccosXTest_q <= "000000000000";

    -- updatedY_uid227_sqrtFPL_uid64_fpArccosXTest(BITJOIN,226)@6
    updatedY_uid227_sqrtFPL_uid64_fpArccosXTest_q <= normalizedXForComp_uid225_sqrtFPL_uid64_fpArccosXTest_q & paddingY_uid226_sqrtFPL_uid64_fpArccosXTest_q;

    -- addrFull_uid204_sqrtFPL_uid64_fpArccosXTest(BITJOIN,203)@2
    addrFull_uid204_sqrtFPL_uid64_fpArccosXTest_q <= expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q & frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b;

    -- yAddr_uid206_sqrtFPL_uid64_fpArccosXTest(BITSELECT,205)@2
    yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b <= addrFull_uid204_sqrtFPL_uid64_fpArccosXTest_q(10 downto 5);

    -- memoryC1_uid393_sqrtTables(LOOKUP,392)@2
    memoryC1_uid393_sqrtTables_combproc: PROCESS (yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b) IS
            WHEN "000000" => memoryC1_uid393_sqrtTables_q <= "0011111110";
            WHEN "000001" => memoryC1_uid393_sqrtTables_q <= "0011111011";
            WHEN "000010" => memoryC1_uid393_sqrtTables_q <= "0011110111";
            WHEN "000011" => memoryC1_uid393_sqrtTables_q <= "0011110011";
            WHEN "000100" => memoryC1_uid393_sqrtTables_q <= "0011110000";
            WHEN "000101" => memoryC1_uid393_sqrtTables_q <= "0011101100";
            WHEN "000110" => memoryC1_uid393_sqrtTables_q <= "0011101010";
            WHEN "000111" => memoryC1_uid393_sqrtTables_q <= "0011100110";
            WHEN "001000" => memoryC1_uid393_sqrtTables_q <= "0011100100";
            WHEN "001001" => memoryC1_uid393_sqrtTables_q <= "0011100000";
            WHEN "001010" => memoryC1_uid393_sqrtTables_q <= "0011011111";
            WHEN "001011" => memoryC1_uid393_sqrtTables_q <= "0011011011";
            WHEN "001100" => memoryC1_uid393_sqrtTables_q <= "0011011001";
            WHEN "001101" => memoryC1_uid393_sqrtTables_q <= "0011010111";
            WHEN "001110" => memoryC1_uid393_sqrtTables_q <= "0011010100";
            WHEN "001111" => memoryC1_uid393_sqrtTables_q <= "0011010010";
            WHEN "010000" => memoryC1_uid393_sqrtTables_q <= "0011010000";
            WHEN "010001" => memoryC1_uid393_sqrtTables_q <= "0011001110";
            WHEN "010010" => memoryC1_uid393_sqrtTables_q <= "0011001100";
            WHEN "010011" => memoryC1_uid393_sqrtTables_q <= "0011001010";
            WHEN "010100" => memoryC1_uid393_sqrtTables_q <= "0011000111";
            WHEN "010101" => memoryC1_uid393_sqrtTables_q <= "0011000101";
            WHEN "010110" => memoryC1_uid393_sqrtTables_q <= "0011000100";
            WHEN "010111" => memoryC1_uid393_sqrtTables_q <= "0011000010";
            WHEN "011000" => memoryC1_uid393_sqrtTables_q <= "0011000001";
            WHEN "011001" => memoryC1_uid393_sqrtTables_q <= "0010111111";
            WHEN "011010" => memoryC1_uid393_sqrtTables_q <= "0010111101";
            WHEN "011011" => memoryC1_uid393_sqrtTables_q <= "0010111100";
            WHEN "011100" => memoryC1_uid393_sqrtTables_q <= "0010111010";
            WHEN "011101" => memoryC1_uid393_sqrtTables_q <= "0010111001";
            WHEN "011110" => memoryC1_uid393_sqrtTables_q <= "0010110111";
            WHEN "011111" => memoryC1_uid393_sqrtTables_q <= "0010110110";
            WHEN "100000" => memoryC1_uid393_sqrtTables_q <= "0101100111";
            WHEN "100001" => memoryC1_uid393_sqrtTables_q <= "0101100010";
            WHEN "100010" => memoryC1_uid393_sqrtTables_q <= "0101011101";
            WHEN "100011" => memoryC1_uid393_sqrtTables_q <= "0101010111";
            WHEN "100100" => memoryC1_uid393_sqrtTables_q <= "0101010011";
            WHEN "100101" => memoryC1_uid393_sqrtTables_q <= "0101001111";
            WHEN "100110" => memoryC1_uid393_sqrtTables_q <= "0101001010";
            WHEN "100111" => memoryC1_uid393_sqrtTables_q <= "0101000110";
            WHEN "101000" => memoryC1_uid393_sqrtTables_q <= "0101000001";
            WHEN "101001" => memoryC1_uid393_sqrtTables_q <= "0100111110";
            WHEN "101010" => memoryC1_uid393_sqrtTables_q <= "0100111011";
            WHEN "101011" => memoryC1_uid393_sqrtTables_q <= "0100110111";
            WHEN "101100" => memoryC1_uid393_sqrtTables_q <= "0100110011";
            WHEN "101101" => memoryC1_uid393_sqrtTables_q <= "0100110000";
            WHEN "101110" => memoryC1_uid393_sqrtTables_q <= "0100101100";
            WHEN "101111" => memoryC1_uid393_sqrtTables_q <= "0100101001";
            WHEN "110000" => memoryC1_uid393_sqrtTables_q <= "0100100110";
            WHEN "110001" => memoryC1_uid393_sqrtTables_q <= "0100100011";
            WHEN "110010" => memoryC1_uid393_sqrtTables_q <= "0100100001";
            WHEN "110011" => memoryC1_uid393_sqrtTables_q <= "0100011110";
            WHEN "110100" => memoryC1_uid393_sqrtTables_q <= "0100011010";
            WHEN "110101" => memoryC1_uid393_sqrtTables_q <= "0100011001";
            WHEN "110110" => memoryC1_uid393_sqrtTables_q <= "0100010110";
            WHEN "110111" => memoryC1_uid393_sqrtTables_q <= "0100010011";
            WHEN "111000" => memoryC1_uid393_sqrtTables_q <= "0100010000";
            WHEN "111001" => memoryC1_uid393_sqrtTables_q <= "0100001110";
            WHEN "111010" => memoryC1_uid393_sqrtTables_q <= "0100001100";
            WHEN "111011" => memoryC1_uid393_sqrtTables_q <= "0100001010";
            WHEN "111100" => memoryC1_uid393_sqrtTables_q <= "0100000111";
            WHEN "111101" => memoryC1_uid393_sqrtTables_q <= "0100000101";
            WHEN "111110" => memoryC1_uid393_sqrtTables_q <= "0100000011";
            WHEN "111111" => memoryC1_uid393_sqrtTables_q <= "0100000001";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid393_sqrtTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- yForPe_uid207_sqrtFPL_uid64_fpArccosXTest(BITSELECT,206)@2
    yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_in <= frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b(4 downto 0);
    yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_b <= yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_in(4 downto 0);

    -- prodXY_uid417_pT1_uid399_invPolyEval_cma(CHAINMULTADD,498)@2 + 2
    prodXY_uid417_pT1_uid399_invPolyEval_cma_reset <= areset;
    prodXY_uid417_pT1_uid399_invPolyEval_cma_ena0 <= '1';
    prodXY_uid417_pT1_uid399_invPolyEval_cma_ena1 <= prodXY_uid417_pT1_uid399_invPolyEval_cma_ena0;
    prodXY_uid417_pT1_uid399_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid417_pT1_uid399_invPolyEval_cma_a0(0),6));
    prodXY_uid417_pT1_uid399_invPolyEval_cma_p(0) <= prodXY_uid417_pT1_uid399_invPolyEval_cma_l(0) * prodXY_uid417_pT1_uid399_invPolyEval_cma_c0(0);
    prodXY_uid417_pT1_uid399_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid417_pT1_uid399_invPolyEval_cma_p(0),17);
    prodXY_uid417_pT1_uid399_invPolyEval_cma_w(0) <= prodXY_uid417_pT1_uid399_invPolyEval_cma_u(0);
    prodXY_uid417_pT1_uid399_invPolyEval_cma_x(0) <= prodXY_uid417_pT1_uid399_invPolyEval_cma_w(0);
    prodXY_uid417_pT1_uid399_invPolyEval_cma_y(0) <= prodXY_uid417_pT1_uid399_invPolyEval_cma_x(0);
    prodXY_uid417_pT1_uid399_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid417_pT1_uid399_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid417_pT1_uid399_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid417_pT1_uid399_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid417_pT1_uid399_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yForPe_uid207_sqrtFPL_uid64_fpArccosXTest_b),5);
                prodXY_uid417_pT1_uid399_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC1_uid393_sqrtTables_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid417_pT1_uid399_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid417_pT1_uid399_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid417_pT1_uid399_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid417_pT1_uid399_invPolyEval_cma_s(0) <= prodXY_uid417_pT1_uid399_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid417_pT1_uid399_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 16, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid417_pT1_uid399_invPolyEval_cma_s(0)(15 downto 0)), xout => prodXY_uid417_pT1_uid399_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid417_pT1_uid399_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid417_pT1_uid399_invPolyEval_cma_qq(14 downto 0));

    -- osig_uid418_pT1_uid399_invPolyEval(BITSELECT,417)@4
    osig_uid418_pT1_uid399_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid417_pT1_uid399_invPolyEval_cma_q(14 downto 3));

    -- highBBits_uid401_invPolyEval(BITSELECT,400)@4
    highBBits_uid401_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid418_pT1_uid399_invPolyEval_b(11 downto 2));

    -- redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2(DELAY,521)
    redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b, xout => redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q, clk => clk, aclr => areset );

    -- memoryC0_uid390_sqrtTables(LOOKUP,389)@4
    memoryC0_uid390_sqrtTables_combproc: PROCESS (redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q) IS
            WHEN "000000" => memoryC0_uid390_sqrtTables_q <= "010000";
            WHEN "000001" => memoryC0_uid390_sqrtTables_q <= "010000";
            WHEN "000010" => memoryC0_uid390_sqrtTables_q <= "010000";
            WHEN "000011" => memoryC0_uid390_sqrtTables_q <= "010000";
            WHEN "000100" => memoryC0_uid390_sqrtTables_q <= "010000";
            WHEN "000101" => memoryC0_uid390_sqrtTables_q <= "010001";
            WHEN "000110" => memoryC0_uid390_sqrtTables_q <= "010001";
            WHEN "000111" => memoryC0_uid390_sqrtTables_q <= "010001";
            WHEN "001000" => memoryC0_uid390_sqrtTables_q <= "010001";
            WHEN "001001" => memoryC0_uid390_sqrtTables_q <= "010010";
            WHEN "001010" => memoryC0_uid390_sqrtTables_q <= "010010";
            WHEN "001011" => memoryC0_uid390_sqrtTables_q <= "010010";
            WHEN "001100" => memoryC0_uid390_sqrtTables_q <= "010010";
            WHEN "001101" => memoryC0_uid390_sqrtTables_q <= "010010";
            WHEN "001110" => memoryC0_uid390_sqrtTables_q <= "010011";
            WHEN "001111" => memoryC0_uid390_sqrtTables_q <= "010011";
            WHEN "010000" => memoryC0_uid390_sqrtTables_q <= "010011";
            WHEN "010001" => memoryC0_uid390_sqrtTables_q <= "010011";
            WHEN "010010" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "010011" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "010100" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "010101" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "010110" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "010111" => memoryC0_uid390_sqrtTables_q <= "010100";
            WHEN "011000" => memoryC0_uid390_sqrtTables_q <= "010101";
            WHEN "011001" => memoryC0_uid390_sqrtTables_q <= "010101";
            WHEN "011010" => memoryC0_uid390_sqrtTables_q <= "010101";
            WHEN "011011" => memoryC0_uid390_sqrtTables_q <= "010101";
            WHEN "011100" => memoryC0_uid390_sqrtTables_q <= "010101";
            WHEN "011101" => memoryC0_uid390_sqrtTables_q <= "010110";
            WHEN "011110" => memoryC0_uid390_sqrtTables_q <= "010110";
            WHEN "011111" => memoryC0_uid390_sqrtTables_q <= "010110";
            WHEN "100000" => memoryC0_uid390_sqrtTables_q <= "010110";
            WHEN "100001" => memoryC0_uid390_sqrtTables_q <= "010110";
            WHEN "100010" => memoryC0_uid390_sqrtTables_q <= "010111";
            WHEN "100011" => memoryC0_uid390_sqrtTables_q <= "010111";
            WHEN "100100" => memoryC0_uid390_sqrtTables_q <= "011000";
            WHEN "100101" => memoryC0_uid390_sqrtTables_q <= "011000";
            WHEN "100110" => memoryC0_uid390_sqrtTables_q <= "011000";
            WHEN "100111" => memoryC0_uid390_sqrtTables_q <= "011000";
            WHEN "101000" => memoryC0_uid390_sqrtTables_q <= "011001";
            WHEN "101001" => memoryC0_uid390_sqrtTables_q <= "011001";
            WHEN "101010" => memoryC0_uid390_sqrtTables_q <= "011001";
            WHEN "101011" => memoryC0_uid390_sqrtTables_q <= "011010";
            WHEN "101100" => memoryC0_uid390_sqrtTables_q <= "011010";
            WHEN "101101" => memoryC0_uid390_sqrtTables_q <= "011010";
            WHEN "101110" => memoryC0_uid390_sqrtTables_q <= "011011";
            WHEN "101111" => memoryC0_uid390_sqrtTables_q <= "011011";
            WHEN "110000" => memoryC0_uid390_sqrtTables_q <= "011011";
            WHEN "110001" => memoryC0_uid390_sqrtTables_q <= "011100";
            WHEN "110010" => memoryC0_uid390_sqrtTables_q <= "011100";
            WHEN "110011" => memoryC0_uid390_sqrtTables_q <= "011100";
            WHEN "110100" => memoryC0_uid390_sqrtTables_q <= "011100";
            WHEN "110101" => memoryC0_uid390_sqrtTables_q <= "011101";
            WHEN "110110" => memoryC0_uid390_sqrtTables_q <= "011101";
            WHEN "110111" => memoryC0_uid390_sqrtTables_q <= "011101";
            WHEN "111000" => memoryC0_uid390_sqrtTables_q <= "011101";
            WHEN "111001" => memoryC0_uid390_sqrtTables_q <= "011110";
            WHEN "111010" => memoryC0_uid390_sqrtTables_q <= "011110";
            WHEN "111011" => memoryC0_uid390_sqrtTables_q <= "011110";
            WHEN "111100" => memoryC0_uid390_sqrtTables_q <= "011110";
            WHEN "111101" => memoryC0_uid390_sqrtTables_q <= "011111";
            WHEN "111110" => memoryC0_uid390_sqrtTables_q <= "011111";
            WHEN "111111" => memoryC0_uid390_sqrtTables_q <= "011111";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid390_sqrtTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- memoryC0_uid389_sqrtTables(LOOKUP,388)@4
    memoryC0_uid389_sqrtTables_combproc: PROCESS (redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist10_yAddr_uid206_sqrtFPL_uid64_fpArccosXTest_b_2_q) IS
            WHEN "000000" => memoryC0_uid389_sqrtTables_q <= "0000000100";
            WHEN "000001" => memoryC0_uid389_sqrtTables_q <= "0100000010";
            WHEN "000010" => memoryC0_uid389_sqrtTables_q <= "0111111100";
            WHEN "000011" => memoryC0_uid389_sqrtTables_q <= "1011110011";
            WHEN "000100" => memoryC0_uid389_sqrtTables_q <= "1111100110";
            WHEN "000101" => memoryC0_uid389_sqrtTables_q <= "0011010110";
            WHEN "000110" => memoryC0_uid389_sqrtTables_q <= "0111000010";
            WHEN "000111" => memoryC0_uid389_sqrtTables_q <= "1010101100";
            WHEN "001000" => memoryC0_uid389_sqrtTables_q <= "1110010010";
            WHEN "001001" => memoryC0_uid389_sqrtTables_q <= "0001110110";
            WHEN "001010" => memoryC0_uid389_sqrtTables_q <= "0101010110";
            WHEN "001011" => memoryC0_uid389_sqrtTables_q <= "1000110101";
            WHEN "001100" => memoryC0_uid389_sqrtTables_q <= "1100010000";
            WHEN "001101" => memoryC0_uid389_sqrtTables_q <= "1111101001";
            WHEN "001110" => memoryC0_uid389_sqrtTables_q <= "0011000000";
            WHEN "001111" => memoryC0_uid389_sqrtTables_q <= "0110010100";
            WHEN "010000" => memoryC0_uid389_sqrtTables_q <= "1001100110";
            WHEN "010001" => memoryC0_uid389_sqrtTables_q <= "1100110110";
            WHEN "010010" => memoryC0_uid389_sqrtTables_q <= "0000000100";
            WHEN "010011" => memoryC0_uid389_sqrtTables_q <= "0011010000";
            WHEN "010100" => memoryC0_uid389_sqrtTables_q <= "0110011010";
            WHEN "010101" => memoryC0_uid389_sqrtTables_q <= "1001100010";
            WHEN "010110" => memoryC0_uid389_sqrtTables_q <= "1100101000";
            WHEN "010111" => memoryC0_uid389_sqrtTables_q <= "1111101100";
            WHEN "011000" => memoryC0_uid389_sqrtTables_q <= "0010101110";
            WHEN "011001" => memoryC0_uid389_sqrtTables_q <= "0101101111";
            WHEN "011010" => memoryC0_uid389_sqrtTables_q <= "1000101110";
            WHEN "011011" => memoryC0_uid389_sqrtTables_q <= "1011101011";
            WHEN "011100" => memoryC0_uid389_sqrtTables_q <= "1110100111";
            WHEN "011101" => memoryC0_uid389_sqrtTables_q <= "0001100001";
            WHEN "011110" => memoryC0_uid389_sqrtTables_q <= "0100011010";
            WHEN "011111" => memoryC0_uid389_sqrtTables_q <= "0111010001";
            WHEN "100000" => memoryC0_uid389_sqrtTables_q <= "1010000111";
            WHEN "100001" => memoryC0_uid389_sqrtTables_q <= "1111101110";
            WHEN "100010" => memoryC0_uid389_sqrtTables_q <= "0101010000";
            WHEN "100011" => memoryC0_uid389_sqrtTables_q <= "1010101101";
            WHEN "100100" => memoryC0_uid389_sqrtTables_q <= "0000000100";
            WHEN "100101" => memoryC0_uid389_sqrtTables_q <= "0101010111";
            WHEN "100110" => memoryC0_uid389_sqrtTables_q <= "1010100110";
            WHEN "100111" => memoryC0_uid389_sqrtTables_q <= "1111110000";
            WHEN "101000" => memoryC0_uid389_sqrtTables_q <= "0100110110";
            WHEN "101001" => memoryC0_uid389_sqrtTables_q <= "1001110111";
            WHEN "101010" => memoryC0_uid389_sqrtTables_q <= "1110110101";
            WHEN "101011" => memoryC0_uid389_sqrtTables_q <= "0011101111";
            WHEN "101100" => memoryC0_uid389_sqrtTables_q <= "1000100110";
            WHEN "101101" => memoryC0_uid389_sqrtTables_q <= "1101011001";
            WHEN "101110" => memoryC0_uid389_sqrtTables_q <= "0010001001";
            WHEN "101111" => memoryC0_uid389_sqrtTables_q <= "0110110101";
            WHEN "110000" => memoryC0_uid389_sqrtTables_q <= "1011011110";
            WHEN "110001" => memoryC0_uid389_sqrtTables_q <= "0000000100";
            WHEN "110010" => memoryC0_uid389_sqrtTables_q <= "0100100111";
            WHEN "110011" => memoryC0_uid389_sqrtTables_q <= "1001000111";
            WHEN "110100" => memoryC0_uid389_sqrtTables_q <= "1101100101";
            WHEN "110101" => memoryC0_uid389_sqrtTables_q <= "0001111111";
            WHEN "110110" => memoryC0_uid389_sqrtTables_q <= "0110010111";
            WHEN "110111" => memoryC0_uid389_sqrtTables_q <= "1010101101";
            WHEN "111000" => memoryC0_uid389_sqrtTables_q <= "1111000000";
            WHEN "111001" => memoryC0_uid389_sqrtTables_q <= "0011010000";
            WHEN "111010" => memoryC0_uid389_sqrtTables_q <= "0111011110";
            WHEN "111011" => memoryC0_uid389_sqrtTables_q <= "1011101010";
            WHEN "111100" => memoryC0_uid389_sqrtTables_q <= "1111110100";
            WHEN "111101" => memoryC0_uid389_sqrtTables_q <= "0011111011";
            WHEN "111110" => memoryC0_uid389_sqrtTables_q <= "1000000000";
            WHEN "111111" => memoryC0_uid389_sqrtTables_q <= "1100000011";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid389_sqrtTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- os_uid391_sqrtTables(BITJOIN,390)@4
    os_uid391_sqrtTables_q <= memoryC0_uid390_sqrtTables_q & memoryC0_uid389_sqrtTables_q;

    -- s1sumAHighB_uid402_invPolyEval(ADD,401)@4
    s1sumAHighB_uid402_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => os_uid391_sqrtTables_q(15)) & os_uid391_sqrtTables_q));
    s1sumAHighB_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 10 => highBBits_uid401_invPolyEval_b(9)) & highBBits_uid401_invPolyEval_b));
    s1sumAHighB_uid402_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid402_invPolyEval_a) + SIGNED(s1sumAHighB_uid402_invPolyEval_b));
    s1sumAHighB_uid402_invPolyEval_q <= s1sumAHighB_uid402_invPolyEval_o(16 downto 0);

    -- lowRangeB_uid400_invPolyEval(BITSELECT,399)@4
    lowRangeB_uid400_invPolyEval_in <= osig_uid418_pT1_uid399_invPolyEval_b(1 downto 0);
    lowRangeB_uid400_invPolyEval_b <= lowRangeB_uid400_invPolyEval_in(1 downto 0);

    -- s1_uid403_invPolyEval(BITJOIN,402)@4
    s1_uid403_invPolyEval_q <= s1sumAHighB_uid402_invPolyEval_q & lowRangeB_uid400_invPolyEval_b;

    -- fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest(BITSELECT,209)@4
    fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_in <= s1_uid403_invPolyEval_q(15 downto 0);
    fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b <= fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_in(15 downto 5);

    -- fracPaddingOne_uid212_sqrtFPL_uid64_fpArccosXTest(BITJOIN,211)@4
    fracPaddingOne_uid212_sqrtFPL_uid64_fpArccosXTest_q <= VCC_q & fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b;

    -- squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma(CHAINMULTADD,494)@4 + 2
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_reset <= areset;
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena0 <= '1';
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena1 <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena0;
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_p(0) <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0(0) * squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_c0(0);
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_u(0) <= RESIZE(squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_p(0),24);
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_w(0) <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_u(0);
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_x(0) <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_w(0);
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_y(0) <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_x(0);
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0 <= (others => (others => '0'));
            squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena0 = '1') THEN
                squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_a0(0) <= RESIZE(UNSIGNED(fracPaddingOne_uid212_sqrtFPL_uid64_fpArccosXTest_q),12);
                squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_c0(0) <= RESIZE(UNSIGNED(fracPaddingOne_uid212_sqrtFPL_uid64_fpArccosXTest_q),12);
            END IF;
        END IF;
    END PROCESS;
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_ena1 = '1') THEN
                squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_s(0) <= squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_s(0)(23 downto 0)), xout => squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_qq, clk => clk, aclr => areset );
    squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_q <= STD_LOGIC_VECTOR(squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_qq(23 downto 0));

    -- squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest(COMPARE,227)@6
    squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_a <= STD_LOGIC_VECTOR("00" & squaredResult_uid213_sqrtFPL_uid64_fpArccosXTest_cma_q);
    squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & updatedY_uid227_sqrtFPL_uid64_fpArccosXTest_q);
    squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_a) - UNSIGNED(squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_b));
    squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_n(0) <= not (squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_o(25));

    -- pLTOne_uid229_sqrtFPL_uid64_fpArccosXTest(LOGICAL,228)@6
    pLTOne_uid229_sqrtFPL_uid64_fpArccosXTest_q <= not (squaredResultGTEIn_uid226_sqrtFPL_uid64_fpArccosXTest_n);

    -- redist8_fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b_2(DELAY,519)
    redist8_fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b, xout => redist8_fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b_2_q, clk => clk, aclr => areset );

    -- fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest(ADD,230)@6
    fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & redist8_fracRPreCR_uid210_sqrtFPL_uid64_fpArccosXTest_b_2_q);
    fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR("00000000000" & pLTOne_uid229_sqrtFPL_uid64_fpArccosXTest_q);
    fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_a) + UNSIGNED(fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_b));
    fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_q <= fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_o(11 downto 0);

    -- expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select(BITSELECT,507)@6
    expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_b <= fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_q(11 downto 11);
    expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_c <= fxpSqrtResPostUpdateE_uid231_sqrtFPL_uid64_fpArccosXTest_q(10 downto 1);

    -- fracPENotOne_uid233_sqrtFPL_uid64_fpArccosXTest(LOGICAL,232)@6
    fracPENotOne_uid233_sqrtFPL_uid64_fpArccosXTest_q <= not (redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2_q);

    -- fracPENotOneAndCRRoundsExp_uid234_sqrtFPL_uid64_fpArccosXTest(LOGICAL,233)@6
    fracPENotOneAndCRRoundsExp_uid234_sqrtFPL_uid64_fpArccosXTest_q <= fracPENotOne_uid233_sqrtFPL_uid64_fpArccosXTest_q and expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_b;

    -- expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest(BITSELECT,208)@4
    expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_in <= STD_LOGIC_VECTOR(s1_uid403_invPolyEval_q(17 downto 0));
    expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR(expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_in(17 downto 17));

    -- redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2(DELAY,520)
    redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b, xout => redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2_q, clk => clk, aclr => areset );

    -- expInc_uid235_sqrtFPL_uid64_fpArccosXTest(LOGICAL,234)@6
    expInc_uid235_sqrtFPL_uid64_fpArccosXTest_q <= redist9_expIncPEOnly_uid209_sqrtFPL_uid64_fpArccosXTest_b_2_q or fracPENotOneAndCRRoundsExp_uid234_sqrtFPL_uid64_fpArccosXTest_q;

    -- cstBiasM1_uid14_fpArccosXTest(CONSTANT,13)
    cstBiasM1_uid14_fpArccosXTest_q <= "01110";

    -- expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest(ADD,197)@6
    expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q);
    expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArccosXTest_q);
    expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_a) + UNSIGNED(expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_b));
    expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_q <= expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_o(5 downto 0);

    -- expROdd_uid199_sqrtFPL_uid64_fpArccosXTest(BITSELECT,198)@6
    expROdd_uid199_sqrtFPL_uid64_fpArccosXTest_b <= expOddSig_uid198_sqrtFPL_uid64_fpArccosXTest_q(5 downto 1);

    -- expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest(ADD,194)@6
    expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q);
    expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid13_fpArccosXTest_q);
    expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_a) + UNSIGNED(expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_b));
    expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_q <= expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_o(5 downto 0);

    -- expREven_uid196_sqrtFPL_uid64_fpArccosXTest(BITSELECT,195)@6
    expREven_uid196_sqrtFPL_uid64_fpArccosXTest_b <= expEvenSig_uid195_sqrtFPL_uid64_fpArccosXTest_q(5 downto 1);

    -- expRMux_uid202_sqrtFPL_uid64_fpArccosXTest(MUX,201)@6
    expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_s <= redist11_expOddSelect_uid201_sqrtFPL_uid64_fpArccosXTest_q_4_q;
    expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_combproc: PROCESS (expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_s, expREven_uid196_sqrtFPL_uid64_fpArccosXTest_b, expROdd_uid199_sqrtFPL_uid64_fpArccosXTest_b)
    BEGIN
        CASE (expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_s) IS
            WHEN "0" => expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_q <= expREven_uid196_sqrtFPL_uid64_fpArccosXTest_b;
            WHEN "1" => expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_q <= expROdd_uid199_sqrtFPL_uid64_fpArccosXTest_b;
            WHEN OTHERS => expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expR_uid237_sqrtFPL_uid64_fpArccosXTest(ADD,236)@6
    expR_uid237_sqrtFPL_uid64_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & expRMux_uid202_sqrtFPL_uid64_fpArccosXTest_q);
    expR_uid237_sqrtFPL_uid64_fpArccosXTest_b <= STD_LOGIC_VECTOR("00000" & expInc_uid235_sqrtFPL_uid64_fpArccosXTest_q);
    expR_uid237_sqrtFPL_uid64_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid237_sqrtFPL_uid64_fpArccosXTest_a) + UNSIGNED(expR_uid237_sqrtFPL_uid64_fpArccosXTest_b));
    expR_uid237_sqrtFPL_uid64_fpArccosXTest_q <= expR_uid237_sqrtFPL_uid64_fpArccosXTest_o(5 downto 0);

    -- expRR_uid248_sqrtFPL_uid64_fpArccosXTest(BITSELECT,247)@6
    expRR_uid248_sqrtFPL_uid64_fpArccosXTest_in <= expR_uid237_sqrtFPL_uid64_fpArccosXTest_q(4 downto 0);
    expRR_uid248_sqrtFPL_uid64_fpArccosXTest_b <= expRR_uid248_sqrtFPL_uid64_fpArccosXTest_in(4 downto 0);

    -- expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest(LOGICAL,184)@6
    expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest_q <= "1" WHEN redist14_expX_uid177_sqrtFPL_uid64_fpArccosXTest_b_4_q = cstAllOWE_uid9_fpArccosXTest_q ELSE "0";

    -- invExpXIsMax_uid190_sqrtFPL_uid64_fpArccosXTest(LOGICAL,189)@6
    invExpXIsMax_uid190_sqrtFPL_uid64_fpArccosXTest_q <= not (expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest_q);

    -- InvExpXIsZero_uid191_sqrtFPL_uid64_fpArccosXTest(LOGICAL,190)@6
    InvExpXIsZero_uid191_sqrtFPL_uid64_fpArccosXTest_q <= not (excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest_q);

    -- excR_x_uid192_sqrtFPL_uid64_fpArccosXTest(LOGICAL,191)@6
    excR_x_uid192_sqrtFPL_uid64_fpArccosXTest_q <= InvExpXIsZero_uid191_sqrtFPL_uid64_fpArccosXTest_q and invExpXIsMax_uid190_sqrtFPL_uid64_fpArccosXTest_q;

    -- minReg_uid240_sqrtFPL_uid64_fpArccosXTest(LOGICAL,239)@6
    minReg_uid240_sqrtFPL_uid64_fpArccosXTest_q <= excR_x_uid192_sqrtFPL_uid64_fpArccosXTest_q and redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q;

    -- fracXIsZero_uid186_sqrtFPL_uid64_fpArccosXTest(LOGICAL,185)@6
    fracXIsZero_uid186_sqrtFPL_uid64_fpArccosXTest_q <= "1" WHEN cstAllZWF_uid10_fpArccosXTest_q = redist12_frac_x_uid183_sqrtFPL_uid64_fpArccosXTest_b_4_mem_q ELSE "0";

    -- excI_x_uid188_sqrtFPL_uid64_fpArccosXTest(LOGICAL,187)@6
    excI_x_uid188_sqrtFPL_uid64_fpArccosXTest_q <= expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest_q and fracXIsZero_uid186_sqrtFPL_uid64_fpArccosXTest_q;

    -- minInf_uid241_sqrtFPL_uid64_fpArccosXTest(LOGICAL,240)@6
    minInf_uid241_sqrtFPL_uid64_fpArccosXTest_q <= excI_x_uid188_sqrtFPL_uid64_fpArccosXTest_q and redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q;

    -- fracXIsNotZero_uid187_sqrtFPL_uid64_fpArccosXTest(LOGICAL,186)@6
    fracXIsNotZero_uid187_sqrtFPL_uid64_fpArccosXTest_q <= not (fracXIsZero_uid186_sqrtFPL_uid64_fpArccosXTest_q);

    -- excN_x_uid189_sqrtFPL_uid64_fpArccosXTest(LOGICAL,188)@6
    excN_x_uid189_sqrtFPL_uid64_fpArccosXTest_q <= expXIsMax_uid185_sqrtFPL_uid64_fpArccosXTest_q and fracXIsNotZero_uid187_sqrtFPL_uid64_fpArccosXTest_q;

    -- excRNaN_uid242_sqrtFPL_uid64_fpArccosXTest(LOGICAL,241)@6
    excRNaN_uid242_sqrtFPL_uid64_fpArccosXTest_q <= excN_x_uid189_sqrtFPL_uid64_fpArccosXTest_q or minInf_uid241_sqrtFPL_uid64_fpArccosXTest_q or minReg_uid240_sqrtFPL_uid64_fpArccosXTest_q;

    -- invSignX_uid238_sqrtFPL_uid64_fpArccosXTest(LOGICAL,237)@6
    invSignX_uid238_sqrtFPL_uid64_fpArccosXTest_q <= not (redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q);

    -- inInfAndNotNeg_uid239_sqrtFPL_uid64_fpArccosXTest(LOGICAL,238)@6
    inInfAndNotNeg_uid239_sqrtFPL_uid64_fpArccosXTest_q <= excI_x_uid188_sqrtFPL_uid64_fpArccosXTest_q and invSignX_uid238_sqrtFPL_uid64_fpArccosXTest_q;

    -- excConc_uid243_sqrtFPL_uid64_fpArccosXTest(BITJOIN,242)@6
    excConc_uid243_sqrtFPL_uid64_fpArccosXTest_q <= excRNaN_uid242_sqrtFPL_uid64_fpArccosXTest_q & inInfAndNotNeg_uid239_sqrtFPL_uid64_fpArccosXTest_q & excZ_x_uid184_sqrtFPL_uid64_fpArccosXTest_q;

    -- fracSelIn_uid244_sqrtFPL_uid64_fpArccosXTest(BITJOIN,243)@6
    fracSelIn_uid244_sqrtFPL_uid64_fpArccosXTest_q <= redist13_signX_uid178_sqrtFPL_uid64_fpArccosXTest_b_4_q & excConc_uid243_sqrtFPL_uid64_fpArccosXTest_q;

    -- fracSel_uid245_sqrtFPL_uid64_fpArccosXTest(LOOKUP,244)@6
    fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_combproc: PROCESS (fracSelIn_uid244_sqrtFPL_uid64_fpArccosXTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (fracSelIn_uid244_sqrtFPL_uid64_fpArccosXTest_q) IS
            WHEN "0000" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "01";
            WHEN "0001" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "00";
            WHEN "0010" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "10";
            WHEN "0011" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "00";
            WHEN "0100" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "0101" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "00";
            WHEN "0110" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "10";
            WHEN "0111" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "00";
            WHEN "1000" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1001" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "00";
            WHEN "1010" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1011" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1100" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1101" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1110" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN "1111" => fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest(MUX,249)@6 + 1
    expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_s <= fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q;
    expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_s) IS
                WHEN "00" => expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                WHEN "01" => expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= expRR_uid248_sqrtFPL_uid64_fpArccosXTest_b;
                WHEN "10" => expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                WHEN "11" => expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                WHEN OTHERS => expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- cstNaNWF_uid11_fpArccosXTest(CONSTANT,10)
    cstNaNWF_uid11_fpArccosXTest_q <= "0000000001";

    -- fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest(MUX,254)@6 + 1
    fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_s <= fracSel_uid245_sqrtFPL_uid64_fpArccosXTest_q;
    fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_s) IS
                WHEN "00" => fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                WHEN "01" => fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= expUpdateCRU_uid232_sqrtFPL_uid64_fpArccosXTest_merged_bit_select_c;
                WHEN "10" => fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                WHEN "11" => fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
                WHEN OTHERS => fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest(BITJOIN,256)@7
    RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest_q <= negZero_uid256_sqrtFPL_uid64_fpArccosXTest_q & expRPostExc_uid250_sqrtFPL_uid64_fpArccosXTest_q & fracRPostExc_uid255_sqrtFPL_uid64_fpArccosXTest_q;

    -- fracSqrtFPL_uid65_fpArccosXTest(BITSELECT,64)@7
    fracSqrtFPL_uid65_fpArccosXTest_b <= RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest_q(9 downto 0);

    -- cstAllZWF_uid10_fpArccosXTest(CONSTANT,9)
    cstAllZWF_uid10_fpArccosXTest_q <= "0000000000";

    -- fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest(LOGICAL,294)@7 + 1
    fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_qi <= "1" WHEN cstAllZWF_uid10_fpArccosXTest_q = fracSqrtFPL_uid65_fpArccosXTest_b ELSE "0";
    fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_qi, xout => fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6(DELAY,516)
    redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q, xout => redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6_q, clk => clk, aclr => areset );

    -- expSqrtFPL_uid67_fpArccosXTest(BITSELECT,66)@7
    expSqrtFPL_uid67_fpArccosXTest_b <= RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest_q(14 downto 10);

    -- redist19_expSqrtFPL_uid67_fpArccosXTest_b_6(DELAY,530)
    redist19_expSqrtFPL_uid67_fpArccosXTest_b_6 : dspba_delay
    GENERIC MAP ( width => 5, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSqrtFPL_uid67_fpArccosXTest_b, xout => redist19_expSqrtFPL_uid67_fpArccosXTest_b_6_q, clk => clk, aclr => areset );

    -- expXIsMax_uid294_arcsinL_uid79_fpArccosXTest(LOGICAL,293)@13
    expXIsMax_uid294_arcsinL_uid79_fpArccosXTest_q <= "1" WHEN redist19_expSqrtFPL_uid67_fpArccosXTest_b_6_q = cstAllOWE_uid9_fpArccosXTest_q ELSE "0";

    -- excI_x_uid297_arcsinL_uid79_fpArccosXTest(LOGICAL,296)@13
    excI_x_uid297_arcsinL_uid79_fpArccosXTest_q <= expXIsMax_uid294_arcsinL_uid79_fpArccosXTest_q and redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6_q;

    -- memoryC2_uid265_arcCosXTables(LOOKUP,264)@7
    memoryC2_uid265_arcCosXTables_combproc: PROCESS (yAddr_uid72_fpArccosXTest_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid72_fpArccosXTest_merged_bit_select_b) IS
            WHEN "0000" => memoryC2_uid265_arcCosXTables_q <= "0010100";
            WHEN "0001" => memoryC2_uid265_arcCosXTables_q <= "0010101";
            WHEN "0010" => memoryC2_uid265_arcCosXTables_q <= "0010111";
            WHEN "0011" => memoryC2_uid265_arcCosXTables_q <= "0010111";
            WHEN "0100" => memoryC2_uid265_arcCosXTables_q <= "0011001";
            WHEN "0101" => memoryC2_uid265_arcCosXTables_q <= "0011101";
            WHEN "0110" => memoryC2_uid265_arcCosXTables_q <= "0100001";
            WHEN "0111" => memoryC2_uid265_arcCosXTables_q <= "0100110";
            WHEN "1000" => memoryC2_uid265_arcCosXTables_q <= "0110000";
            WHEN "1001" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1010" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1011" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1100" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1101" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1110" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN "1111" => memoryC2_uid265_arcCosXTables_q <= "0000000";
            WHEN OTHERS => -- unreachable
                           memoryC2_uid265_arcCosXTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rightShiftStage1Idx3Rng3_uid466_alignSqrt_uid70_fpArccosXTest(BITSELECT,465)@7
    rightShiftStage1Idx3Rng3_uid466_alignSqrt_uid70_fpArccosXTest_b <= rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q(10 downto 3);

    -- rightShiftStage1Idx3_uid468_alignSqrt_uid70_fpArccosXTest(BITJOIN,467)@7
    rightShiftStage1Idx3_uid468_alignSqrt_uid70_fpArccosXTest_q <= padBCst_uid88_fpArccosXTest_q & rightShiftStage1Idx3Rng3_uid466_alignSqrt_uid70_fpArccosXTest_b;

    -- rightShiftStage1Idx2Rng2_uid463_alignSqrt_uid70_fpArccosXTest(BITSELECT,462)@7
    rightShiftStage1Idx2Rng2_uid463_alignSqrt_uid70_fpArccosXTest_b <= rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q(10 downto 2);

    -- rightShiftStage1Idx2_uid465_alignSqrt_uid70_fpArccosXTest(BITJOIN,464)@7
    rightShiftStage1Idx2_uid465_alignSqrt_uid70_fpArccosXTest_q <= zs_uid156_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage1Idx2Rng2_uid463_alignSqrt_uid70_fpArccosXTest_b;

    -- rightShiftStage1Idx1Rng1_uid460_alignSqrt_uid70_fpArccosXTest(BITSELECT,459)@7
    rightShiftStage1Idx1Rng1_uid460_alignSqrt_uid70_fpArccosXTest_b <= rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q(10 downto 1);

    -- rightShiftStage1Idx1_uid462_alignSqrt_uid70_fpArccosXTest(BITJOIN,461)@7
    rightShiftStage1Idx1_uid462_alignSqrt_uid70_fpArccosXTest_q <= GND_q & rightShiftStage1Idx1Rng1_uid460_alignSqrt_uid70_fpArccosXTest_b;

    -- rightShiftStage0Idx2Rng8_uid454_alignSqrt_uid70_fpArccosXTest(BITSELECT,453)@7
    rightShiftStage0Idx2Rng8_uid454_alignSqrt_uid70_fpArccosXTest_b <= oSqrtFPLFrac_uid66_fpArccosXTest_q(10 downto 8);

    -- rightShiftStage0Idx2_uid456_alignSqrt_uid70_fpArccosXTest(BITJOIN,455)@7
    rightShiftStage0Idx2_uid456_alignSqrt_uid70_fpArccosXTest_q <= zs_uid142_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage0Idx2Rng8_uid454_alignSqrt_uid70_fpArccosXTest_b;

    -- rightShiftStage0Idx1Rng4_uid451_alignSqrt_uid70_fpArccosXTest(BITSELECT,450)@7
    rightShiftStage0Idx1Rng4_uid451_alignSqrt_uid70_fpArccosXTest_b <= oSqrtFPLFrac_uid66_fpArccosXTest_q(10 downto 4);

    -- rightShiftStage0Idx1_uid453_alignSqrt_uid70_fpArccosXTest(BITJOIN,452)@7
    rightShiftStage0Idx1_uid453_alignSqrt_uid70_fpArccosXTest_q <= zs_uid149_fpLOut1_uid58_fpArccosXTest_q & rightShiftStage0Idx1Rng4_uid451_alignSqrt_uid70_fpArccosXTest_b;

    -- oSqrtFPLFrac_uid66_fpArccosXTest(BITJOIN,65)@7
    oSqrtFPLFrac_uid66_fpArccosXTest_q <= VCC_q & fracSqrtFPL_uid65_fpArccosXTest_b;

    -- rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest(MUX,458)@7
    rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_s <= rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_b;
    rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_combproc: PROCESS (rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_s, oSqrtFPLFrac_uid66_fpArccosXTest_q, rightShiftStage0Idx1_uid453_alignSqrt_uid70_fpArccosXTest_q, rightShiftStage0Idx2_uid456_alignSqrt_uid70_fpArccosXTest_q, rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q <= oSqrtFPLFrac_uid66_fpArccosXTest_q;
            WHEN "01" => rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage0Idx1_uid453_alignSqrt_uid70_fpArccosXTest_q;
            WHEN "10" => rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage0Idx2_uid456_alignSqrt_uid70_fpArccosXTest_q;
            WHEN "11" => rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage0Idx3_uid457_alignSqrt_uid70_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- srVal_uid68_fpArccosXTest(SUB,67)@7
    srVal_uid68_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid14_fpArccosXTest_q);
    srVal_uid68_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & expSqrtFPL_uid67_fpArccosXTest_b);
    srVal_uid68_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(srVal_uid68_fpArccosXTest_a) - UNSIGNED(srVal_uid68_fpArccosXTest_b));
    srVal_uid68_fpArccosXTest_q <= srVal_uid68_fpArccosXTest_o(5 downto 0);

    -- srValRange_uid69_fpArccosXTest(BITSELECT,68)@7
    srValRange_uid69_fpArccosXTest_in <= srVal_uid68_fpArccosXTest_q(3 downto 0);
    srValRange_uid69_fpArccosXTest_b <= srValRange_uid69_fpArccosXTest_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select(BITSELECT,499)@7
    rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_b <= srValRange_uid69_fpArccosXTest_b(3 downto 2);
    rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_c <= srValRange_uid69_fpArccosXTest_b(1 downto 0);

    -- rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest(MUX,469)@7
    rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_s <= rightShiftStageSel3Dto2_uid458_alignSqrt_uid70_fpArccosXTest_merged_bit_select_c;
    rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_combproc: PROCESS (rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_s, rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q, rightShiftStage1Idx1_uid462_alignSqrt_uid70_fpArccosXTest_q, rightShiftStage1Idx2_uid465_alignSqrt_uid70_fpArccosXTest_q, rightShiftStage1Idx3_uid468_alignSqrt_uid70_fpArccosXTest_q)
    BEGIN
        CASE (rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_s) IS
            WHEN "00" => rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage0_uid459_alignSqrt_uid70_fpArccosXTest_q;
            WHEN "01" => rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage1Idx1_uid462_alignSqrt_uid70_fpArccosXTest_q;
            WHEN "10" => rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage1Idx2_uid465_alignSqrt_uid70_fpArccosXTest_q;
            WHEN "11" => rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q <= rightShiftStage1Idx3_uid468_alignSqrt_uid70_fpArccosXTest_q;
            WHEN OTHERS => rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- yAddr_uid72_fpArccosXTest_merged_bit_select(BITSELECT,510)@7
    yAddr_uid72_fpArccosXTest_merged_bit_select_b <= rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q(10 downto 7);
    yAddr_uid72_fpArccosXTest_merged_bit_select_c <= rightShiftStage1_uid470_alignSqrt_uid70_fpArccosXTest_q(6 downto 1);

    -- prodXY_uid405_pT1_uid272_invPolyEval(MULT,404)@7 + 2
    prodXY_uid405_pT1_uid272_invPolyEval_pr <= SIGNED(signed(resize(UNSIGNED(prodXY_uid405_pT1_uid272_invPolyEval_a0),7)) * SIGNED(prodXY_uid405_pT1_uid272_invPolyEval_b0));
    prodXY_uid405_pT1_uid272_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid405_pT1_uid272_invPolyEval_a0 <= (others => '0');
            prodXY_uid405_pT1_uid272_invPolyEval_b0 <= (others => '0');
            prodXY_uid405_pT1_uid272_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid405_pT1_uid272_invPolyEval_a0 <= yAddr_uid72_fpArccosXTest_merged_bit_select_c;
            prodXY_uid405_pT1_uid272_invPolyEval_b0 <= STD_LOGIC_VECTOR(memoryC2_uid265_arcCosXTables_q);
            prodXY_uid405_pT1_uid272_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid405_pT1_uid272_invPolyEval_pr,13));
        END IF;
    END PROCESS;
    prodXY_uid405_pT1_uid272_invPolyEval_q <= prodXY_uid405_pT1_uid272_invPolyEval_s1;

    -- osig_uid406_pT1_uid272_invPolyEval(BITSELECT,405)@9
    osig_uid406_pT1_uid272_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid405_pT1_uid272_invPolyEval_q(12 downto 5));

    -- highBBits_uid274_invPolyEval(BITSELECT,273)@9
    highBBits_uid274_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid406_pT1_uid272_invPolyEval_b(7 downto 1));

    -- redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2(DELAY,511)
    redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid72_fpArccosXTest_merged_bit_select_b, xout => redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid262_arcCosXTables(LOOKUP,261)@9
    memoryC1_uid262_arcCosXTables_combproc: PROCESS (redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2_q) IS
            WHEN "0000" => memoryC1_uid262_arcCosXTables_q <= "0000000001";
            WHEN "0001" => memoryC1_uid262_arcCosXTables_q <= "0000101100";
            WHEN "0010" => memoryC1_uid262_arcCosXTables_q <= "0001010110";
            WHEN "0011" => memoryC1_uid262_arcCosXTables_q <= "0010000101";
            WHEN "0100" => memoryC1_uid262_arcCosXTables_q <= "0010110110";
            WHEN "0101" => memoryC1_uid262_arcCosXTables_q <= "0011101010";
            WHEN "0110" => memoryC1_uid262_arcCosXTables_q <= "0100100101";
            WHEN "0111" => memoryC1_uid262_arcCosXTables_q <= "0101101001";
            WHEN "1000" => memoryC1_uid262_arcCosXTables_q <= "0110110110";
            WHEN "1001" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1010" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1011" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1100" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1101" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1110" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN "1111" => memoryC1_uid262_arcCosXTables_q <= "0000000000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid262_arcCosXTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid275_invPolyEval(ADD,274)@9
    s1sumAHighB_uid275_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => memoryC1_uid262_arcCosXTables_q(9)) & memoryC1_uid262_arcCosXTables_q));
    s1sumAHighB_uid275_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 7 => highBBits_uid274_invPolyEval_b(6)) & highBBits_uid274_invPolyEval_b));
    s1sumAHighB_uid275_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid275_invPolyEval_a) + SIGNED(s1sumAHighB_uid275_invPolyEval_b));
    s1sumAHighB_uid275_invPolyEval_q <= s1sumAHighB_uid275_invPolyEval_o(10 downto 0);

    -- lowRangeB_uid273_invPolyEval(BITSELECT,272)@9
    lowRangeB_uid273_invPolyEval_in <= osig_uid406_pT1_uid272_invPolyEval_b(0 downto 0);
    lowRangeB_uid273_invPolyEval_b <= lowRangeB_uid273_invPolyEval_in(0 downto 0);

    -- s1_uid276_invPolyEval(BITJOIN,275)@9
    s1_uid276_invPolyEval_q <= s1sumAHighB_uid275_invPolyEval_q & lowRangeB_uid273_invPolyEval_b;

    -- redist2_yAddr_uid72_fpArccosXTest_merged_bit_select_c_2(DELAY,513)
    redist2_yAddr_uid72_fpArccosXTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid72_fpArccosXTest_merged_bit_select_c, xout => redist2_yAddr_uid72_fpArccosXTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- prodXY_uid408_pT2_uid278_invPolyEval_cma(CHAINMULTADD,495)@9 + 2
    prodXY_uid408_pT2_uid278_invPolyEval_cma_reset <= areset;
    prodXY_uid408_pT2_uid278_invPolyEval_cma_ena0 <= '1';
    prodXY_uid408_pT2_uid278_invPolyEval_cma_ena1 <= prodXY_uid408_pT2_uid278_invPolyEval_cma_ena0;
    prodXY_uid408_pT2_uid278_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid408_pT2_uid278_invPolyEval_cma_a0(0),7));
    prodXY_uid408_pT2_uid278_invPolyEval_cma_p(0) <= prodXY_uid408_pT2_uid278_invPolyEval_cma_l(0) * prodXY_uid408_pT2_uid278_invPolyEval_cma_c0(0);
    prodXY_uid408_pT2_uid278_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid408_pT2_uid278_invPolyEval_cma_p(0),19);
    prodXY_uid408_pT2_uid278_invPolyEval_cma_w(0) <= prodXY_uid408_pT2_uid278_invPolyEval_cma_u(0);
    prodXY_uid408_pT2_uid278_invPolyEval_cma_x(0) <= prodXY_uid408_pT2_uid278_invPolyEval_cma_w(0);
    prodXY_uid408_pT2_uid278_invPolyEval_cma_y(0) <= prodXY_uid408_pT2_uid278_invPolyEval_cma_x(0);
    prodXY_uid408_pT2_uid278_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid408_pT2_uid278_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid408_pT2_uid278_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid408_pT2_uid278_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid408_pT2_uid278_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist2_yAddr_uid72_fpArccosXTest_merged_bit_select_c_2_q),6);
                prodXY_uid408_pT2_uid278_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid276_invPolyEval_q),12);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid408_pT2_uid278_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid408_pT2_uid278_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid408_pT2_uid278_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid408_pT2_uid278_invPolyEval_cma_s(0) <= prodXY_uid408_pT2_uid278_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid408_pT2_uid278_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 18, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid408_pT2_uid278_invPolyEval_cma_s(0)(17 downto 0)), xout => prodXY_uid408_pT2_uid278_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid408_pT2_uid278_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid408_pT2_uid278_invPolyEval_cma_qq(17 downto 0));

    -- osig_uid409_pT2_uid278_invPolyEval(BITSELECT,408)@11
    osig_uid409_pT2_uid278_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid408_pT2_uid278_invPolyEval_cma_q(17 downto 5));

    -- highBBits_uid280_invPolyEval(BITSELECT,279)@11
    highBBits_uid280_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid409_pT2_uid278_invPolyEval_b(12 downto 2));

    -- redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4(DELAY,512)
    redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_yAddr_uid72_fpArccosXTest_merged_bit_select_b_2_q, xout => redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- memoryC0_uid259_arcCosXTables(LOOKUP,258)@11
    memoryC0_uid259_arcCosXTables_combproc: PROCESS (redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist1_yAddr_uid72_fpArccosXTest_merged_bit_select_b_4_q) IS
            WHEN "0000" => memoryC0_uid259_arcCosXTables_q <= "01000000000000100";
            WHEN "0001" => memoryC0_uid259_arcCosXTables_q <= "01000000000011001";
            WHEN "0010" => memoryC0_uid259_arcCosXTables_q <= "01000000001011010";
            WHEN "0011" => memoryC0_uid259_arcCosXTables_q <= "01000000011000111";
            WHEN "0100" => memoryC0_uid259_arcCosXTables_q <= "01000000101100011";
            WHEN "0101" => memoryC0_uid259_arcCosXTables_q <= "01000001000110010";
            WHEN "0110" => memoryC0_uid259_arcCosXTables_q <= "01000001100111001";
            WHEN "0111" => memoryC0_uid259_arcCosXTables_q <= "01000010001111111";
            WHEN "1000" => memoryC0_uid259_arcCosXTables_q <= "01000011000001111";
            WHEN "1001" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1010" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1011" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1100" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1101" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1110" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN "1111" => memoryC0_uid259_arcCosXTables_q <= "00000000000000100";
            WHEN OTHERS => -- unreachable
                           memoryC0_uid259_arcCosXTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s2sumAHighB_uid281_invPolyEval(ADD,280)@11
    s2sumAHighB_uid281_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => memoryC0_uid259_arcCosXTables_q(16)) & memoryC0_uid259_arcCosXTables_q));
    s2sumAHighB_uid281_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 11 => highBBits_uid280_invPolyEval_b(10)) & highBBits_uid280_invPolyEval_b));
    s2sumAHighB_uid281_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid281_invPolyEval_a) + SIGNED(s2sumAHighB_uid281_invPolyEval_b));
    s2sumAHighB_uid281_invPolyEval_q <= s2sumAHighB_uid281_invPolyEval_o(17 downto 0);

    -- lowRangeB_uid279_invPolyEval(BITSELECT,278)@11
    lowRangeB_uid279_invPolyEval_in <= osig_uid409_pT2_uid278_invPolyEval_b(1 downto 0);
    lowRangeB_uid279_invPolyEval_b <= lowRangeB_uid279_invPolyEval_in(1 downto 0);

    -- s2_uid282_invPolyEval(BITJOIN,281)@11
    s2_uid282_invPolyEval_q <= s2sumAHighB_uid281_invPolyEval_q & lowRangeB_uid279_invPolyEval_b;

    -- fxpArcSinXO2XRes_uid75_fpArccosXTest(BITSELECT,74)@11
    fxpArcSinXO2XRes_uid75_fpArccosXTest_in <= s2_uid282_invPolyEval_q(17 downto 0);
    fxpArcSinXO2XRes_uid75_fpArccosXTest_b <= fxpArcSinXO2XRes_uid75_fpArccosXTest_in(17 downto 5);

    -- fxpArcsinXO2XResWFRange_uid76_fpArccosXTest(BITSELECT,75)@11
    fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_in <= fxpArcSinXO2XRes_uid75_fpArccosXTest_b(11 downto 0);
    fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_b <= fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_in(11 downto 2);

    -- fpArcsinXO2XRes_uid77_fpArccosXTest(BITJOIN,76)@11
    fpArcsinXO2XRes_uid77_fpArccosXTest_q <= GND_q & cstBiasP1_uid17_fpArccosXTest_q & fxpArcsinXO2XResWFRange_uid76_fpArccosXTest_b;

    -- expY_uid285_arcsinL_uid79_fpArccosXTest(BITSELECT,284)@11
    expY_uid285_arcsinL_uid79_fpArccosXTest_b <= fpArcsinXO2XRes_uid77_fpArccosXTest_q(14 downto 10);

    -- redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2(DELAY,518)
    redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expY_uid285_arcsinL_uid79_fpArccosXTest_b, xout => redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2_q, clk => clk, aclr => areset );

    -- excZ_y_uid307_arcsinL_uid79_fpArccosXTest(LOGICAL,306)@13
    excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q <= "1" WHEN redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2_q = cstAllZWE_uid12_fpArccosXTest_q ELSE "0";

    -- excYZAndExcXI_uid353_arcsinL_uid79_fpArccosXTest(LOGICAL,352)@13
    excYZAndExcXI_uid353_arcsinL_uid79_fpArccosXTest_q <= excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q and excI_x_uid297_arcsinL_uid79_fpArccosXTest_q;

    -- frac_y_uid306_arcsinL_uid79_fpArccosXTest(BITSELECT,305)@11
    frac_y_uid306_arcsinL_uid79_fpArccosXTest_b <= fpArcsinXO2XRes_uid77_fpArccosXTest_q(9 downto 0);

    -- fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest(LOGICAL,308)@11 + 1
    fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_qi <= "1" WHEN cstAllZWF_uid10_fpArccosXTest_q = frac_y_uid306_arcsinL_uid79_fpArccosXTest_b ELSE "0";
    fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_qi, xout => fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2(DELAY,515)
    redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q, xout => redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid308_arcsinL_uid79_fpArccosXTest(LOGICAL,307)@13
    expXIsMax_uid308_arcsinL_uid79_fpArccosXTest_q <= "1" WHEN redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2_q = cstAllOWE_uid9_fpArccosXTest_q ELSE "0";

    -- excI_y_uid311_arcsinL_uid79_fpArccosXTest(LOGICAL,310)@13
    excI_y_uid311_arcsinL_uid79_fpArccosXTest_q <= expXIsMax_uid308_arcsinL_uid79_fpArccosXTest_q and redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2_q;

    -- excZ_x_uid293_arcsinL_uid79_fpArccosXTest(LOGICAL,292)@13
    excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q <= "1" WHEN redist19_expSqrtFPL_uid67_fpArccosXTest_b_6_q = cstAllZWE_uid12_fpArccosXTest_q ELSE "0";

    -- excXZAndExcYI_uid354_arcsinL_uid79_fpArccosXTest(LOGICAL,353)@13
    excXZAndExcYI_uid354_arcsinL_uid79_fpArccosXTest_q <= excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q and excI_y_uid311_arcsinL_uid79_fpArccosXTest_q;

    -- ZeroTimesInf_uid355_arcsinL_uid79_fpArccosXTest(LOGICAL,354)@13
    ZeroTimesInf_uid355_arcsinL_uid79_fpArccosXTest_q <= excXZAndExcYI_uid354_arcsinL_uid79_fpArccosXTest_q or excYZAndExcXI_uid353_arcsinL_uid79_fpArccosXTest_q;

    -- fracXIsNotZero_uid310_arcsinL_uid79_fpArccosXTest(LOGICAL,309)@13
    fracXIsNotZero_uid310_arcsinL_uid79_fpArccosXTest_q <= not (redist4_fracXIsZero_uid309_arcsinL_uid79_fpArccosXTest_q_2_q);

    -- excN_y_uid312_arcsinL_uid79_fpArccosXTest(LOGICAL,311)@13
    excN_y_uid312_arcsinL_uid79_fpArccosXTest_q <= expXIsMax_uid308_arcsinL_uid79_fpArccosXTest_q and fracXIsNotZero_uid310_arcsinL_uid79_fpArccosXTest_q;

    -- fracXIsNotZero_uid296_arcsinL_uid79_fpArccosXTest(LOGICAL,295)@13
    fracXIsNotZero_uid296_arcsinL_uid79_fpArccosXTest_q <= not (redist5_fracXIsZero_uid295_arcsinL_uid79_fpArccosXTest_q_6_q);

    -- excN_x_uid298_arcsinL_uid79_fpArccosXTest(LOGICAL,297)@13
    excN_x_uid298_arcsinL_uid79_fpArccosXTest_q <= expXIsMax_uid294_arcsinL_uid79_fpArccosXTest_q and fracXIsNotZero_uid296_arcsinL_uid79_fpArccosXTest_q;

    -- excRNaN_uid356_arcsinL_uid79_fpArccosXTest(LOGICAL,355)@13
    excRNaN_uid356_arcsinL_uid79_fpArccosXTest_q <= excN_x_uid298_arcsinL_uid79_fpArccosXTest_q or excN_y_uid312_arcsinL_uid79_fpArccosXTest_q or ZeroTimesInf_uid355_arcsinL_uid79_fpArccosXTest_q;

    -- invExcRNaN_uid368_arcsinL_uid79_fpArccosXTest(LOGICAL,367)@13
    invExcRNaN_uid368_arcsinL_uid79_fpArccosXTest_q <= not (excRNaN_uid356_arcsinL_uid79_fpArccosXTest_q);

    -- signY_uid287_arcsinL_uid79_fpArccosXTest(BITSELECT,286)@11
    signY_uid287_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(fpArcsinXO2XRes_uid77_fpArccosXTest_q(15 downto 15));

    -- signX_uid286_arcsinL_uid79_fpArccosXTest(BITSELECT,285)@7
    signX_uid286_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(RSqrt_uid257_sqrtFPL_uid64_fpArccosXTest_q(15 downto 15));

    -- redist6_signX_uid286_arcsinL_uid79_fpArccosXTest_b_4(DELAY,517)
    redist6_signX_uid286_arcsinL_uid79_fpArccosXTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid286_arcsinL_uid79_fpArccosXTest_b, xout => redist6_signX_uid286_arcsinL_uid79_fpArccosXTest_b_4_q, clk => clk, aclr => areset );

    -- signR_uid326_arcsinL_uid79_fpArccosXTest(LOGICAL,325)@11 + 1
    signR_uid326_arcsinL_uid79_fpArccosXTest_qi <= redist6_signX_uid286_arcsinL_uid79_fpArccosXTest_b_4_q xor signY_uid287_arcsinL_uid79_fpArccosXTest_b;
    signR_uid326_arcsinL_uid79_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid326_arcsinL_uid79_fpArccosXTest_qi, xout => signR_uid326_arcsinL_uid79_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist3_signR_uid326_arcsinL_uid79_fpArccosXTest_q_2(DELAY,514)
    redist3_signR_uid326_arcsinL_uid79_fpArccosXTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid326_arcsinL_uid79_fpArccosXTest_q, xout => redist3_signR_uid326_arcsinL_uid79_fpArccosXTest_q_2_q, clk => clk, aclr => areset );

    -- signRPostExc_uid369_arcsinL_uid79_fpArccosXTest(LOGICAL,368)@13 + 1
    signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_qi <= redist3_signR_uid326_arcsinL_uid79_fpArccosXTest_q_2_q and invExcRNaN_uid368_arcsinL_uid79_fpArccosXTest_q;
    signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_qi, xout => signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_q, clk => clk, aclr => areset );

    -- ofracY_uid321_arcsinL_uid79_fpArccosXTest(BITJOIN,320)@11
    ofracY_uid321_arcsinL_uid79_fpArccosXTest_q <= VCC_q & frac_y_uid306_arcsinL_uid79_fpArccosXTest_b;

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_notEnable(LOGICAL,573)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_nor(LOGICAL,574)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_nor_q <= not (redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_notEnable_q or redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q);

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_last(CONSTANT,570)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_last_q <= "01";

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmp(LOGICAL,571)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmp_q <= "1" WHEN redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_last_q = redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_q ELSE "0";

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg(REG,572)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg_q <= STD_LOGIC_VECTOR(redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmp_q);
        END IF;
    END PROCESS;

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena(REG,575)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_nor_q = "1") THEN
                redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_enaAnd(LOGICAL,576)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_enaAnd_q <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_sticky_ena_q and VCC_q;

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt(COUNTER,568)
    -- low=0, high=2, step=1, init=0
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq <= '1';
            ELSE
                redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq <= '0';
            END IF;
            IF (redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_eq = '1') THEN
                redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i + 2;
            ELSE
                redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_i, 2)));

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr(REG,569)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr_q <= STD_LOGIC_VECTOR(redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem(DUALMEM,567)
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ia <= STD_LOGIC_VECTOR(oSqrtFPLFrac_uid66_fpArccosXTest_q);
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_aa <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_wraddr_q;
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ab <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_rdcnt_q;
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_reset0 <= areset;
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 11,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_reset0,
        clock1 => clk,
        address_a => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_aa,
        data_a => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_ab,
        q_b => redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_iq
    );
    redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_q <= redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_iq(10 downto 0);

    -- prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma(CHAINMULTADD,496)@11 + 2
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_reset <= areset;
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena0 <= '1';
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena1 <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena0;
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_p(0) <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0(0) * prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_c0(0);
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_u(0) <= RESIZE(prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_p(0),22);
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_w(0) <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_u(0);
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_x(0) <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_w(0);
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_y(0) <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_x(0);
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena0 = '1') THEN
                prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_a0(0) <= RESIZE(UNSIGNED(redist20_oSqrtFPLFrac_uid66_fpArccosXTest_q_4_mem_q),11);
                prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_c0(0) <= RESIZE(UNSIGNED(ofracY_uid321_arcsinL_uid79_fpArccosXTest_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_ena1 = '1') THEN
                prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_s(0) <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_s(0)(21 downto 0)), xout => prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_qq(21 downto 0));

    -- osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest(BITSELECT,411)@13
    osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest_b <= prodXY_uid411_prod_uid325_arcsinL_uid79_fpArccosXTest_cma_q(21 downto 9);

    -- normalizeBit_uid327_arcsinL_uid79_fpArccosXTest(BITSELECT,326)@13
    normalizeBit_uid327_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest_b(12 downto 12));

    -- roundBitAndNormalizationOp_uid335_arcsinL_uid79_fpArccosXTest(BITJOIN,334)@13
    roundBitAndNormalizationOp_uid335_arcsinL_uid79_fpArccosXTest_q <= GND_q & normalizeBit_uid327_arcsinL_uid79_fpArccosXTest_b & cstAllZWF_uid10_fpArccosXTest_q & VCC_q;

    -- biasInc_uid323_arcsinL_uid79_fpArccosXTest(CONSTANT,322)
    biasInc_uid323_arcsinL_uid79_fpArccosXTest_q <= "0001111";

    -- expSum_uid322_arcsinL_uid79_fpArccosXTest(ADD,321)@13
    expSum_uid322_arcsinL_uid79_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & redist19_expSqrtFPL_uid67_fpArccosXTest_b_6_q);
    expSum_uid322_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR("0" & redist7_expY_uid285_arcsinL_uid79_fpArccosXTest_b_2_q);
    expSum_uid322_arcsinL_uid79_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid322_arcsinL_uid79_fpArccosXTest_a) + UNSIGNED(expSum_uid322_arcsinL_uid79_fpArccosXTest_b));
    expSum_uid322_arcsinL_uid79_fpArccosXTest_q <= expSum_uid322_arcsinL_uid79_fpArccosXTest_o(5 downto 0);

    -- expSumMBias_uid324_arcsinL_uid79_fpArccosXTest(SUB,323)@13
    expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & expSum_uid322_arcsinL_uid79_fpArccosXTest_q));
    expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 7 => biasInc_uid323_arcsinL_uid79_fpArccosXTest_q(6)) & biasInc_uid323_arcsinL_uid79_fpArccosXTest_q));
    expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_a) - SIGNED(expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_b));
    expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_q <= expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_o(7 downto 0);

    -- fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest(BITSELECT,328)@13
    fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_in <= osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest_b(11 downto 0);
    fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_b <= fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_in(11 downto 1);

    -- fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest(BITSELECT,329)@13
    fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_in <= osig_uid412_prod_uid325_arcsinL_uid79_fpArccosXTest_b(10 downto 0);
    fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_b <= fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_in(10 downto 0);

    -- fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest(MUX,330)@13
    fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_s <= normalizeBit_uid327_arcsinL_uid79_fpArccosXTest_b;
    fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_combproc: PROCESS (fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_s, fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_b, fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_b)
    BEGIN
        CASE (fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_s) IS
            WHEN "0" => fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_q <= fracRPostNormLow_uid330_arcsinL_uid79_fpArccosXTest_b;
            WHEN "1" => fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_q <= fracRPostNormHigh_uid329_arcsinL_uid79_fpArccosXTest_b;
            WHEN OTHERS => fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracPreRound_uid333_arcsinL_uid79_fpArccosXTest(BITJOIN,332)@13
    expFracPreRound_uid333_arcsinL_uid79_fpArccosXTest_q <= expSumMBias_uid324_arcsinL_uid79_fpArccosXTest_q & fracRPostNorm_uid331_arcsinL_uid79_fpArccosXTest_q;

    -- expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest(ADD,335)@13
    expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => expFracPreRound_uid333_arcsinL_uid79_fpArccosXTest_q(18)) & expFracPreRound_uid333_arcsinL_uid79_fpArccosXTest_q));
    expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & roundBitAndNormalizationOp_uid335_arcsinL_uid79_fpArccosXTest_q));
    expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_a) + SIGNED(expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_b));
    expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_q <= expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_o(19 downto 0);

    -- expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest(BITSELECT,337)@13
    expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_q(19 downto 11));

    -- expRPreExc_uid339_arcsinL_uid79_fpArccosXTest(BITSELECT,338)@13
    expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_in <= expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b(4 downto 0);
    expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_b <= expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_in(4 downto 0);

    -- expOvf_uid342_arcsinL_uid79_fpArccosXTest(COMPARE,341)@13
    expOvf_uid342_arcsinL_uid79_fpArccosXTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b(8)) & expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b));
    expOvf_uid342_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid9_fpArccosXTest_q));
    expOvf_uid342_arcsinL_uid79_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid342_arcsinL_uid79_fpArccosXTest_a) - SIGNED(expOvf_uid342_arcsinL_uid79_fpArccosXTest_b));
    expOvf_uid342_arcsinL_uid79_fpArccosXTest_n(0) <= not (expOvf_uid342_arcsinL_uid79_fpArccosXTest_o(10));

    -- invExpXIsMax_uid313_arcsinL_uid79_fpArccosXTest(LOGICAL,312)@13
    invExpXIsMax_uid313_arcsinL_uid79_fpArccosXTest_q <= not (expXIsMax_uid308_arcsinL_uid79_fpArccosXTest_q);

    -- InvExpXIsZero_uid314_arcsinL_uid79_fpArccosXTest(LOGICAL,313)@13
    InvExpXIsZero_uid314_arcsinL_uid79_fpArccosXTest_q <= not (excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q);

    -- excR_y_uid315_arcsinL_uid79_fpArccosXTest(LOGICAL,314)@13
    excR_y_uid315_arcsinL_uid79_fpArccosXTest_q <= InvExpXIsZero_uid314_arcsinL_uid79_fpArccosXTest_q and invExpXIsMax_uid313_arcsinL_uid79_fpArccosXTest_q;

    -- invExpXIsMax_uid299_arcsinL_uid79_fpArccosXTest(LOGICAL,298)@13
    invExpXIsMax_uid299_arcsinL_uid79_fpArccosXTest_q <= not (expXIsMax_uid294_arcsinL_uid79_fpArccosXTest_q);

    -- InvExpXIsZero_uid300_arcsinL_uid79_fpArccosXTest(LOGICAL,299)@13
    InvExpXIsZero_uid300_arcsinL_uid79_fpArccosXTest_q <= not (excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q);

    -- excR_x_uid301_arcsinL_uid79_fpArccosXTest(LOGICAL,300)@13
    excR_x_uid301_arcsinL_uid79_fpArccosXTest_q <= InvExpXIsZero_uid300_arcsinL_uid79_fpArccosXTest_q and invExpXIsMax_uid299_arcsinL_uid79_fpArccosXTest_q;

    -- ExcROvfAndInReg_uid351_arcsinL_uid79_fpArccosXTest(LOGICAL,350)@13
    ExcROvfAndInReg_uid351_arcsinL_uid79_fpArccosXTest_q <= excR_x_uid301_arcsinL_uid79_fpArccosXTest_q and excR_y_uid315_arcsinL_uid79_fpArccosXTest_q and expOvf_uid342_arcsinL_uid79_fpArccosXTest_n;

    -- excYRAndExcXI_uid350_arcsinL_uid79_fpArccosXTest(LOGICAL,349)@13
    excYRAndExcXI_uid350_arcsinL_uid79_fpArccosXTest_q <= excR_y_uid315_arcsinL_uid79_fpArccosXTest_q and excI_x_uid297_arcsinL_uid79_fpArccosXTest_q;

    -- excXRAndExcYI_uid349_arcsinL_uid79_fpArccosXTest(LOGICAL,348)@13
    excXRAndExcYI_uid349_arcsinL_uid79_fpArccosXTest_q <= excR_x_uid301_arcsinL_uid79_fpArccosXTest_q and excI_y_uid311_arcsinL_uid79_fpArccosXTest_q;

    -- excXIAndExcYI_uid348_arcsinL_uid79_fpArccosXTest(LOGICAL,347)@13
    excXIAndExcYI_uid348_arcsinL_uid79_fpArccosXTest_q <= excI_x_uid297_arcsinL_uid79_fpArccosXTest_q and excI_y_uid311_arcsinL_uid79_fpArccosXTest_q;

    -- excRInf_uid352_arcsinL_uid79_fpArccosXTest(LOGICAL,351)@13
    excRInf_uid352_arcsinL_uid79_fpArccosXTest_q <= excXIAndExcYI_uid348_arcsinL_uid79_fpArccosXTest_q or excXRAndExcYI_uid349_arcsinL_uid79_fpArccosXTest_q or excYRAndExcXI_uid350_arcsinL_uid79_fpArccosXTest_q or ExcROvfAndInReg_uid351_arcsinL_uid79_fpArccosXTest_q;

    -- expUdf_uid340_arcsinL_uid79_fpArccosXTest(COMPARE,339)@13
    expUdf_uid340_arcsinL_uid79_fpArccosXTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & GND_q));
    expUdf_uid340_arcsinL_uid79_fpArccosXTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b(8)) & expRPreExcExt_uid338_arcsinL_uid79_fpArccosXTest_b));
    expUdf_uid340_arcsinL_uid79_fpArccosXTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid340_arcsinL_uid79_fpArccosXTest_a) - SIGNED(expUdf_uid340_arcsinL_uid79_fpArccosXTest_b));
    expUdf_uid340_arcsinL_uid79_fpArccosXTest_n(0) <= not (expUdf_uid340_arcsinL_uid79_fpArccosXTest_o(10));

    -- excZC3_uid346_arcsinL_uid79_fpArccosXTest(LOGICAL,345)@13
    excZC3_uid346_arcsinL_uid79_fpArccosXTest_q <= excR_x_uid301_arcsinL_uid79_fpArccosXTest_q and excR_y_uid315_arcsinL_uid79_fpArccosXTest_q and expUdf_uid340_arcsinL_uid79_fpArccosXTest_n;

    -- excYZAndExcXR_uid345_arcsinL_uid79_fpArccosXTest(LOGICAL,344)@13
    excYZAndExcXR_uid345_arcsinL_uid79_fpArccosXTest_q <= excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q and excR_x_uid301_arcsinL_uid79_fpArccosXTest_q;

    -- excXZAndExcYR_uid344_arcsinL_uid79_fpArccosXTest(LOGICAL,343)@13
    excXZAndExcYR_uid344_arcsinL_uid79_fpArccosXTest_q <= excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q and excR_y_uid315_arcsinL_uid79_fpArccosXTest_q;

    -- excXZAndExcYZ_uid343_arcsinL_uid79_fpArccosXTest(LOGICAL,342)@13
    excXZAndExcYZ_uid343_arcsinL_uid79_fpArccosXTest_q <= excZ_x_uid293_arcsinL_uid79_fpArccosXTest_q and excZ_y_uid307_arcsinL_uid79_fpArccosXTest_q;

    -- excRZero_uid347_arcsinL_uid79_fpArccosXTest(LOGICAL,346)@13
    excRZero_uid347_arcsinL_uid79_fpArccosXTest_q <= excXZAndExcYZ_uid343_arcsinL_uid79_fpArccosXTest_q or excXZAndExcYR_uid344_arcsinL_uid79_fpArccosXTest_q or excYZAndExcXR_uid345_arcsinL_uid79_fpArccosXTest_q or excZC3_uid346_arcsinL_uid79_fpArccosXTest_q;

    -- concExc_uid357_arcsinL_uid79_fpArccosXTest(BITJOIN,356)@13
    concExc_uid357_arcsinL_uid79_fpArccosXTest_q <= excRNaN_uid356_arcsinL_uid79_fpArccosXTest_q & excRInf_uid352_arcsinL_uid79_fpArccosXTest_q & excRZero_uid347_arcsinL_uid79_fpArccosXTest_q;

    -- excREnc_uid358_arcsinL_uid79_fpArccosXTest(LOOKUP,357)@13
    excREnc_uid358_arcsinL_uid79_fpArccosXTest_combproc: PROCESS (concExc_uid357_arcsinL_uid79_fpArccosXTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid357_arcsinL_uid79_fpArccosXTest_q) IS
            WHEN "000" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "01";
            WHEN "001" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "00";
            WHEN "010" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "10";
            WHEN "011" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "00";
            WHEN "100" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "11";
            WHEN "101" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "00";
            WHEN "110" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "00";
            WHEN "111" => excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid358_arcsinL_uid79_fpArccosXTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid367_arcsinL_uid79_fpArccosXTest(MUX,366)@13 + 1
    expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_s <= excREnc_uid358_arcsinL_uid79_fpArccosXTest_q;
    expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_s) IS
                WHEN "00" => expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
                WHEN "01" => expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= expRPreExc_uid339_arcsinL_uid79_fpArccosXTest_b;
                WHEN "10" => expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                WHEN "11" => expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
                WHEN OTHERS => expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest(BITSELECT,336)@13
    fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_in <= expFracRPostRounding_uid336_arcsinL_uid79_fpArccosXTest_q(10 downto 0);
    fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_b <= fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_in(10 downto 1);

    -- fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest(MUX,361)@13 + 1
    fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_s <= excREnc_uid358_arcsinL_uid79_fpArccosXTest_q;
    fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_s) IS
                WHEN "00" => fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                WHEN "01" => fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= fracRPreExc_uid337_arcsinL_uid79_fpArccosXTest_b;
                WHEN "10" => fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
                WHEN "11" => fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
                WHEN OTHERS => fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- R_uid370_arcsinL_uid79_fpArccosXTest(BITJOIN,369)@14
    R_uid370_arcsinL_uid79_fpArccosXTest_q <= signRPostExc_uid369_arcsinL_uid79_fpArccosXTest_q & expRPostExc_uid367_arcsinL_uid79_fpArccosXTest_q & fracRPostExc_uid362_arcsinL_uid79_fpArccosXTest_q;

    -- path1ResFP_uid99_fpArccosXTest(MUX,98)@14
    path1ResFP_uid99_fpArccosXTest_s <= redist24_singX_uid8_fpArccosXTest_b_14_q;
    path1ResFP_uid99_fpArccosXTest_combproc: PROCESS (path1ResFP_uid99_fpArccosXTest_s, R_uid370_arcsinL_uid79_fpArccosXTest_q, path1NegCaseUR_uid97_fpArccosXTest_q)
    BEGIN
        CASE (path1ResFP_uid99_fpArccosXTest_s) IS
            WHEN "0" => path1ResFP_uid99_fpArccosXTest_q <= R_uid370_arcsinL_uid79_fpArccosXTest_q;
            WHEN "1" => path1ResFP_uid99_fpArccosXTest_q <= path1NegCaseUR_uid97_fpArccosXTest_q;
            WHEN OTHERS => path1ResFP_uid99_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select(BITSELECT,501)@14
    fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_in <= path1ResFP_uid99_fpArccosXTest_q(14 downto 0);
    fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_b <= fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_in(9 downto 0);
    fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_c <= fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_in(14 downto 10);

    -- inputIsMax_uid51_fpArccosXTest(BITSELECT,50)@1
    inputIsMax_uid51_fpArccosXTest_b <= STD_LOGIC_VECTOR(rightShiftStage2_uid447_fxpX_uid50_fpArccosXTest_q(17 downto 17));

    -- redist23_inputIsMax_uid51_fpArccosXTest_b_13(DELAY,534)
    redist23_inputIsMax_uid51_fpArccosXTest_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => inputIsMax_uid51_fpArccosXTest_b, xout => redist23_inputIsMax_uid51_fpArccosXTest_b_13_q, clk => clk, aclr => areset );

    -- firstPath_uid53_fpArccosXTest(BITSELECT,52)@1
    firstPath_uid53_fpArccosXTest_b <= STD_LOGIC_VECTOR(y_uid52_fpArccosXTest_b(15 downto 15));

    -- redist22_firstPath_uid53_fpArccosXTest_b_13(DELAY,533)
    redist22_firstPath_uid53_fpArccosXTest_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstPath_uid53_fpArccosXTest_b, xout => redist22_firstPath_uid53_fpArccosXTest_b_13_q, clk => clk, aclr => areset );

    -- pathSelBits_uid118_fpArccosXTest(BITJOIN,117)@14
    pathSelBits_uid118_fpArccosXTest_q <= redist24_singX_uid8_fpArccosXTest_b_14_q & redist23_inputIsMax_uid51_fpArccosXTest_b_13_q & redist22_firstPath_uid53_fpArccosXTest_b_13_q;

    -- fracOutMuxSelEnc_uid119_fpArccosXTest(LOOKUP,118)@14
    fracOutMuxSelEnc_uid119_fpArccosXTest_combproc: PROCESS (pathSelBits_uid118_fpArccosXTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (pathSelBits_uid118_fpArccosXTest_q) IS
            WHEN "000" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "01";
            WHEN "001" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "00";
            WHEN "010" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "11";
            WHEN "011" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "11";
            WHEN "100" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "01";
            WHEN "101" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "00";
            WHEN "110" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "10";
            WHEN "111" => fracOutMuxSelEnc_uid119_fpArccosXTest_q <= "10";
            WHEN OTHERS => -- unreachable
                           fracOutMuxSelEnc_uid119_fpArccosXTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRCalc_uid127_fpArccosXTest(MUX,126)@14
    expRCalc_uid127_fpArccosXTest_s <= fracOutMuxSelEnc_uid119_fpArccosXTest_q;
    expRCalc_uid127_fpArccosXTest_combproc: PROCESS (expRCalc_uid127_fpArccosXTest_s, fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_c, fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_c, cstBiasP1_uid17_fpArccosXTest_q, cstAllZWE_uid12_fpArccosXTest_q)
    BEGIN
        CASE (expRCalc_uid127_fpArccosXTest_s) IS
            WHEN "00" => expRCalc_uid127_fpArccosXTest_q <= fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_c;
            WHEN "01" => expRCalc_uid127_fpArccosXTest_q <= fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_c;
            WHEN "10" => expRCalc_uid127_fpArccosXTest_q <= cstBiasP1_uid17_fpArccosXTest_q;
            WHEN "11" => expRCalc_uid127_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
            WHEN OTHERS => expRCalc_uid127_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid12_fpArccosXTest(CONSTANT,11)
    cstAllZWE_uid12_fpArccosXTest_q <= "00000";

    -- updatedY_uid37_fpArccosXTest(BITJOIN,36)@0
    updatedY_uid37_fpArccosXTest_q <= GND_q & cstAllZWF_uid10_fpArccosXTest_q;

    -- fracXIsZero_uid36_fpArccosXTest(LOGICAL,37)@0
    fracXIsZero_uid36_fpArccosXTest_a <= STD_LOGIC_VECTOR("0" & fracX_uid7_fpArccosXTest_b);
    fracXIsZero_uid36_fpArccosXTest_q <= "1" WHEN fracXIsZero_uid36_fpArccosXTest_a = updatedY_uid37_fpArccosXTest_q ELSE "0";

    -- invFracXIsZero_uid39_fpArccosXTest(LOGICAL,38)@0
    invFracXIsZero_uid39_fpArccosXTest_q <= not (fracXIsZero_uid36_fpArccosXTest_q);

    -- expEQ0_uid35_fpArccosXTest(LOGICAL,34)@0
    expEQ0_uid35_fpArccosXTest_q <= "1" WHEN expX_uid6_fpArccosXTest_b = cstBias_uid13_fpArccosXTest_q ELSE "0";

    -- expXZFracNotZero_uid40_fpArccosXTest(LOGICAL,39)@0
    expXZFracNotZero_uid40_fpArccosXTest_q <= expEQ0_uid35_fpArccosXTest_q and invFracXIsZero_uid39_fpArccosXTest_q;

    -- expGT0_uid34_fpArccosXTest(COMPARE,33)@0
    expGT0_uid34_fpArccosXTest_a <= STD_LOGIC_VECTOR("00" & cstBias_uid13_fpArccosXTest_q);
    expGT0_uid34_fpArccosXTest_b <= STD_LOGIC_VECTOR("00" & expX_uid6_fpArccosXTest_b);
    expGT0_uid34_fpArccosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expGT0_uid34_fpArccosXTest_a) - UNSIGNED(expGT0_uid34_fpArccosXTest_b));
    expGT0_uid34_fpArccosXTest_c(0) <= expGT0_uid34_fpArccosXTest_o(6);

    -- inputOutOfRange_uid41_fpArccosXTest(LOGICAL,40)@0
    inputOutOfRange_uid41_fpArccosXTest_q <= expGT0_uid34_fpArccosXTest_c or expXZFracNotZero_uid40_fpArccosXTest_q;

    -- expXIsMax_uid26_fpArccosXTest(LOGICAL,25)@0
    expXIsMax_uid26_fpArccosXTest_q <= "1" WHEN expX_uid6_fpArccosXTest_b = cstAllOWE_uid9_fpArccosXTest_q ELSE "0";

    -- invExpXIsMax_uid31_fpArccosXTest(LOGICAL,30)@0
    invExpXIsMax_uid31_fpArccosXTest_q <= not (expXIsMax_uid26_fpArccosXTest_q);

    -- excZ_x_uid25_fpArccosXTest(LOGICAL,24)@0
    excZ_x_uid25_fpArccosXTest_q <= "1" WHEN expX_uid6_fpArccosXTest_b = cstAllZWE_uid12_fpArccosXTest_q ELSE "0";

    -- InvExpXIsZero_uid32_fpArccosXTest(LOGICAL,31)@0
    InvExpXIsZero_uid32_fpArccosXTest_q <= not (excZ_x_uid25_fpArccosXTest_q);

    -- excR_x_uid33_fpArccosXTest(LOGICAL,32)@0
    excR_x_uid33_fpArccosXTest_q <= InvExpXIsZero_uid32_fpArccosXTest_q and invExpXIsMax_uid31_fpArccosXTest_q;

    -- xRegAndOutOfRange_uid128_fpArccosXTest(LOGICAL,127)@0
    xRegAndOutOfRange_uid128_fpArccosXTest_q <= excR_x_uid33_fpArccosXTest_q and inputOutOfRange_uid41_fpArccosXTest_q;

    -- fracXIsZero_uid27_fpArccosXTest(LOGICAL,26)@0
    fracXIsZero_uid27_fpArccosXTest_q <= "1" WHEN cstAllZWF_uid10_fpArccosXTest_q = fracX_uid7_fpArccosXTest_b ELSE "0";

    -- excI_x_uid29_fpArccosXTest(LOGICAL,28)@0
    excI_x_uid29_fpArccosXTest_q <= expXIsMax_uid26_fpArccosXTest_q and fracXIsZero_uid27_fpArccosXTest_q;

    -- fracXIsNotZero_uid28_fpArccosXTest(LOGICAL,27)@0
    fracXIsNotZero_uid28_fpArccosXTest_q <= not (fracXIsZero_uid27_fpArccosXTest_q);

    -- excN_x_uid30_fpArccosXTest(LOGICAL,29)@0
    excN_x_uid30_fpArccosXTest_q <= expXIsMax_uid26_fpArccosXTest_q and fracXIsNotZero_uid28_fpArccosXTest_q;

    -- excRNaN_uid129_fpArccosXTest(LOGICAL,128)@0 + 1
    excRNaN_uid129_fpArccosXTest_qi <= excN_x_uid30_fpArccosXTest_q or excI_x_uid29_fpArccosXTest_q or xRegAndOutOfRange_uid128_fpArccosXTest_q;
    excRNaN_uid129_fpArccosXTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid129_fpArccosXTest_qi, xout => excRNaN_uid129_fpArccosXTest_q, clk => clk, aclr => areset );

    -- redist15_excRNaN_uid129_fpArccosXTest_q_14(DELAY,526)
    redist15_excRNaN_uid129_fpArccosXTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid129_fpArccosXTest_q, xout => redist15_excRNaN_uid129_fpArccosXTest_q_14_q, clk => clk, aclr => areset );

    -- excSelBits_uid130_fpArccosXTest(BITJOIN,129)@14
    excSelBits_uid130_fpArccosXTest_q <= redist15_excRNaN_uid129_fpArccosXTest_q_14_q & GND_q & GND_q;

    -- outMuxSelEnc_uid131_fpArccosXTest(LOOKUP,130)@14
    outMuxSelEnc_uid131_fpArccosXTest_combproc: PROCESS (excSelBits_uid130_fpArccosXTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid130_fpArccosXTest_q) IS
            WHEN "000" => outMuxSelEnc_uid131_fpArccosXTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid131_fpArccosXTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid131_fpArccosXTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid131_fpArccosXTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid131_fpArccosXTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid131_fpArccosXTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid131_fpArccosXTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid131_fpArccosXTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid131_fpArccosXTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expRPostExc_uid134_fpArccosXTest(MUX,133)@14
    expRPostExc_uid134_fpArccosXTest_s <= outMuxSelEnc_uid131_fpArccosXTest_q;
    expRPostExc_uid134_fpArccosXTest_combproc: PROCESS (expRPostExc_uid134_fpArccosXTest_s, cstAllZWE_uid12_fpArccosXTest_q, expRCalc_uid127_fpArccosXTest_q, cstAllOWE_uid9_fpArccosXTest_q)
    BEGIN
        CASE (expRPostExc_uid134_fpArccosXTest_s) IS
            WHEN "00" => expRPostExc_uid134_fpArccosXTest_q <= cstAllZWE_uid12_fpArccosXTest_q;
            WHEN "01" => expRPostExc_uid134_fpArccosXTest_q <= expRCalc_uid127_fpArccosXTest_q;
            WHEN "10" => expRPostExc_uid134_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
            WHEN "11" => expRPostExc_uid134_fpArccosXTest_q <= cstAllOWE_uid9_fpArccosXTest_q;
            WHEN OTHERS => expRPostExc_uid134_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- piF_uid121_fpArccosXTest(BITSELECT,120)@14
    piF_uid121_fpArccosXTest_in <= pi_uid87_fpArccosXTest_q(13 downto 0);
    piF_uid121_fpArccosXTest_b <= piF_uid121_fpArccosXTest_in(13 downto 4);

    -- fracRCalc_uid124_fpArccosXTest(MUX,123)@14
    fracRCalc_uid124_fpArccosXTest_s <= fracOutMuxSelEnc_uid119_fpArccosXTest_q;
    fracRCalc_uid124_fpArccosXTest_combproc: PROCESS (fracRCalc_uid124_fpArccosXTest_s, fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_b, fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_b, piF_uid121_fpArccosXTest_b, cstAllZWF_uid10_fpArccosXTest_q)
    BEGIN
        CASE (fracRCalc_uid124_fpArccosXTest_s) IS
            WHEN "00" => fracRCalc_uid124_fpArccosXTest_q <= fracPath1ResFP_uid123_fpArccosXTest_merged_bit_select_b;
            WHEN "01" => fracRCalc_uid124_fpArccosXTest_q <= fracPath2ResFP_uid122_fpArccosXTest_merged_bit_select_b;
            WHEN "10" => fracRCalc_uid124_fpArccosXTest_q <= piF_uid121_fpArccosXTest_b;
            WHEN "11" => fracRCalc_uid124_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
            WHEN OTHERS => fracRCalc_uid124_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid133_fpArccosXTest(MUX,132)@14
    fracRPostExc_uid133_fpArccosXTest_s <= outMuxSelEnc_uid131_fpArccosXTest_q;
    fracRPostExc_uid133_fpArccosXTest_combproc: PROCESS (fracRPostExc_uid133_fpArccosXTest_s, cstAllZWF_uid10_fpArccosXTest_q, fracRCalc_uid124_fpArccosXTest_q, cstNaNWF_uid11_fpArccosXTest_q)
    BEGIN
        CASE (fracRPostExc_uid133_fpArccosXTest_s) IS
            WHEN "00" => fracRPostExc_uid133_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
            WHEN "01" => fracRPostExc_uid133_fpArccosXTest_q <= fracRCalc_uid124_fpArccosXTest_q;
            WHEN "10" => fracRPostExc_uid133_fpArccosXTest_q <= cstAllZWF_uid10_fpArccosXTest_q;
            WHEN "11" => fracRPostExc_uid133_fpArccosXTest_q <= cstNaNWF_uid11_fpArccosXTest_q;
            WHEN OTHERS => fracRPostExc_uid133_fpArccosXTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sR_uid135_fpArccosXTest(BITJOIN,134)@14
    sR_uid135_fpArccosXTest_q <= GND_q & expRPostExc_uid134_fpArccosXTest_q & fracRPostExc_uid133_fpArccosXTest_q;

    -- xOut(GPOUT,4)@14
    q <= sR_uid135_fpArccosXTest_q;

END normal;
