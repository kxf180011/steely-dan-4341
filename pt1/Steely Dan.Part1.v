// Cohort: Steely Dan
// Code author(s): Ethan Peglar, Kevin Fan

module Breadboard (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9);

	input w, x, y, z;
	output r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;
	reg r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

	always @ (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9)

	begin

	//wx + wz + xy + yz                            
	r0 = (w&x)|(w&z)|(x&y)|(y&z);      

	//wx + xz +yz                            
	r1 = (w&x)|(x&z)|(y&z);    

	//wyz + wxz + xyz + wxy                            
	r2 = (w&y&z)|(w&x&z)|(x&y&z)|(w&x&y);    

	//wz + xy
	r3 = (w&z)|(x&y);    

	//yz
	r4 = (y&z);    

	//w'x' + y'z'
	r5 = (!w&!x)|(!y&!z);    

	//w'x'y + w'y'z + xy'z + wx'y'z'
	r6 = (!w&!x&y)|(!w&!y&z)|(x&!y&z)|(w&!x&!y&!z);    

	//w'x'yz + w'xy'z + w'xyz' + wxy'z' + wx'y'z + wx'yz'
	r7 = (!w&!x&y&z)|(!w&x&!y&z)|(!w&x&y&!z)|(w&x&!y&!z)|(w&!x&!y&z)|(w&!x&y&!z);    

	//yz
	r8 = (y&z);    

	//w'x'y'z + w'x'yz + w'xy'z' + w'xyz + wxy'z + wxyz' + wx'y'z' + wx'yz
	r9 = (!w&!x&!y&z)|(!w&!x&y&!z)|(!w&x&!y&!z)|(!w&x&y&z)|(w&x&!y&z)|(w&x&y&!z)|(w&!x&!y&!z)|(w&!x&y&z);    

	end

endmodule

module testbench();

	reg [4:0] i;
	reg a, b, c, d;

 	wire  f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;
  
	Breadboard part1(a, b, c, d, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);

	initial begin

	// Create header of truth table
	$display ("|##|A|B|C|D|F0|F1|F2|F3|F4|F5|F6|F7|F8|F9|");
	$display ("|==+=+=+=+=+==+==+==+==+==+==+==+==+==+==|");

		for (i = 0; i < 16; i = i + 1)

			begin

			// Initialization of a, b, c, and d simulates the translation of i into a 4-digit binary number
			a=(i/8)%2;
			b=(i/4)%2;
			c=(i/2)%2;
			d=(i/1)%2;

			#20;

			$display ("|%2d|%1d|%1d|%1d|%1d| %1d| %1d| %1d| %1d| %1d| %1d| %1d| %1d| %1d| %1d|", i, a, b, c, d, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);
		
			if(i%4==3)
				$display ("|--+-+-+-+-+--+--+--+--+--+--+--+--+--+--|"); // create dividing barriers between every 4 entries

			end
 
	#20;

	$finish;

	end

endmodule
