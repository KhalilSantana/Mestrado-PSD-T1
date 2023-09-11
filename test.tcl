vcom -2008 *.vhd
vsim mux2_1bit_tb
add wave *
run 10ns

vsim demux1_2bit_tb
add wave *
run 10ns

vsim circuito3_tb
add wave *
run 10ns