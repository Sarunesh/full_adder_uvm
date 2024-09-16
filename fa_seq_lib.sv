class fa_seq_lib extends uvm_sequence#(fa_tx);
	// Factory registration
	`uvm_object_utils(fa_seq_lib)

	// Constructor
	`NEW_OBJECT

	// Properties
	int count;
endclass

class test_abc extends fa_seq_lib;
	`uvm_object_utils(test_abc)
	`NEW_OBJECT

	task body();
		uvm_config_db#(int)::get(null,get_full_name(),"count",count);
		`uvm_info("TEST_ABC",$sformatf("count=%0d",count),UVM_HIGH)
		repeat(count)begin
			`uvm_do(req)
		end
	endtask
endclass
