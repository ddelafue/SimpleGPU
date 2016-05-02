*******************************************************************************
	README - Brief description of the directory layout
*******************************************************************************


This directory has the following layout :

./
	SimpleGPUIP			- Folder containing all custom IPs
	demo_master_slave		- Folder containing the Quartus DE2i-150 FPGA project
	demo_images			- Folder containing images that the GPU actually rendered
	demo_scripts			- Folder containing python scripts used to convert from GPU output to a png file
	reports				- Folder containing all relevant Quartus reports and log files

The SimpleGPUIP folder has the following relevant files:
	AlphaBlender.sv			- Verilog code for the AlphaBlender module
	tb_AlphaBlender.sv		- Verilog test bench for the AlphaBlender module
	DrawLine.sv			- Verilog code for the DrawLine module
	tb_DrawLine.sv			- Verilog test bench for the DrawLine module
	GPU.sv				- Verilog code for the top level design file of the entire GPU module
	tb_GPU.sv			- Verilog test bench for the demonstrating the functionality of the GPU
	InputDecoder.sv			- Verilog code for the InputDecoder module
	tb_InputDecoder.sv		- Verilog test bench for the InputDecoder module
	InputDecoderRAM.sv		- A copy from the Altera RAM specification: http://www.altera.com/literature/hb/qts/qts_qii51007.pdf page 775
	InputDecoder_fifo_RAM.sv	- Verilog code for a fifo wrapper of the RAM (InputDecoder_fifo_RAM module)
	tb_InputDecoder_fifo_RAM.sv	- Verilog test bench for the InputDecoder_fifo_RAM module
	OutputController.sv		- Verilog code for the OutputController module
	tb_OutputController.sv		- Verilog test bench for the OutputController module
	OutputControllerRAM.sv		- A copy from the Altera RAM specification: http://www.altera.com/literature/hb/qts/qts_qii51007.pdf page 774
	Rasteriser.sv			- Verilog code for the Rasteriser module
	tb_Rasteriser.sv		- Verilog test bench for the Rasteriser module
	TextureController.sv		- Verilog code for the TextureController module
	tb_TextureController.sv		- Verilog test bench for the TextureController module
	TextureControllerRAM.sv		- A copy from the Altera RAM specification: http://www.altera.com/literature/hb/qts/qts_qii51007.pdf page 774
	flex_counter.sv			- Verilog code for the flex_counter module

The demo_images folder has the following relevant files:
	demo_image1.png			- Demonstrates Design Specific Criteria #3
	demo_image6.png			- Demonstrates Design Specific Criteria #2
	demo_image9.png			- Demonstrates Design Specific Criteria #1

The reports folder has the following relevant files:
	connectivity_checks.rpt				- A log file showing the successful completion of Quartus connectivity checks
	pin_and_area_with_debug_signals.rpt		- A log file showing the pin count, register count, and logical element count of the design when debug signals are included.
	pin_and_area_without_debug_signals.rpt		- A log file showing the pin count, register count, and logical element count of the design when debug signals are not included (how it would be placed on the FPGA).
	synthesis_log.txt				- A log file demonstrating that the design synthensizes with Quartus's synthensizer.
	worst_case_paths.rpt				- A log file showing the 10 worst case timing paths.
	worst_case_paths_without_rasteriser_inputs	- A log file showing the 10 worst case timing paths when the signals x1, y1, x2, y2, x3, and y3 are not included as starting signals.
	worst_case_paths_without_rasteriser_inputs_or_inputdecoderRAM.rpt	- A log file showing the 10 worst case timing paths when the signals x1, y1, x2, y2, x3, and y3 are not included as starting signals and the InputDecoderRAM signals are not included as starting or ending signals.
