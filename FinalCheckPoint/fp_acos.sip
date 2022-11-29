set_global_assignment -entity "fp_acos" -library "lib_fp_acos" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_acos" -library "lib_fp_acos" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_acos" -library "lib_fp_acos" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_acos" -name SPD_FILE [file join $::quartus(sip_path) "fp_acos.spd"]

set_global_assignment -library "lib_fp_acos" -name MISC_FILE [file join $::quartus(sip_path) "fp_acos_sim/fp_acos.vo"]
