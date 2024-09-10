class fa_mon extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(fa_mon)
	uvm_analysis_port#(fa_tx) a_port;

	// Constructor
	`NEW_COMPONENT

	// Properties
	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_port = new("a_port", this);
		`uvm_info("FA_MON","Printing from the build_phase of fa_mon",UVM_HIGH)
	endfunction
endclass
