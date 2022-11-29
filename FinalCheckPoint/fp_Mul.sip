set_global_assignment -entity "fp_Mul" -library "lib_fp_Mul" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_Mul" -library "lib_fp_Mul" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_Mul" -library "lib_fp_Mul" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_Mul" -name SPD_FILE [file join $::quartus(sip_path) "fp_Mul.spd"]

set_global_assignment -library "lib_fp_Mul" -name MISC_FILE [file join $::quartus(sip_path) "fp_Mul_sim/fp_Mul.vo"]
