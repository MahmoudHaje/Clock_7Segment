quit -sim
vcom ../src/COUNTER_2_DIGITS.vhd
vcom ../src/COUNTER_2_DIGITS_tb.vhd
vsim COUNTER_2_DIGITS_tb
add wave -group COUNTER_2_DIGITS COUNTER_2_DIGITS_tb/dut/*
add wave *
config wave -signalnamewidth 1
run 10000ns
