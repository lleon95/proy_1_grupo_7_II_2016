vsim -gui -L C:/Modeltech_pe_edu_10.4a/lib/unisim controlvga_tb1 unisim.glbl
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controlvga_tb1/Clock
add wave -noupdate /controlvga_tb1/reset
add wave -noupdate -color Orchid /controlvga_tb1/Up
add wave -noupdate -color Orchid /controlvga_tb1/Down
add wave -noupdate -color Orchid /controlvga_tb1/TC
add wave -noupdate -color Orchid /controlvga_tb1/Lp
add wave -noupdate -color {Medium Sea Green} -radix binary /controlvga_tb1/Azul
add wave -noupdate -color {Medium Sea Green} -radix binary /controlvga_tb1/Verde
add wave -noupdate -color {Medium Sea Green} -radix binary /controlvga_tb1/Rojo
add wave -noupdate -color Goldenrod /controlvga_tb1/Hsinc
add wave -noupdate -color Salmon /controlvga_tb1/Vsinc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
run -all
