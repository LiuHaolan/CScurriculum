module mux_2to1(a, b, mux, c);
 
 parameter N=1; //参数表示输入、输出数据的位数
 input [N-1:0] a;
 input [N-1:0] b;
 input mux;
 output [N-1:0] c;
 
 assign c=mux?a:b;
 
endmodule