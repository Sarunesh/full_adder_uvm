class fa_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(fa_sbd)
	uvm_analysis_imp#(fa_tx, fa_sbd) a_imp;

	// Constructor
	`NEW_COMPONENT

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_imp = new("a_imp", this);
		`uvm_info("FA_SBD","Printing from the build_phase of fa_sbd",UVM_HIGH)
	endfunction

	virtual function void write(fa_tx t);
	endfunction
endclass
