class fa_env extends uvm_env;
	// Factory registration
	`uvm_component_utils(fa_env)

	// Constructor
	`NEW_COMPONENT

	// Properties
	fa_agent agent;
	fa_sbd	 sbd;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent	= fa_agent::type_id::create("agent",this);
		sbd		= fa_sbd::type_id::create("sbd",this);
		`uvm_info("FA_ENV","Printing from the build_phase of fa_env",UVM_HIGH)
	endfunction

	// connect_phase
	function void connect_phase(uvm_phase phase);
		agent.mon.a_port.connect(sbd.a_imp);
		`uvm_info("FA_ENV","Printing from the connect_phase of fa_env",UVM_HIGH)
	endfunction
endclass
