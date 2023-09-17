module tristate(a, b, clk, s);
	input a, b, clk;
	output s;
	wire [0:2] T;
	wire inv; // sinal do clock invertido	
	
	not not0(inv, clk);
	// depende do clock para saber passagem a que bit dar 
	and and0(T[0], a, inv);
	and and1(T[1], b, clk);
	or or0(s, T[0], T[1]);
	
endmodule
	
	