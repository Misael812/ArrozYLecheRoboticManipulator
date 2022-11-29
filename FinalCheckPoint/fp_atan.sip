set_global_assignment -entity "fp_atan" -library "lib_fp_atan" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_atan" -library "lib_fp_atan" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_atan" -library "lib_fp_atan" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_atan" -name SPD_FILE [file join $::quartus(sip_path) "fp_atan.spd"]

set_global_assignment -library "lib_fp_atan" -name MISC_FILE [file join $::quartus(sip_path) "fp_atan_sim/fp_atan.vo"]
