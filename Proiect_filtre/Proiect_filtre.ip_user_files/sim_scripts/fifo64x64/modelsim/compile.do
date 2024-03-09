vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93 \
"../../../../Proiect_filtre.gen/sources_1/ip/fifo64x64/fifo64x64_sim_netlist.vhdl" \


