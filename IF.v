  `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:21 11/12/2009 
// Design Name: 
// Module Name:    IF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF(clk, reset, Z, J, JR, PC_IFWrite, JumpAddr, 
           JrAddr, BranchAddr, Instruction_if,PC, NextPC_if);
    input clk;
    input reset;
    input Z;
    input J;
    input JR;
    input PC_IFWrite;
    input [31:0] JumpAddr;
    input [31:0] JrAddr;
    input [31:0] BranchAddr;
    output [31:0] Instruction_if;
    output [31:0] PC,NextPC_if;
	
	

// MUX for PC
    reg[31:0] PC_in;
	
	wire [31:0] sum;
	adder_32bits adder_32bits(.a(PC_in), 
   								.b(4), 
   								.ci(0), 
   								.s(sum), 
   								.co());

	
    
	always@(*)
	begin 
      if(JR == 1)
			PC_in <= JrAddr;
		else if(J==1)
			PC_in <= JumpAddr;
			else if(Z == 1)
				PC_in = BranchAddr;
				else	PC_in = sum;
				
	end
//PC REG


     
//Adder for NextPC


  	
	  
//ROM
InstructionROM  InstructionROM(
	.addr(PC[7:2]),
	.dout(Instruction_if));
	
endmodule
