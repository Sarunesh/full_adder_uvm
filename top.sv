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
	
	initial begin
		rst=1;
		#5;
		rst=0;
	end

	initial begin
		run_test("base_test");
	end
endmodule
