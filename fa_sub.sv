class fa_sub extends uvm_subscriber#(fa_tx);
	// Factory registration
	`uvm_component_utils(fa_sub)

	// Properties
	fa_tx tx;

	// Coverage logic
	covergroup fa_cg;
		A_VAL:coverpoint tx.a{
			bins A_ZERO = {1'b0};
			bins A_ONE = {1'b1};
		}
		B_VAL:coverpoint tx.b{
			bins B_ZERO = {1'b0};
			bins B_ONE = {1'b1};
		}
		CIN_VAL:coverpoint tx.cin{
			bins CIN_ZERO = {1'b0};
			bins CIN_ONE = {1'b1};
		}
		A_VAL_X_B_VAL:cross A_VAL,B_VAL;
		B_VAL_X_CIN_VAL:cross B_VAL,CIN_VAL;
		A_VAL_X_CIN_VAL:cross A_VAL,CIN_VAL;
		A_VAL_X_B_VAL_X_CIN_VAL:cross A_VAL,B_VAL,CIN_VAL;
	endgroup

	// Constructor
	//`NEW_COMPONENT
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
		fa_cg = new();
	endfunction

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("FA_SUB","Printing from the build_phase of fa_sub",UVM_HIGH)
	endfunction
	
	virtual function void write(fa_tx t);
		$cast(tx,t);
		fa_cg.sample();
	endfunction
endclass
