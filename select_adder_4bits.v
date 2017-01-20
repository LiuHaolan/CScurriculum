module select_adder_4bits(a, b, ci, s, co);

 input [3:0] a;
 input [3:0] b;
 input ci;
 output [3:0] s;
 output co;
 
 wire [3:0] s1,s0;
 wire c1,c0;
 
 adder_4bits adder_4bits_1(.a(a), .b(b), .ci(1), .s(s1), .co(c1));
 adder_4bits adder_4bits_2(.a(a), .b(b), .ci(0), .s(s0), .co(c0)); 
 mux_2to1 #(.N(4)) mux_2to1(.a(s1), .b(s0), .mux(ci), .c(s));
 assign co=(ci&c1)|c0;
 
endmodule