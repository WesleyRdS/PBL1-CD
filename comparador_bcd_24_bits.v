module comparador_bcd_24_bits(num0, num1, s)	;
	input [0:11] num0, num1;
	output s; 
	wire [0:2] carry;
	wire [0:10] T;
	
	comparador_bcd_8_bits centena
		(
			.a(num0[11]),
			.b(num0[10]),
			.c(num0[9]),
			.d(num0[8]),
			.e(num1[11]),
			.f(num1[10]),
			.g(num1[9]),
			.h(num1[8]),
			.s0(carry[0]),
			.s1(T[0]),
			.s2(T[1]));
	comparador_bcd_8_bits dezena
		(
			.a(num0[7]),
			.b(num0[6]),
			.c(num0[5]),
			.d(num0[4]),
			.e(num1[7]),
			.f(num1[6]),
			.g(num1[5]),
			.h(num1[4]),
			.s0(T[2]),
			.s1(T[3]),
			.s2(T[4]));
	comparador_bcd_8_bits unidade
		(
			.a(num0[3]),
			.b(num0[2]),
			.c(num0[1]),
			.d(num0[0]),
			.e(num1[3]),
			.f(num1[2]),
			.g(num1[1]),
			.h(num1[0]),
			.s0(T[5]),
			.s1(T[6]),
			.s2(T[7]));
	
	and and0(T[8], !T[0], T[1]);
	and and1(carry[1], T[8], T[2]);
	
	and and2(T[9], T[8], !T[3], T[4]);
	and and3(T[10], T[5], !T[6], !T[7]);
	and and4(carry[2], T[9], T[10]);
	
	or or0(s, carry[0], carry[1], carry[2]);
endmodule	