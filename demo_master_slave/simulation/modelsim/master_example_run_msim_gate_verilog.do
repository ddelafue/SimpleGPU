transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {master_example_7_1200mv_85c_slow.vo}

vlog -sv -work work +incdir+C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/Custom\ Files {C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/Custom Files/tb_icb.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_mf_ver -L altera_ver -L lpm_ver -L sgate_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L gate_work -L work -voptargs="+acc"  icb

add wave *
view structure
view signals
run -all
