set_property ASYNC_REG true [get_cells in_d1_reg]
set_property ASYNC_REG true [get_cells out_reg]

create_clock -period 10.000 -name clk1 -waveform {0.000 5.000} [get_ports clk1]
create_clock -period 20.000 -name clk2 -waveform {0.000 10.000} [get_ports clk2]
create_clock -period 40.000 -name clk3 -waveform {0.000 20.000} [get_ports clk3]

set_input_delay -clock [get_clocks clk1] -min -add_delay 2.000 [get_ports in1]
set_input_delay -clock [get_clocks clk1] -max -add_delay 4.000 [get_ports in1]

set_input_delay -clock [get_clocks clk1] -min -add_delay 2.000 [get_ports in2]
set_input_delay -clock [get_clocks clk1] -max -add_delay 4.000 [get_ports in2]

set_output_delay -clock [get_clocks clk3] -min -add_delay 0.600 [get_ports out]
set_output_delay -clock [get_clocks clk3] -max -add_delay 2.300 [get_ports out]

set_clock_groups -asynchronous -group [get_clocks clk1] -group [get_clocks clk2] -group [get_clocks clk3]