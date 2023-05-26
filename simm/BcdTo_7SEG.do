quit -sim
vcom ../src/BcdTo_7SEG.vhd
vcom ../src/BcdTo_7SEG_tb.vhd
vsim BcdTo_7SEG_tb
add wave -group CLK_DIV BcdTo_7SEG_tb/dut/*
add wave *
config wave -signalnamewidth 1
run 10000ns

