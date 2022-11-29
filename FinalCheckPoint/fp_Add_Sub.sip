set_global_assignment -entity "fp_Add_Sub" -library "lib_fp_Add_Sub" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_Add_Sub" -library "lib_fp_Add_Sub" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_Add_Sub" -library "lib_fp_Add_Sub" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_Add_Sub" -name SPD_FILE [file join $::quartus(sip_path) "fp_Add_Sub.spd"]

set_global_assignment -library "lib_fp_Add_Sub" -name MISC_FILE [file join $::quartus(sip_path) "fp_Add_Sub_sim/fp_Add_Sub.vo"]
