module mux_2to1(a, b, mux, c);
 
 parameter N=1; //������ʾ���롢������ݵ�λ��
 input [N-1:0] a;
 input [N-1:0] b;
 input mux;
 output [N-1:0] c;
 
 assign c=mux?a:b;
 
endmodule