module adder_4bits (a, b, ci, s, co);

input [3:0] a;
input [3:0] b;
input ci;
output [3:0] s;
output co;

wire [3:0] g;
wire [3:0] p;
wire [3:0] c;

assign g[0]=a[0]&b[0], g[1]=a[1]&b[1], g[2]=a[2]&b[2], g[3]=a[3]&b[3];
assign p[0]=a[0]+b[0], p[1]=a[1]+b[1], p[2]=a[2]+b[2], p[3]=a[3]+b[3];

assign c[0]=g[0]|(p[0]&ci);
assign c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&ci);
assign c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&ci);
assign c[3]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&p[0]&ci);

assign s[3:0] = p[3:0]&(~g[3:0])^{c[2:0],ci}; 
assign co=c[3];

endmodule
