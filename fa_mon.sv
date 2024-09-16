class fa_mon extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(fa_mon)
	uvm_analysis_port#(fa_tx) a_port;

	// Constructor
	`NEW_COMPONENT

	// Properties
	virtual fa_interface vif;
	int count;
	fa_tx tx;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_port = new("a_port", this);
		`uvm_info("FA_MON","Printing from the build_phase of fa_mon",UVM_HIGH)

		// Reading the interface from config db
		if(uvm_config_db#(virtual fa_interface)::get(this,get_full_name(),"VIF",vif))
			`uvm_info("FA_MON","Successfully read the interface in monitor",UVM_HIGH)
		else
			`uvm_fatal("FA_MON","Failed to read the interface in monitor")

	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("FA_MON","Printing from the run_phase of fa_mon",UVM_HIGH)

		// Reading the count value from config db
		if(uvm_config_db#(int)::get(this,get_full_name(),"count",count))
			`uvm_info("FA_MON","Successfully read the count value in monitor",UVM_HIGH)
		else
			`uvm_fatal("FA_MON","Failed to read the count value in monitor")

		repeat(count)begin
			tx = new();
			tx.a	= vif.a;
			tx.b	= vif.b;
			tx.cin	= vif.cin;
			tx.sum	= vif.sum;
			tx.carry= vif.carry;

			a_port.write(tx);
			tx.print();
		end
	endtask
endclass
