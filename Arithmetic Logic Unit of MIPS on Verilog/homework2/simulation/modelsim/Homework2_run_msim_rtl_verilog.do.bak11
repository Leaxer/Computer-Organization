transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/and_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/or_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/xor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/nor_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/full_adder1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/not_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/slt.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mux2x1.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mux3x8.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/carry_lookahead_adder_4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules/mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules/mod_cu.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules/mod_dp.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/mod_modules/comparator.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/carry_lookahead_adder_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/detect_overflow.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/carry_lookahead_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/and_3bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/or_3bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/sign_extend.v}

vlog -vlog01compat -work work +incdir+C:/Users/akif_/Desktop/quartus/homework2/my_modules {C:/Users/akif_/Desktop/quartus/homework2/my_modules/my_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  my_testbench

add wave *
view structure
view signals
run -all
