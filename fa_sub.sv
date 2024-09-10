class fa_sub extends uvm_subscriber#(fa_tx);
	// Factory registration
	`uvm_component_utils(fa_sub)

	// Constructor
	`NEW_COMPONENT

	// Properties
	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("FA_SUB","Printing from the build_phase of fa_sub",UVM_HIGH)
	endfunction
	
	virtual function void write(fa_tx t);
	endfunction
endclass
