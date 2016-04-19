# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {edge_detect.sv eop_detect.sv decode.sv rx_fifo.sv shift_register.sv rcu.sv timer.sv sync_high.sv sync_low.sv flex_counter.sv flex_stp_sr.sv usb_receiver.sv}
elaborate usb_receiver -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/usb_receiver.rep
report_area >> reports/usb_receiver.rep
report_power -hier >> reports/usb_receiver.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/usb_receiver.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
