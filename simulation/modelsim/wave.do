onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processador/Clock
add wave -noupdate /processador/Reset
add wave -noupdate /processador/func
add wave -noupdate /processador/w
add wave -noupdate /processador/Dado_In
add wave -noupdate /processador/R0_In
add wave -noupdate /processador/R0_Out
add wave -noupdate /processador/R1_In
add wave -noupdate /processador/R1_Out
add wave -noupdate /processador/R2_In
add wave -noupdate /processador/R2_Out
add wave -noupdate /processador/R3_In
add wave -noupdate /processador/R3_Out
add wave -noupdate /processador/RG_In
add wave -noupdate /processador/RG_Out
add wave -noupdate /processador/RA_In
add wave -noupdate /processador/Add_Sub
add wave -noupdate /processador/extern
add wave -noupdate /processador/done
add wave -noupdate /processador/Dado_Out
add wave -noupdate /processador/Dado0_Out
add wave -noupdate /processador/Dado1_Out
add wave -noupdate /processador/Dado2_Out
add wave -noupdate /processador/Dado3_Out
add wave -noupdate /processador/DadoA_Out
add wave -noupdate /processador/DadoG_Out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {738752 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {492388 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ns -endtime 2000ns sim:/processador/Clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 2000ns sim:/processador/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 100ns sim:/processador/Reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ns -endtime 2000ns Edit:/processador/Reset 
wave create -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 2000ns sim:/processador/w 
wave create -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 200ns sim:/processador/func 
wave create -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 2000ns sim:/processador/func 
wave create -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 2000ns sim:/processador/func 
WaveExpandAll -1
wave create -pattern constant -value 00 -range 1 0 -starttime 0ns -endtime 2000ns sim:/processador/w 
WaveExpandAll -1
wave edit change_value -start 200ns -end 300ns -value 1 Edit:/processador/func(0) 
wave edit change_value -start 300ps -end 600ps -value 1 Edit:/processador/func(1) 
wave edit change_value -start 300ns -end 600ns -value 1 Edit:/processador/func(1) 
wave edit change_value -start 600ns -end 900ns -value 1 Edit:/processador/func(1) 
wave edit change_value -start 600ns -end 900ns -value 1 Edit:/processador/func(0) 
wave edit change_value -start 400ns -end 500ns -value 1 Edit:/processador/w(0) 
wave edit change_value -start 500ns -end 600ns -value 1 Edit:/processador/w(1) 
wave edit change_value -start 700ns -end 800ns -value 1 Edit:/processador/w(0) 
wave edit change_value -start 800ns -end 900ns -value 1 Edit:/processador/w(1) 
wave create -pattern constant -value 10001010 -range 7 0 -starttime 0ns -endtime 2000ns sim:/processador/Dado_In 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
