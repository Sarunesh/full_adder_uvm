class fa_agent extends uvm_agent;
	// Factory registration
	`uvm_component_utils(fa_agent)

	// Constructor
	`NEW_COMPONENT

	// Properties
	fa_sqr sqr;
	fa_drv drv;
	fa_mon mon;
	fa_sub sub;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = fa_sqr::type_id::create("sqr",this);
		drv = fa_drv::type_id::create("drv",this);
		mon = fa_mon::type_id::create("mon",this);
		sub = fa_sub::type_id::create("sub",this);
		`uvm_info("FA_AGENT","Printing from the build_phase of fa_agent",UVM_HIGH)
	endfunction
	// connect_phase
endclass
