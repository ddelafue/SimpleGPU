
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
# vcsmx - auto-generated simulation script

# ----------------------------------------
# This script can be used to simulate the following IP:
#     amm_master_qsys_with_pcie
# To create a top-level simulation script which compiles other
# IP, and manages other system issues, copy the following template
# and adapt it to your needs:
# 
# # Start of template
# # If the copied and modified template file is "vcsmx_sim.sh", run it as:
# #   ./vcsmx_sim.sh
# #
# # Do the file copy, dev_com and com steps
# source vcsmx_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1
# 
# # Compile the top level module
# vlogan +v2k +systemverilogext+.sv "$QSYS_SIMDIR/../top.sv"
# 
# # Do the elaboration and sim steps
# # Override the top-level name
# # Override the user-defined sim options, so the simulation runs 
# # forever (until $finish()).
# source vcsmx_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME="'-top top'" \
# USER_DEFINED_SIM_OPTIONS=""
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
# ACDS 15.1 185 win32 2015.12.06.12:40:51
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="amm_master_qsys_with_pcie"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera_lite/15.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/avalon_st_adapter_001/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/sgdma_m_read_to_sdram_s1_cmd_width_adapter/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_demux_001/
mkdir -p ./libraries/cmd_mux_001/
mkdir -p ./libraries/cmd_demux_003/
mkdir -p ./libraries/cmd_demux_002/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/sdram_s1_burst_adapter/
mkdir -p ./libraries/sgdma_m_read_limiter/
mkdir -p ./libraries/router_006/
mkdir -p ./libraries/router_005/
mkdir -p ./libraries/router_003/
mkdir -p ./libraries/sdram_s1_agent_rsp_fifo/
mkdir -p ./libraries/sdram_s1_agent/
mkdir -p ./libraries/custom_module_avalon_master_agent/
mkdir -p ./libraries/sdram_s1_translator/
mkdir -p ./libraries/custom_module_avalon_master_translator/
mkdir -p ./libraries/pipe_interface_internal/
mkdir -p ./libraries/reset_controller_internal/
mkdir -p ./libraries/altgx_internal/
mkdir -p ./libraries/pcie_internal_hip/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_2/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/sgdma/
mkdir -p ./libraries/sdram/
mkdir -p ./libraries/pcie_ip/
mkdir -p ./libraries/custom_module/
mkdir -p ./libraries/altpll_qsys/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneiv_hssi_ver/
mkdir -p ./libraries/cycloneiv_pcie_hip_ver/
mkdir -p ./libraries/cycloneiv_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"        -work altera_ver            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                 -work lpm_ver               
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                    -work sgate_ver             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                -work altera_mf_ver         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"            -work altera_lnsim_ver      
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.v"     -work cycloneiv_hssi_ver    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.v" -work cycloneiv_pcie_hip_ver
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.v"          -work cycloneiv_ver         
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                           
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                           
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_mux.sv"                               -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_demux.sv"                             -work rsp_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_mux.sv"                               -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_demux.sv"                             -work cmd_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router_001.sv"                            -work router_001                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router.sv"                                -work router                                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_mux.sv"                               -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_demux.sv"                             -work rsp_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_mux.sv"                               -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_demux.sv"                             -work cmd_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router_001.sv"                            -work router_001                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router.sv"                                -work router                                    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_001.v"                  -work avalon_st_adapter_001                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter                         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                           -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                     -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"                                                      -work crosser                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                                       -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                   -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                  -work sgdma_m_read_to_sdram_s1_cmd_width_adapter
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux_001.sv"                           -work rsp_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux_001.sv"                         -work rsp_demux_001                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux_001.sv"                           -work cmd_mux_001                               
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                          -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_003.sv"                         -work cmd_demux_003                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_002.sv"                         -work cmd_demux_002                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_001.sv"                         -work cmd_demux_001                             
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                                 
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                                       -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                                -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                                  -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                                   -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                                       -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                                       -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                                    -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                   -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                   -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work sdram_s1_burst_adapter                    
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                                     -work sgdma_m_read_limiter                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                                      -work sgdma_m_read_limiter                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                              -work sgdma_m_read_limiter                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                     -work sgdma_m_read_limiter                      
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_006.sv"                            -work router_006                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_005.sv"                            -work router_005                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_003.sv"                            -work router_003                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_001.sv"                            -work router_001                                
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router.sv"                                -work router                                    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                              -work sdram_s1_agent_rsp_fifo                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                         -work sdram_s1_agent                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                  -work sdram_s1_agent                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                        -work custom_module_avalon_master_agent         
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                    -work sdram_s1_translator                       
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                   -work custom_module_avalon_master_translator    
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_pipe_interface.v"                                                             -work pipe_interface_internal                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_pcie_reconfig_bridge.v"                                                       -work pipe_interface_internal                   
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_pcie_hard_ip_reset_controller.v"                                               -work reset_controller_internal                 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                                                  -work reset_controller_internal                 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_pll_100_250.v"                                                                -work reset_controller_internal                 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_pll_125_250.v"                                                                -work reset_controller_internal                 
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_pcie_ip_altgx_internal.vo"                                  -work altgx_internal                            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpciexpav_stif_app.v"                                                               -work pcie_internal_hip                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altpcie_hip_pipen1b_qsys.v"                                                           -work pcie_internal_hip                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                            -work rst_controller                            
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                          -work rst_controller                            
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_irq_mapper.sv"                                              -work irq_mapper                                
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_2.v"                                        -work mm_interconnect_2                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_1.v"                                        -work mm_interconnect_1                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_mm_interconnect_0.v"                                        -work mm_interconnect_0                         
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_sgdma.v"                                                    -work sgdma                                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_sdram.v"                                                    -work sdram                                     
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_pcie_ip.v"                                                  -work pcie_ip                                   
  vlogan +v2k -sverilog $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/custom_master_slave.sv"                                                               -work custom_module                             
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/submodules/amm_master_qsys_with_pcie_altpll_qsys.vo"                                             -work altpll_qsys                               
  vlogan +v2k $USER_DEFINED_COMPILE_OPTIONS           "$QSYS_SIMDIR/amm_master_qsys_with_pcie.v"                                                                                                                     
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
