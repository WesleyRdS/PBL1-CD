module pontuar(btn,s0,s1);
	input [0:2] btn;
	output s0, s1;
	
	wire [0:2] fio;
	
	not not0(inv0, btn[0]);   // btn[0] retorna 11
	not not1(inv1, btn[1]);  // btn[1] retorna 10
	not not2(inv2, btn[2]); // btn[2] retorna 01
	
	//and and0(fio[0], inv0, inv1, btn[2]);
	and and0(fio[0], btn[0], btn[1], inv2); // sinal invertido pala funcionar no CPLD
	//and and1(fio[1], btn[0], inv1, inv2);
	and and1(fio[1], inv0, btn[1], btn[2]); // sinal invertido pala funcionar no CPLD
	or or0(s0, fio[0], fio[1]);
	
	//and and3(fio[2], inv0, btn[1],inv2);
	and and3(fio[2], btn[0], inv1,btn[2]); // sinal invertido pala funcionar no CPLD
	or or1(s1, fio[1], fio[2]);

	
endmodule
	
	
	
	