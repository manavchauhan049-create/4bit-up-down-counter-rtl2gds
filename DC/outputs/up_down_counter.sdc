###################################################################

# Created by write_sdc on Sun Apr  5 05:01:22 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
create_clock [get_ports Clock]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.2  [get_clocks Clock]
set_clock_transition -max -rise 0.1 [get_clocks Clock]
set_clock_transition -max -fall 0.1 [get_clocks Clock]
set_clock_transition -min -rise 0.1 [get_clocks Clock]
set_clock_transition -min -fall 0.1 [get_clocks Clock]
set_input_delay -clock Clock  2  [get_ports Clock]
set_input_delay -clock Clock  2  [get_ports rst]
set_input_delay -clock Clock  2  [get_ports up_down]
set_output_delay -clock Clock  2  [get_ports {count[3]}]
set_output_delay -clock Clock  2  [get_ports {count[2]}]
set_output_delay -clock Clock  2  [get_ports {count[1]}]
set_output_delay -clock Clock  2  [get_ports {count[0]}]
