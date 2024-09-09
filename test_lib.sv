class base_test extends uvm_test;
	// Factory registration
	`uvm_component_utils(base_test)

	// Constructor
	`NEW_COMPONENT

	// Properties
	fa_env env;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = fa_env::type_id::create("env",this);
		`uvm_info("BASE_TEST","Printing from the build_phase of base_test",UVM_HIGH)
	endfunction

	// end_of_elaboration_phase
	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info("BASE_TEST","Printing from the end_of_elaboration_phase of base_test",UVM_HIGH)
		uvm_top.print_topology();
	endfunction
endclass

class testcase_30 extends base_test;
	// Factory registration
	`uvm_component_utils(testcase_30)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
	endtask
endclass
