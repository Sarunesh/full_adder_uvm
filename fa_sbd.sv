class fa_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(fa_sbd)
	uvm_analysis_imp#(fa_tx, fa_sbd) a_imp;

	// Constructor
	`NEW_COMPONENT

	// Properties
	fa_tx tx, tx_t;
	int count;
  	int start_sbd;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_imp = new("a_imp", this);
		`uvm_info("FA_SBD","Printing from the build_phase of fa_sbd",UVM_HIGH)
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("FA_SBD","Printing from the run_phase of fa_sbd",UVM_HIGH)
      	wait(start_sbd == 1);
	// Reading the count value from config db
		if(!uvm_config_db#(int)::get(this,get_full_name(),"count",count))
			`uvm_fatal("FA_DRV","Failed to read the count value in scoreboard")
		repeat(count)begin
			tx_t = new();
			tx_t.copy(tx);
			{tx_t.carry, tx_t.sum} = tx.a+tx.b+tx.cin;

	// Checker logic
			if(tx.sum == tx_t.sum) fa_common::sum_match++;
			else fa_common::sum_mismatch++;
			if(tx.carry == tx_t.carry) fa_common::carry_match++;
			else fa_common::carry_mismatch++;
		end
	endtask

	virtual function void write(fa_tx t);
		$cast(tx,t);
		start_sbd=1;
	endfunction
endclass
