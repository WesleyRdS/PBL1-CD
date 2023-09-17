module somador_subtrator_complemto7b(sinal, a, b,  cin, s, cout);

	input [0:6] a, b;
	input cin, sinal;
	output cout;
	output [0:6] s; 
	
	wire [0:6] T;
	
	
   somador_subtrator_complemto1b(sinal, a[0], b[0], cin, s[0], T[0]);
	somador_subtrator_complemto1b(sinal, a[1], b[1], T[0], s[1], T[1]);
	somador_subtrator_complemto1b(sinal, a[2], b[2], T[1], s[2], T[2]);
	somador_subtrator_complemto1b(sinal, a[3], b[3], T[2], s[3], T[3]);
	somador_subtrator_complemto1b(sinal, a[4], b[4], T[3], s[4], T[4]);
	somador_subtrator_complemto1b(sinal, a[5], b[5], T[4], s[5], T[5]);
	somador_subtrator_complemto1b(sinal, a[6], b[6], T[5], s[6], cout);

	
endmodule




