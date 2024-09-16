`define NEW_OBJECT \
	function new(string name=""); \
		super.new(name); \
	endfunction

`define NEW_COMPONENT \
	function new(string name="", uvm_component parent=null); \
		super.new(name, parent); \
	endfunction

class fa_common;
	//static int count;
	static int sum_match;
	static int sum_mismatch;
	static int carry_match;
	static int carry_mismatch;

	//static function void modify_count(int count_t);
	//	count = count_t;
	//endfunction
endclass
