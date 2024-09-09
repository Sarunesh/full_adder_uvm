class fa_tx extends uvm_sequence_item;
	// Properties
	rand logic a;
	rand logic b;
	rand logic cin;	
		 logic sum;
		 logic carry;

	// Factory registration
	`uvm_object_utils_begin(fa_tx)
		`uvm_field_int(a,UVM_ALL_ON)
		`uvm_field_int(b,UVM_ALL_ON)
		`uvm_field_int(cin,UVM_ALL_ON)
		`uvm_field_int(sum,UVM_ALL_ON)
		`uvm_field_int(carry,UVM_ALL_ON)
	`uvm_object_utils_end

	// Constructor
	`NEW_OBJECT
endclass
