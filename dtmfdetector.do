vcom -reportprogress 300 -work work {C:/RIT/309-720/project/behv/dtmfdetector/dtmfdetector.vhd} {C:/RIT/309-720/project/behv/dtmfdetector/TB.vhd}
vsim work.tb_vhd
view wave
add wave sim:/tb_vhd/clk
add wave sim:/tb_vhd/enable
add wave sim:/tb_vhd/reset
add wave sim:/tb_vhd/sample
add wave sim:/tb_vhd/output
add wave sim:/tb_vhd/done
run 65 us