# minimal sdc

# input clocks
create_clock -name "CLOCK_50" -period 20.000ns [get_ports {CLOCK_50}]

# automatically constrain PLL on other generated clocks
derive_pll_clocks -create_base_clocks

# automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

