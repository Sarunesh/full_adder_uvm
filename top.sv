module top;
	bit rst;

	// Interface
	fa_interface pif(.rst(rst));

	// DUT
	full_adder dut(
					.rst	(pif.rst),
					.a		(pif.a),
					.b		(pif.b),
					.cin	(pif.cin),
					.sum	(pif.sum),
					.carry	(pif.carry)
					);
	
	initial uvm_config_db#(virtual fa_interface)::set(null,"*","VIF",pif);

	initial begin
		rst=1;
		pif.a=0;
		pif.b=0;
		pif.cin=0;
		#5;
		rst=0;
	end

	initial begin
		run_test("");
	end
endmodule
