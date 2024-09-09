class fa_mon extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(fa_mon)

	// Constructor
	`NEW_COMPONENT

	// Properties
	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("FA_MON","Printing from the build_phase of fa_mon",UVM_HIGH)
	endfunction
	// connect_phase
endclass
