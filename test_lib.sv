class base_test extends uvm_test;
	// Factory registration
	`uvm_component_utils(base_test)

	// Constructor
	`NEW_COMPONENT

	// Properties
	fa_env env;
	int count;

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

	// report_phase
	function void report_phase(uvm_phase phase);
		int count;
	// Reading count value from config db
		if(!uvm_config_db#(int)::get(this,get_full_name(),"count",this.count))
			`uvm_fatal("BASE_TEST","Failed to read the count value in base_test")
		`uvm_info("BASE_TEST","Printing from the report_phase of base_test",UVM_HIGH)
	// Report
	// For sum
		if(fa_common::sum_match==count && fa_common::sum_mismatch==0)
			`uvm_info("TEST PASSED FOR SUM",$sformatf("\tsum_match=%0d\tsum_mismatch=%0d", fa_common::sum_match, fa_common::sum_mismatch),UVM_NONE)
		else
			`uvm_info("TEST FAILED FOR SUM",$sformatf("\tsum_match=%0d\tsum_mismatch=%0d", fa_common::sum_match, fa_common::sum_mismatch),UVM_NONE)
    // For carry                                                                                                                  
		if(fa_common::carry_match==count && fa_common::carry_mismatch==0)
			`uvm_info("TEST PASSED FOR CARRY",$sformatf("\tcarry_match=%0d\tcarry_mismatch=%0d", fa_common::carry_match, fa_common::carry_mismatch),UVM_NONE)
		else
			`uvm_info("TEST FAILED FOR CARRY",$sformatf("\tcarry_match=%0d\tcarry_mismatch=%0d", fa_common::carry_match, fa_common::carry_mismatch),UVM_NONE)
	endfunction
endclass

class test_10 extends base_test;
	// Factory registration
	`uvm_component_utils(test_10)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
		test_abc test_abc_seq_sqr_10;
		test_abc_seq_sqr_10 = new("test_abc_seq_sqr_10");
		uvm_config_db#(int)::set(this,"*","count",10);
		phase.raise_objection(this);
		test_abc_seq_sqr_10.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,50);
		phase.drop_objection(this);
	endtask
endclass

class test_50 extends base_test;
	// Factory registration
	`uvm_component_utils(test_50)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
		test_abc test_abc_seq_sqr_50;
		test_abc_seq_sqr_50 = new("test_abc_seq_sqr_50");
		uvm_config_db#(int)::set(this,"*","count",50);
		phase.raise_objection(this);
		test_abc_seq_sqr_50.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,50);
		phase.drop_objection(this);
	endtask
endclass

