transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/decoder.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/conditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/conditionCheck.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/controller.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/datapath.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/flopr.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/instructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/adder.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/mux2.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/regfile.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/extend.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/ALUConFlags.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/ALUSinFlags.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/adderWithCarry.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/xorGate.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/inv.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/mux4a1.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/dataMemory.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/ROM32.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/arm.sv}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/deco_datos.sv}

vlog -sv -work work +incdir+C:/Users/User/Desktop/VII\ SEMESTRE\ 2021/Taller\ de\ Diseño\ Digital/Semana\ 16/ARMv4Processor-Processor-VGAController/Procesador {C:/Users/User/Desktop/VII SEMESTRE 2021/Taller de Diseño Digital/Semana 16/ARMv4Processor-Processor-VGAController/Procesador/procesadorTest.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  armTest

add wave *
view structure
view signals
run -all
