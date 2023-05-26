quit -sim
vcom ../src/SEC_METER.vhd
vcom ../src/SEC_METER_tb.vhd
vsim SEC_METER_tb
add wave -group SEC_METER SEC_METER_tb/dut/*
add wave *
config wave -signalnamewidth 1
run 320000ns
