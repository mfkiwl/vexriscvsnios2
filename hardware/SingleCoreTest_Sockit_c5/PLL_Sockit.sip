set_global_assignment -entity "PLL_Sockit" -library "lib_PLL_Sockit" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_Sockit" -library "lib_PLL_Sockit" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "PLL_Sockit" -library "lib_PLL_Sockit" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_Sockit" -name SPD_FILE [file join $::quartus(sip_path) "PLL_Sockit.spd"]

set_global_assignment -library "lib_PLL_Sockit" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Sockit_sim/PLL_Sockit.vo"]
