transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/xor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/slt.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/or_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/or_3bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/not_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/nor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/mux3x8.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/mux2x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/full_adder1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/detect_overflow.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/carry_lookahead_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/carry_lookahead_adder_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/carry_lookahead_adder_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/and_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_modules/sign_extend_alu32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3 {C:/Users/akif_/Desktop/quartus/homework3/mips.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/and_6bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/or_6bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/or_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/and_3bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/alu_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/shift_left_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/program_counter_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/mux2x1_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/or_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/not_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/and_5bitm.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/instruction_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/register_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/memory_block.v}

vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework3/my_modules {C:/Users/akif_/Desktop/quartus/homework3/my_modules/mips_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mips_testbench

add wave *
view structure
view signals
run -all
