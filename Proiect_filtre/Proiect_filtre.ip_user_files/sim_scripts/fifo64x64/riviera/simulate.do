onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+fifo64x64 -L xil_defaultlib -L secureip -O5 xil_defaultlib.fifo64x64

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {fifo64x64.udo}

run -all

endsim

quit -force
