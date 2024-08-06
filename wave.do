onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_complete/uut/clk
add wave -noupdate /tb_complete/uut/rst
add wave -noupdate -radix hexadecimal /tb_complete/uut/instr_IF
add wave -noupdate -radix hexadecimal /tb_complete/uut/instr_ID
add wave -noupdate -radix hexadecimal /tb_complete/uut/PC
add wave -noupdate -radix hexadecimal /tb_complete/uut/PC_jump
add wave -noupdate /tb_complete/uut/opcode
add wave -noupdate /tb_complete/uut/funct3
add wave -noupdate /tb_complete/uut/rd
add wave -noupdate /tb_complete/uut/rs1
add wave -noupdate /tb_complete/uut/rs2
add wave -noupdate /tb_complete/uut/imm
add wave -noupdate /tb_complete/uut/jump
add wave -noupdate -radix hexadecimal /tb_complete/uut/R0
add wave -noupdate -radix hexadecimal /tb_complete/uut/R1
add wave -noupdate -radix hexadecimal /tb_complete/uut/R2
add wave -noupdate -radix hexadecimal /tb_complete/uut/R3
add wave -noupdate -radix hexadecimal /tb_complete/uut/R4
add wave -noupdate -radix hexadecimal /tb_complete/uut/R5
add wave -noupdate -radix hexadecimal /tb_complete/uut/R6
add wave -noupdate -radix hexadecimal /tb_complete/uut/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {616 ps}
