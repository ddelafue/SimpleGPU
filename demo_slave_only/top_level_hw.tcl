# TCL File Generated by Component Editor 14.0
# Mon Aug 10 11:44:11 EDT 2015
# DO NOT MODIFY


# 
# top_level "ahb slave top level module" v1.0
#  2015.08.10.11:44:11
# 
# 

# 
# request TCL package from ACDS 14.0
# 
package require -exact qsys 14.0


# 
# module top_level
# 
set_module_property DESCRIPTION ""
set_module_property NAME top_level
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "ahb slave top level module"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL top_level
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_level.sv SYSTEM_VERILOG PATH top_level.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL top_level
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_level.sv SYSTEM_VERILOG PATH top_level.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point ahb_slave
# 
add_interface ahb_slave ahb end
set_interface_property ahb_slave associatedClock clock
set_interface_property ahb_slave associatedReset reset
set_interface_property ahb_slave ENABLED true
set_interface_property ahb_slave EXPORT_OF ""
set_interface_property ahb_slave PORT_NAME_MAP ""
set_interface_property ahb_slave CMSIS_SVD_VARIABLES ""
set_interface_property ahb_slave SVD_ADDRESS_GROUP ""

add_interface_port ahb_slave HSEL hsel Input 1
add_interface_port ahb_slave HADDR haddr Input 32
add_interface_port ahb_slave HWRITE hwrite Input 1
add_interface_port ahb_slave HSIZE hsize Input 3
add_interface_port ahb_slave HBURST hburst Input 3
add_interface_port ahb_slave HPROT hprot Input 4
add_interface_port ahb_slave HTRANS htrans Input 2
add_interface_port ahb_slave HREADY hreadyin Input 1
add_interface_port ahb_slave HWDATA hwdata Input 32
add_interface_port ahb_slave HREADYOUT hready Output 1
add_interface_port ahb_slave HRESP hresp Output 2
add_interface_port ahb_slave HRDATA hrdata Output 32

