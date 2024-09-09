class fa_seq_lib extends uvm_sequence#(fa_tx);
	// Factory registration
	`uvm_object_utils(fa_seq_lib)

	// Constructor
	`NEW_OBJECT
endclass

class test_abc extends fa_seq_lib;
	`uvm_object_utils(test_abc)
	`NEW_OBJECT

	task body();
	endtask
endclass
