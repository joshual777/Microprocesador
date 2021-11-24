transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/AndGate.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/OrGate.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/XorGate.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/sumadorCompletoUnBit.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/sumadorCompletoCuatroBits.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/restadorCompletoParteA.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/restadorCompletoParteB.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/restadorCompletoCuatroBits.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/muxResults.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/ALU.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/shiftRight.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/shiftLeft.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/flagsControls.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/twoDisplaysNumbers.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/signDisplay.sv}
vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/aluWithDisplays.sv}

vlog -sv -work work +incdir+C:/Users/User/Downloads/Problema1-ALU/Problema1 {C:/Users/User/Downloads/Problema1-ALU/Problema1/testALU.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testALU

add wave *
view structure
view signals
run -all
