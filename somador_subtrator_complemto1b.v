module somador_subtrator_complemto1b(sinal, a, b, cin, s0, cout);
	input a, b, cin, sinal;
	output s0, cout;
	
	wire [0:8] T;
	wire [0:3] inv;
	
	not nota(inv[0], a);
	not notb(inv[1], b);
	not notc(inv[2], cin);
	not nots(inv[3], sinal);
	
	//S = A!B!cin +!A!Bcin + ABcin + !AB!cin
	and and0(T[0], a, inv[1], inv[2]);
	and and1(T[1], inv[0], inv[1], cin);
	and and2(T[2], a, b, cin);
	and and3(T[3], inv[0], b, inv[2]);
	or or0(s0, T[0], T[1], T[2], T[3]);
	
	//Cout = Bcin + !sinalA!Bcin + !sinalAB!cin + sinal!A!Bcin + sinal!AB!cin
	and and4(T[4], b, cin);
	and and5(T[5], inv[3], a, inv[1], cin);
	and and6(T[6], inv[3], a, b, inv[2]);
	and and7(T[7], sinal, inv[0], inv[1], cin);
	and and8(T[8], sinal, inv[0], b, inv[2]);
	or or1(cout, T[4], T[5], T[6], T[7], T[8]);
	
endmodule 