new_project -name master_example -folder {C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/precision_work}
new_impl -name master_example_altera_impl
set_input_dir {C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/precision_work}
setup_design -design=master_example
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/master_example.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_irq_mapper.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_width_adapter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_address_alignment.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_burst_uncompressor.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_arbitrator.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_rsp_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_cmd_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_burst_adapter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_burst_adapter_13_1.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_burst_adapter_new.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_incr_burst_converter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_wrap_burst_converter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_default_burst_converter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_avalon_st_pipeline_stage.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_avalon_st_pipeline_base.v}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_traffic_limiter.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_reorder_memory.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_avalon_sc_fifo.v}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2_router.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_slave_agent.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_master_agent.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_slave_translator.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_merlin_master_translator.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_avalon_st_clock_crosser.v}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_std_synchronizer_nocut.v}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_rsp_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_cmd_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1_router.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_002_error_adapter_0.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux_004.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux_002.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux_003.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux_002.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_rsp_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux_002.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_mux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_004.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_003.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_002.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_cmd_demux.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_009.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_008.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_007.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_006.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_004.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_002.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router_001.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_router.sv}}
add_input_file -format systemverilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/custom_master_slave.sv}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/amm_master_qsys_with_pcie.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_reset_controller.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_reset_synchronizer.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_2.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_1.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_mm_interconnect_0_avalon_st_adapter_002.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_up_avalon_video_vga_timing.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_video_vga_controller_0.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_video_rgb_resampler_0.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_video_pixel_buffer_dma_0.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_video_dual_clock_buffer_0.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_sgdma.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_sdram.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_pcie_ip.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_pipe_interface.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_pcie_reconfig_bridge.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altera_pcie_hard_ip_reset_controller.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_rs_serdes.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_pll_100_250.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_pll_125_250.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_pcie_ip_altgx_internal.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpcie_hip_pipen1b_qsys.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_a2p_addrtrans.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_a2p_fixtrans.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_a2p_vartrans.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_app.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_control_register.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_cfg_status.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_cr_avalon.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_cr_interrupt.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_cr_mailbox.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_p2a_addrtrans.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_reg_fifo.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_rx.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_rx_cntrl.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_rx_resp.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_tx.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_tx_cntrl.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_txavl_cntrl.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_stif_txresp_cntrl.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_clksync.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/altpciexpav_lite_app.v}}
add_input_file -format verilog {{C:/Users/lucas/Documents/FPGA/de2i150/demo_master_slave/amm_master_qsys_with_pcie/synthesis/submodules/amm_master_qsys_with_pcie_altpll_qsys.v}}
setup_design -manufacturer ALTERA -family {CYCLONE IV GX}  -part {EP4CGX150DF31C} -speed {7} 
setup_design -edif=TRUE
setup_design -addio=TRUE
setup_design -basename master_example
setup_design -input_delay=0
if [catch {compile} err] {
	puts "Error: Errors found during compilation with Precision Synthesis tool"
	exit -force
} else {
	puts "report_status 20"
	puts "report_status 22"
	if [catch {synthesize} err] {
		puts "Error: Errors found during synthesis with Precision Synthesis tool"
		exit -force
	}
	puts "report_status 90"
	report_timing -all_clocks
	puts "report_status 92"
}
save_impl
puts "report_status 96"
close_project
