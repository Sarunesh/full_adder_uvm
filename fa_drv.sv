class fa_drv extends uvm_driver;
	// Factory registration
	`uvm_component_utils(fa_drv)

	// Constructor
	`NEW_COMPONENT

	// Properties
	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("FA_DRV","Printing from the build_phase of fa_drv",UVM_HIGH)
	endfunction
endclass
