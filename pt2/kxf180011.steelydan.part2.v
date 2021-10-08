module HalfAdder(A,B,carry,sum);
	input A;
	input B;
	output carry;
	output sum;
	reg carry;
	reg sum;

	always @(*) 
	  begin
	    sum= A ^ B;
	    carry= A & B;
	  end
endmodule



module FullAdder(A,B,C,carry,sum);
	input A;
	input B;
	input C;
	output carry;
	output sum;
	reg carry;
	reg sum;
	wire c0;
	wire s0;
	wire c1;
	wire s1;

	HalfAdder ha1(A ,B,c0,s0);
	HalfAdder ha2(s0,C,c1,s1);

	always @(*) 
	  begin
	    sum=s1;
		sum= A^B^C;
	    carry=c1|c0;
		carry= ((A^B)&C)|(A&B);  
	  end
endmodule

module AddSub(inputA,inputB,mode,sum,carry,overflow);
    input [15:0] inputA;
	input [15:0] inputB;
    input mode;
    output [31:0] sum;
	output carry;
    output overflow;
    wire b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16; 

    assign b0 =  inputB[0]  ^ mode;
    assign b1 =  inputB[1]  ^ mode;
    assign b2 =  inputB[2]  ^ mode;
    assign b3 =  inputB[3]  ^ mode;
	assign b4 =  inputB[4]  ^ mode;
    assign b5 =  inputB[5]  ^ mode;
    assign b6 =  inputB[6]  ^ mode;
    assign b7 =  inputB[7]  ^ mode;
	assign b8 =  inputB[8]  ^ mode;
    assign b9 =  inputB[9]  ^ mode;
    assign b10 = inputB[10] ^ mode;
    assign b11 = inputB[11] ^ mode;
	assign b12 = inputB[12] ^ mode;
    assign b13 = inputB[13] ^ mode;
    assign b14 = inputB[14] ^ mode;
    assign b15 = inputB[15] ^ mode;

	FullAdder FA0 (inputA[0], b0,mode, c1,sum[0]);
	FullAdder FA1 (inputA[1], b1,  c1, c2,sum[1]);
	FullAdder FA2 (inputA[2], b2,  c2, c3,sum[2]);
	FullAdder FA3 (inputA[3], b3,  c3, c4,sum[3]);
    FullAdder FA4 (inputA[4], b4,  c4, c5,sum[4]);
    FullAdder FA5 (inputA[5], b5,  c5, c6,sum[5]);
    FullAdder FA6 (inputA[6], b6,  c6, c7,sum[6]);
    FullAdder FA7 (inputA[7], b7,  c7, c8,sum[7]);
    FullAdder FA8 (inputA[8], b8,  c8, c9,sum[8]);
    FullAdder FA9 (inputA[9], b9,  c9,c10,sum[9]);
    FullAdder FA10(inputA[10],b10,c10,c11,sum[10]);
    FullAdder FA11(inputA[11],b11,c11,c12,sum[11]);
    FullAdder FA12(inputA[12],b12,c12,c13,sum[12]);
    FullAdder FA13(inputA[13],b13,c13,c14,sum[13]);
    FullAdder FA14(inputA[14],b14,c14,c15,sum[14]);
    FullAdder FA15(inputA[15],b15,c15,c16,sum[15]);

	assign carry=c16;
	assign overflow=c16^c15;
endmodule


module Add32b(inputA,inputB,sum,carry,overflow);
    input [31:0] inputA;
	input [31:0] inputB;
    output [31:0] sum;
	output carry;
    output overflow;
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32; 

	FullAdder FA0 (inputA[0], inputB[0],1'b0, c1,sum[0]);
	FullAdder FA1 (inputA[1], inputB[1],  c1, c2,sum[1]);
	FullAdder FA2 (inputA[2], inputB[2],  c2, c3,sum[2]);
	FullAdder FA3 (inputA[3], inputB[3],  c3, c4,sum[3]);
    FullAdder FA4 (inputA[4], inputB[4],  c4, c5,sum[4]);
    FullAdder FA5 (inputA[5], inputB[5],  c5, c6,sum[5]);
    FullAdder FA6 (inputA[6], inputB[6],  c6, c7,sum[6]);
    FullAdder FA7 (inputA[7], inputB[7],  c7, c8,sum[7]);
    FullAdder FA8 (inputA[8], inputB[8],  c8, c9,sum[8]);
    FullAdder FA9 (inputA[9], inputB[9],  c9,c10,sum[9]);
    FullAdder FA10(inputA[10],inputB[10],c10,c11,sum[10]);
    FullAdder FA11(inputA[11],inputB[11],c11,c12,sum[11]);
    FullAdder FA12(inputA[12],inputB[12],c12,c13,sum[12]);
    FullAdder FA13(inputA[13],inputB[13],c13,c14,sum[13]);
    FullAdder FA14(inputA[14],inputB[14],c14,c15,sum[14]);
    FullAdder FA15(inputA[15],inputB[15],c15,c16,sum[15]);
    FullAdder FA16(inputA[16],inputB[16],c16,c17,sum[16]);
    FullAdder FA17(inputA[17],inputB[17],c17,c18,sum[17]);
    FullAdder FA18(inputA[18],inputB[18],c18,c19,sum[18]);
    FullAdder FA19(inputA[19],inputB[19],c19,c20,sum[19]);
    FullAdder FA20(inputA[20],inputB[20],c20,c21,sum[20]);
    FullAdder FA21(inputA[21],inputB[21],c21,c22,sum[21]);
    FullAdder FA22(inputA[22],inputB[22],c22,c23,sum[22]);
    FullAdder FA23(inputA[23],inputB[23],c23,c24,sum[23]);
    FullAdder FA24(inputA[24],inputB[24],c24,c25,sum[24]);
    FullAdder FA25(inputA[25],inputB[25],c25,c26,sum[25]);
    FullAdder FA26(inputA[26],inputB[26],c26,c27,sum[26]);
    FullAdder FA27(inputA[27],inputB[27],c27,c28,sum[27]);
    FullAdder FA28(inputA[28],inputB[28],c28,c29,sum[28]);
    FullAdder FA29(inputA[29],inputB[29],c29,c30,sum[29]);
    FullAdder FA30(inputA[30],inputB[30],c30,c31,sum[30]);
    FullAdder FA31(inputA[31],inputB[31],c31,c32,sum[31]);

	assign carry=c32;
	assign overflow=c32^c31;
endmodule


module MultHelp(an, b, partialProduct);
    input an;
    input [15:0] b;
    output [15:0] partialProduct;

    assign partialProduct[0]  = an && b[0];
    assign partialProduct[1]  = an && b[1];
    assign partialProduct[2]  = an && b[2];
    assign partialProduct[3]  = an && b[3];
    assign partialProduct[4]  = an && b[4];
    assign partialProduct[5]  = an && b[5];
    assign partialProduct[6]  = an && b[6];
    assign partialProduct[7]  = an && b[7];
    assign partialProduct[8]  = an && b[8];
    assign partialProduct[9]  = an && b[9];
    assign partialProduct[10] = an && b[10];
    assign partialProduct[11] = an && b[11];
    assign partialProduct[12] = an && b[12];
    assign partialProduct[13] = an && b[13];
    assign partialProduct[14] = an && b[14];
    assign partialProduct[15] = an && b[15];

endmodule



module Mult(a, b, product);
    input [15:0] a;
    input [15:0] b;
    output [31:0] product;
    wire [15:0]c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15; //partial products
    wire [31:0]d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14; //sum interfacesw
    wire trash;

    MultHelp  M0(a[0],  b, c0);
    MultHelp  M1(a[1],  b, c1);
    MultHelp  M2(a[2],  b, c2);
    MultHelp  M3(a[3],  b, c3);
    MultHelp  M4(a[4],  b, c4);
    MultHelp  M5(a[5],  b, c5);
    MultHelp  M6(a[6],  b, c6);
    MultHelp  M7(a[7],  b, c7);
    MultHelp  M8(a[8],  b, c8);
    MultHelp  M9(a[9],  b, c9);
    MultHelp M10(a[10], b, c10);
    MultHelp M11(a[11], b, c11);
    MultHelp M12(a[12], b, c12);
    MultHelp M13(a[13], b, c13);
    MultHelp M14(a[14], b, c14);
    MultHelp M15(a[15], b, c15);

    Add32b ADD1 ({16'b0, c0}, {15'b0, c1, 1'b0},      d0,  trash, trash);
    Add32b ADD2 (d0,          {14'b0, c2, 2'b0},      d1,  trash, trash);
    Add32b ADD3 (d1,          {13'b0, c3, 3'b0},      d2,  trash, trash);
    Add32b ADD4 (d2,          {12'b0, c4, 4'b0},      d3,  trash, trash);
    Add32b ADD5 (d3,          {11'b0, c5, 5'b0},      d4,  trash, trash);
    Add32b ADD6 (d4,          {10'b0, c6, 6'b0},      d5,  trash, trash);
    Add32b ADD7 (d5,          {9'b0, c7, 7'b0},       d6,  trash, trash);
    Add32b ADD8 (d6,          {8'b0, c8, 8'b0},       d7,  trash, trash);
    Add32b ADD9 (d7,          {7'b0, c9, 9'b0},       d8,  trash, trash);
    Add32b ADD10(d8,          {6'b0, c10, 10'b0},     d9,  trash, trash);
    Add32b ADD11(d9,          {5'b0, c11, 11'b0},     d10, trash, trash);
    Add32b ADD12(d10,         {4'b0, c12, 12'b0},     d11, trash, trash);
    Add32b ADD13(d11,         {3'b0, c13, 13'b0},     d12, trash, trash);
    Add32b ADD14(d12,         {2'b0, c14, 14'b0},     d13, trash, trash);
    Add32b ADD15(d13,         {1'b0, c15, 15'b0},     d14, trash, trash);

    assign product = d14;

endmodule


module Divide (inputA, inputB, quotient, error);
    input [15:0] inputA;
    input [15:0] inputB;
    output [31:0] quotient;
    output error;

    assign quotient = inputB ? inputA / inputB : 16'b0;
    assign error = inputB ? 1'b0 : 1'b1;
endmodule

module Modulus (inputA, inputB, remainder, error);
    input [15:0] inputA;
    input [15:0] inputB;
    output [31:0] remainder;
    output error;

    assign remainder = inputB ? inputA % inputB : 16'b0;
    assign error = inputB ? 1'b0 : 1'b1;
endmodule


module Mux16x32b(channels, select, b);
input [15:0][31:0] channels;
input [15:0] select;
output [31:0] b;

	assign b = ({16{select[15]}} & channels[15]) | 
               ({16{select[14]}} & channels[14]) |
			   ({16{select[13]}} & channels[13]) |
			   ({16{select[12]}} & channels[12]) |
			   ({16{select[11]}} & channels[11]) |
			   ({16{select[10]}} & channels[10]) |
			   ({16{select[ 9]}} & channels[ 9]) |
			   ({16{select[ 8]}} & channels[ 8]) |
			   ({16{select[ 7]}} & channels[ 7]) |
			   ({16{select[ 6]}} & channels[ 6]) |
			   ({16{select[ 5]}} & channels[ 5]) |
			   ({16{select[ 4]}} & channels[ 4]) |
			   ({16{select[ 3]}} & channels[ 3]) |
			   ({16{select[ 2]}} & channels[ 2]) | 
               ({16{select[ 1]}} & channels[ 1]) |
               ({16{select[ 0]}} & channels[ 0]) ;
endmodule


module Dec4x16(binary,onehot);
	input [3:0] binary;
	output [15:0]onehot;
	
	assign onehot[ 0]=~binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 1]=~binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[ 2]=~binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[ 3]=~binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[ 4]=~binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[ 5]=~binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[ 6]=~binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[ 7]=~binary[3]& binary[2]& binary[1]& binary[0];
	assign onehot[ 8]= binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 9]= binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[10]= binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[11]= binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[12]= binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[13]= binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[14]= binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[15]= binary[3]& binary[2]& binary[1]& binary[0];
	
endmodule;



module BreadBoard(inputA,inputB,command,result,error);
    input [15:0]inputA;
    input [15:0]inputB;
    input [3:0] command;
    output [31:0]result;
    output [1:0]error;
    wire [15:0]inputA;
    wire [15:0]inputB;
    wire [3:0] command;
    reg [31:0]result;
    reg [1:0]error;

    //Local Variables
    //Full Adder
    reg mode;
    wire [31:0] sum;
    wire carry;
    wire overflow;

    //Multiplier
    wire [31:0] mult;

    //Divide
    wire [31:0] div;
    wire divZero;

    //Modulus
    wire [31:0] remainder;

    //Multiplexer
    wire [15:0][31:0] channels;
    wire [15:0] onehotMux;
    wire [31:0] b;
    
    Dec4x16 DecAlpha(command,onehotMux);
    AddSub nept(inputA,inputB,mode,sum,carry,overflow);
    Mux16x32b satu(channels,onehotMux,b);
    Divide jupi(inputA, inputB, div, divZero);
    Mult uran(inputA, inputB, mult);
    Modulus pluto(inputA, inputB, remainder, divZero);

    assign channels[ 0]=sum;//Addition
    assign channels[ 1]=sum;//Subtraction
    assign channels[ 2]=mult;//multiplication
    assign channels[ 3]=div;//GROUND=0
    assign channels[ 4]=remainder;//GROUND=0
    assign channels[ 5]=0;//GROUND=0
    assign channels[ 6]=0;//GROUND=0
    assign channels[ 7]=0;//GROUND=0
    assign channels[ 8]=0;//GROUND=0
    assign channels[ 9]=0;//GROUND=0
    assign channels[10]=0;//GROUND=0
    assign channels[11]=0;//GROUND=0
    assign channels[12]=0;//GROUND=0
    assign channels[13]=0;//GROUND=0
    assign channels[14]=0;//GROUND=0
    assign channels[15]=0;//GROUND=0

    always @(*) 
    begin
        mode = command[0];
        result = b;
        error = {divZero, overflow};   
    end

endmodule

module TestBench();
reg [15:0] inputA;
reg [15:0] inputB;
reg [3:0] command;
wire [31:0] result;
wire [1:0] error;
BreadBoard ALU(inputA,inputB,command,result,error);

initial begin
    assign inputA  = 16'b1111110100000000;
    assign inputB  = 16'b0000100000000001;
    assign command = 0;
    #30;

    $display("Input A:%5d, Input B:%5d][Add:%b][Output:%15d, Error: %b", inputA, inputB, command, result, error);

    assign command = 1;
    #30

    $display("Input A:%5d, Input B:%5d][Sub:%b][Output:%15d, Error: %b", inputA, inputB, command, result, error);
    #30;

    assign command = 2;
    #30

    $display("Input A:%5d, Input B:%5d][Mul:%b][Output:%15d, Error: %b", inputA, inputB, command, result, error);      
    #30

    assign command = 3;
    #30

    $display("Input A:%5d, Input B:%5d][Div:%b][Output:%15d, Error: %b", inputA, inputB, command, result, error);      
    #30
    
    assign command = 4;
    #30

    $display("Input A:%5d, Input B:%5d][Mod:%b][Output:%15d, Error: %b", inputA, inputB, command, result, error);      


    $finish;
end  



endmodule  
