quit -sim
vcom ../src/CLK_DIV.vhd
vcom ../src/CLK_DIV_tb.vhd
vsim CLK_DIV_tb
add wave -group CLK_DIV CLK_DIV_tb/dut/*
add wave *
config wave -signalnamewidth 1
run 10000ns
