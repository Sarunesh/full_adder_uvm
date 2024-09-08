module full_adder(rst, a, b, cin, sum, carry);
	output reg  sum;
	output reg  carry;
	input 		a;
	input 		b;
	input 		cin;
	input		rst;

	always@(*) begin
		if(rst)begin
			sum		= 0;
			carry	= 0;
		end
		else begin
			{carry, sum} = a + b + cin;
		end
	end
endmodule
