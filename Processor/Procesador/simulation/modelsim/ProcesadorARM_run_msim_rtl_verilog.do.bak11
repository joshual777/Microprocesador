transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/mux4a1.sv}

vlog -sv -work work +incdir+C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador {C:/Users/abiga/OneDrive/Escritorio/Microprocesador/Processor/Procesador/mux4a1Test.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mux4a1Test

add wave *
view structure
view signals
run -all
