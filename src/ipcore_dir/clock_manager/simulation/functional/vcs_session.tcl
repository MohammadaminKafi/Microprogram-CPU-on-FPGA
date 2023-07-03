gui_open_window Wave
gui_sg_create clock_manager_group
gui_list_add_group -id Wave.1 {clock_manager_group}
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.test_phase}
gui_set_radix -radix {ascii} -signals {clock_manager_tb.test_phase}
gui_sg_addsignal -group clock_manager_group {{Input_clocks}} -divider
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.CLK_IN1}
gui_sg_addsignal -group clock_manager_group {{Output_clocks}} -divider
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.dut.clk}
gui_list_expand -id Wave.1 clock_manager_tb.dut.clk
gui_sg_addsignal -group clock_manager_group {{Status_control}} -divider
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.RESET}
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.LOCKED}
gui_sg_addsignal -group clock_manager_group {{Counters}} -divider
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.COUNT}
gui_sg_addsignal -group clock_manager_group {clock_manager_tb.dut.counter}
gui_list_expand -id Wave.1 clock_manager_tb.dut.counter
gui_zoom -window Wave.1 -full
