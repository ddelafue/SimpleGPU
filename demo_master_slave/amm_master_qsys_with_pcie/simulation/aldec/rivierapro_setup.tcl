
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 15.1 185 win32 2015.12.06.12:40:51
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script can be used to simulate the following IP:
#     amm_master_qsys_with_pcie
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "aldec.do", run it as:
# #   vsim -c -do aldec.do
# #
# # Source the generated sim script
# source rivierapro_setup.tcl
# # Compile eda/sim_lib contents first
# dev_com
# # Override the top-level name (so that elab is useful)
# set TOP_LEVEL_NAME top
# # Compile the standalone IP.
# com
# # Compile the user top-level
# vlog -sv2k5 ../../top.sv
# # Elaborate the design.
# elab
# # Run the simulation
# run
# # Report success to the shell
# exit -code 0
# # End of template
# ----------------------------------------
# If amm_master_qsys_with_pcie is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "amm_master_qsys_with_pcie"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera_lite/15.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                        ./libraries/altera_ver            
vmap       altera_ver             ./libraries/altera_ver            
ensure_lib                        ./libraries/lpm_ver               
vmap       lpm_ver                ./libraries/lpm_ver               
ensure_lib                        ./libraries/sgate_ver             
vmap       sgate_ver              ./libraries/sgate_ver             
ensure_lib                        ./libraries/altera_mf_ver         
vmap       altera_mf_ver          ./libraries/altera_mf_ver         
ensure_lib                        ./libraries/altera_lnsim_ver      
vmap       altera_lnsim_ver       ./libraries/altera_lnsim_ver      
ensure_lib                        ./libraries/cycloneiv_hssi_ver    
vmap       cycloneiv_hssi_ver     ./libraries/cycloneiv_hssi_ver    
ensure_lib                        ./libraries/cycloneiv_pcie_hip_ver
vmap       cycloneiv_pcie_hip_ver ./libraries/cycloneiv_pcie_hip_ver
ensure_lib                        ./libraries/cycloneiv_ver         
vmap       cycloneiv_ver          ./libraries/cycloneiv_ver         
ensure_lib                                            ./libraries/error_adapter_0                           
vmap       error_adapter_0                            ./libraries/error_adapter_0                           
ensure_lib                                            ./libraries/rsp_mux                                   
vmap       rsp_mux                                    ./libraries/rsp_mux                                   
ensure_lib                                            ./libraries/rsp_demux                                 
vmap       rsp_demux                                  ./libraries/rsp_demux                                 
ensure_lib                                            ./libraries/cmd_mux                                   
vmap       cmd_mux                                    ./libraries/cmd_mux                                   
ensure_lib                                            ./libraries/cmd_demux                                 
vmap       cmd_demux                                  ./libraries/cmd_demux                                 
ensure_lib                                            ./libraries/router_001                                
vmap       router_001                                 ./libraries/router_001                                
ensure_lib                                            ./libraries/router                                    
vmap       router                                     ./libraries/router                                    
ensure_lib                                            ./libraries/avalon_st_adapter_001                     
vmap       avalon_st_adapter_001                      ./libraries/avalon_st_adapter_001                     
ensure_lib                                            ./libraries/avalon_st_adapter                         
vmap       avalon_st_adapter                          ./libraries/avalon_st_adapter                         
ensure_lib                                            ./libraries/crosser                                   
vmap       crosser                                    ./libraries/crosser                                   
ensure_lib                                            ./libraries/sgdma_m_read_to_sdram_s1_cmd_width_adapter
vmap       sgdma_m_read_to_sdram_s1_cmd_width_adapter ./libraries/sgdma_m_read_to_sdram_s1_cmd_width_adapter
ensure_lib                                            ./libraries/rsp_mux_001                               
vmap       rsp_mux_001                                ./libraries/rsp_mux_001                               
ensure_lib                                            ./libraries/rsp_demux_001                             
vmap       rsp_demux_001                              ./libraries/rsp_demux_001                             
ensure_lib                                            ./libraries/cmd_mux_001                               
vmap       cmd_mux_001                                ./libraries/cmd_mux_001                               
ensure_lib                                            ./libraries/cmd_demux_003                             
vmap       cmd_demux_003                              ./libraries/cmd_demux_003                             
ensure_lib                                            ./libraries/cmd_demux_002                             
vmap       cmd_demux_002                              ./libraries/cmd_demux_002                             
ensure_lib                                            ./libraries/cmd_demux_001                             
vmap       cmd_demux_001                              ./libraries/cmd_demux_001                             
ensure_lib                                            ./libraries/sdram_s1_burst_adapter                    
vmap       sdram_s1_burst_adapter                     ./libraries/sdram_s1_burst_adapter                    
ensure_lib                                            ./libraries/sgdma_m_read_limiter                      
vmap       sgdma_m_read_limiter                       ./libraries/sgdma_m_read_limiter                      
ensure_lib                                            ./libraries/router_006                                
vmap       router_006                                 ./libraries/router_006                                
ensure_lib                                            ./libraries/router_005                                
vmap       router_005                                 ./libraries/router_005                                
ensure_lib                                            ./libraries/router_003                                
vmap       router_003                                 ./libraries/router_003                                
ensure_lib                                            ./libraries/sdram_s1_agent_rsp_fifo                   
vmap       sdram_s1_agent_rsp_fifo                    ./libraries/sdram_s1_agent_rsp_fifo                   
ensure_lib                                            ./libraries/sdram_s1_agent                            
vmap       sdram_s1_agent                             ./libraries/sdram_s1_agent                            
ensure_lib                                            ./libraries/custom_module_avalon_master_agent         
vmap       custom_module_avalon_master_agent          ./libraries/custom_module_avalon_master_agent         
ensure_lib                                            ./libraries/sdram_s1_translator                       
vmap       sdram_s1_translator                        ./libraries/sdram_s1_translator                       
ensure_lib                                            ./libraries/custom_module_avalon_master_translator    
vmap       custom_module_avalon_master_translator     ./libraries/custom_module_avalon_master_translator    
ensure_lib                                            ./libraries/pipe_interface_internal                   
vmap       pipe_interface_internal                    ./libraries/pipe_interface_internal                   
ensure_lib                                            ./libraries/reset_controller_internal                 
vmap       reset_controller_internal                  ./libraries/reset_controller_internal                 
ensure_lib                                            ./libraries/altgx_internal                            
vmap       altgx_internal                             ./libraries/altgx_internal                            
ensure_lib                                            ./libraries/pcie_internal_hip                         
vmap       pcie_internal_hip                          ./libraries/pcie_internal_hip                         
ensure_lib                                            ./libraries/rst_controller                            
vmap       rst_controller                             ./libraries/rst_controller                            
ensure_lib                                            ./libraries/irq_mapper                                
vmap       irq_mapper                                 ./libraries/irq_mapper                                
ensure_lib                                            ./libraries/mm_interconnect_2                         
vmap       mm_interconnect_2                          ./libraries/mm_interconnect_2                         
ensure_lib                                            ./libraries/mm_interconnect_1                         
vmap       mm_interconnect_1                          ./libraries/mm_interconnect_1                         
ensure_lib                                            ./libraries/mm_interconnect_0                         
vmap       mm_interconnect_0                          ./libraries/mm_interconnect_0                         
ensure_lib                                            ./libraries/sgdma                                     
vmap       sgdma                                      ./libraries/sgdma                                     
ensure_lib                                            ./libraries/sdram                                     
vmap       sdram                                      ./libraries/sdram                                     
ensure_lib                                            ./libraries/pcie_ip                                   
vmap       pcie_ip                                    ./libraries/pcie_ip                                   
ensure_lib                                            ./libraries/custom_module                             
vmap       custom_module                              ./libraries/custom_module                             
ensure_lib                                            ./libraries/altpll_qsys                               
vmap       altpll_qsys                                ./libraries/altpll_qsys                               

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"        -work altera_ver            
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                 -work lpm_ver               
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                    -work sgate_ver             
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                -work altera_mf_ver         
  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"            -work altera_lnsim_ver      
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.v"     -work cycloneiv_hssi_ver    
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.v" -work cycloneiv_pcie_hip_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.v"          -work cycloneiv_ver         
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                           
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_mux.sv"                               -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_demux.sv"                             -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_mux.sv"                               -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_demux.sv"                             -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router_001.sv"                            -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router.sv"                                -work router                                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router_001.sv"                            -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router.sv"                                -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_001.v"                  -work avalon_st_adapter_001                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter                         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                           -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                     -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                                      -work crosser                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                                       -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                   -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                  -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux_001.sv"                         -work rsp_demux_001                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux_001.sv"                           -work cmd_mux_001                               
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_003.sv"                         -work cmd_demux_003                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_002.sv"                         -work cmd_demux_002                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                             
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                                       -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                                -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                                  -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                                   -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                                       -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                                       -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                                    -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                   -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                   -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work sdram_s1_burst_adapter                    
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                                     -work sgdma_m_read_limiter                      
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                                      -work sgdma_m_read_limiter                      
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                              -work sgdma_m_read_limiter                      
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work sgdma_m_read_limiter                      
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_006.sv"                            -work router_006                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_005.sv"                            -work router_005                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_003.sv"                            -work router_003                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_001.sv"                            -work router_001                                
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router.sv"                                -work router                                    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                              -work sdram_s1_agent_rsp_fifo                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                         -work sdram_s1_agent                            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                  -work sdram_s1_agent                            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                        -work custom_module_avalon_master_agent         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                    -work sdram_s1_translator                       
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                   -work custom_module_avalon_master_translator    
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pipe_interface.v"                                                             -work pipe_interface_internal                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pcie_reconfig_bridge.v"                                                       -work pipe_interface_internal                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_pcie_hard_ip_reset_controller.v"                                               -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                                                  -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pll_100_250.v"                                                                -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_pll_125_250.v"                                                                -work reset_controller_internal                 
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_pcie_ip_altgx_internal.vo"                                  -work altgx_internal                            
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_addrtrans.v"                                   -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_fixtrans.v"                                    -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_a2p_vartrans.v"                                    -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_control_register.v"                                -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cfg_status.v"                                      -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_avalon.v"                                       -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_interrupt.v"                                    -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_cr_mailbox.v"                                      -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_p2a_addrtrans.v"                                   -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_reg_fifo.v"                                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx.v"                                              -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx_cntrl.v"                                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_rx_resp.v"                                         -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_tx.v"                                              -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_tx_cntrl.v"                                        -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_txavl_cntrl.v"                                     -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_stif_txresp_cntrl.v"                                    -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_stif/altpciexpav_clksync.v"                                              -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/aldec/avalon_lite/altpciexpav_lite_app.v"                                             -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpciexpav_stif_app.v"                                                               -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_hip_pipen1b_qsys.v"                                                           -work pcie_internal_hip                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                            -work rst_controller                            
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                          -work rst_controller                            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_irq_mapper.sv"                                              -work irq_mapper                                
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2.v"                                        -work mm_interconnect_2                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1.v"                                        -work mm_interconnect_1                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0.v"                                        -work mm_interconnect_0                         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_sgdma.v"                                                    -work sgdma                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_sdram.v"                                                    -work sdram                                     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_pcie_ip.v"                                                  -work pcie_ip                                   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/custom_master_slave.sv"                                                               -work custom_module                             
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_altpll_qsys.vo"                                             -work altpll_qsys                               
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/amm_master_qsys_with_pcie.v"                                                                                                                     
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_001 -L avalon_st_adapter -L crosser -L sgdma_m_read_to_sdram_s1_cmd_width_adapter -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_002 -L cmd_demux_001 -L sdram_s1_burst_adapter -L sgdma_m_read_limiter -L router_006 -L router_005 -L router_003 -L sdram_s1_agent_rsp_fifo -L sdram_s1_agent -L custom_module_avalon_master_agent -L sdram_s1_translator -L custom_module_avalon_master_translator -L pipe_interface_internal -L reset_controller_internal -L altgx_internal -L pcie_internal_hip -L rst_controller -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L sgdma -L sdram -L pcie_ip -L custom_module -L altpll_qsys -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_001 -L avalon_st_adapter -L crosser -L sgdma_m_read_to_sdram_s1_cmd_width_adapter -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_002 -L cmd_demux_001 -L sdram_s1_burst_adapter -L sgdma_m_read_limiter -L router_006 -L router_005 -L router_003 -L sdram_s1_agent_rsp_fifo -L sdram_s1_agent -L custom_module_avalon_master_agent -L sdram_s1_translator -L custom_module_avalon_master_translator -L pipe_interface_internal -L reset_controller_internal -L altgx_internal -L pcie_internal_hip -L rst_controller -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L sgdma -L sdram -L pcie_ip -L custom_module -L altpll_qsys -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
