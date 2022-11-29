set_global_assignment -entity "fp_atan2" -library "lib_fp_atan2" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_atan2" -library "lib_fp_atan2" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_atan2" -library "lib_fp_atan2" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_atan2" -name SPD_FILE [file join $::quartus(sip_path) "fp_atan2.spd"]

set_global_assignment -library "lib_fp_atan2" -name MISC_FILE [file join $::quartus(sip_path) "fp_atan2_sim/fp_atan2.vo"]
