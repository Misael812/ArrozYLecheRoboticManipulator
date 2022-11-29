set_global_assignment -entity "fp_Div" -library "lib_fp_Div" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_Div" -library "lib_fp_Div" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_Div" -library "lib_fp_Div" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_Div" -name SPD_FILE [file join $::quartus(sip_path) "fp_Div.spd"]

set_global_assignment -library "lib_fp_Div" -name MISC_FILE [file join $::quartus(sip_path) "fp_Div_sim/fp_Div_memoryC0_uid146_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_Div" -name MISC_FILE [file join $::quartus(sip_path) "fp_Div_sim/fp_Div_memoryC1_uid149_invTables_lutmem.hex"]
set_global_assignment -library "lib_fp_Div" -name MISC_FILE [file join $::quartus(sip_path) "fp_Div_sim/fp_Div.vo"]
