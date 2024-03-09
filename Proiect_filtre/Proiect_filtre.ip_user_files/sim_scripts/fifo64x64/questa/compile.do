vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93 \
"../../../../Proiect_filtre.gen/sources_1/ip/fifo64x64/fifo64x64_sim_netlist.vhdl" \


