class fa_drv extends uvm_driver#(fa_tx);
	// Factory registration
	`uvm_component_utils(fa_drv)

	// Constructor
	`NEW_COMPONENT

	// Properties
	virtual fa_interface vif;
	int count;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("FA_DRV","Printing from the build_phase of fa_drv",UVM_HIGH)

		// Reading the interface from config db
		if(uvm_config_db#(virtual fa_interface)::get(this,get_full_name(),"VIF",vif))
			`uvm_info("FA_DRV","Successfully read the interface in driver",UVM_HIGH)
		else
			`uvm_fatal("FA_DRV","Failed to read the interface in driver")
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("FA_DRV","Printing from the run_phase of fa_drv",UVM_HIGH)
	// Reading the count value from config db
		if(!uvm_config_db#(int)::get(this,get_full_name(),"count",count))
			`uvm_fatal("FA_DRV","Failed to read the count value in driver")
		repeat(count)begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			//req.print();
			seq_item_port.item_done();
		end
	endtask

	// drive_tx
	task drive_tx(fa_tx tx);
		`uvm_info("FA_DRV","Driving the inputs to the interface from drive_tx of fa_drv",UVM_HIGH)
		vif.a	= tx.a;
		vif.b	= tx.b;
		vif.cin	= tx.cin;
		#3;
		tx.sum	= vif.sum;
		tx.carry= vif.carry;
	endtask
endclass
