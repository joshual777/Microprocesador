transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/decoder.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/conditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/conditionCheck.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/controller.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/datapath.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/flopr.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/instructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/adder.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/mux2.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/regfile.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/extend.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/ALUConFlags.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/ALUSinFlags.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/adderWithCarry.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/xorGate.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/inv.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/mux4a1.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/dataMemory.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/arm.sv}
vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/deco_datos.sv}

vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/procesadorTest.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  procesadorTest

add wave *
view structure
view signals
run -all
