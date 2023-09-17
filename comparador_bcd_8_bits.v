module comparador_bcd_8_bits(a, b, c, d, e, f, g, h, s0, s1, s2);
	input a, b, c, d, e, f, g, h;
	output s0, s1, s2;
	
	wire [0:44] T;
	wire [0:7] inv;
	
	not not0(inv[0], a);
	not not1(inv[1], b);
	not not2(inv[2], c);
	not not3(inv[3], d);
	not not4(inv[4], e);
	not not5(inv[5], f);
	not not6(inv[6], g);
	not not7(inv[7], h);

	//A!E + !AB!E!F + !A!BC!E!F!G + !A!B!CD!E!F!G!H + !A!BCD!E!FG!H + !ABC!EF!G + !AB!CD!EF!G!H + !ABCD!EFG!H + ABE!F + A!BCE!F!G + A!B!CDE!F!G!H + A!BCDE!FG!H + ABCEF!G + AB!CDEF!G!H + ABCDEFG!H
	and and0(T[0], a, inv[4]);
	and and1(T[1], inv[0], b, inv[4], inv[5]);
	and and2(T[2], inv[0], inv[1], c, inv[4], inv[5], inv[6]);
	and and3(T[3], inv[0], inv[1], inv[2], d, inv[4], inv[5], inv[6], inv[7]);
	and and4(T[4], inv[0], inv[1], c, d, inv[4], inv[5], g, inv[7]);
	and and5(T[5], inv[0], b, c, inv[4], f, inv[6]);
	and and6(T[6], inv[0], b, inv[2], d, inv[4], f, inv[6], inv[7]);
	and and7(T[7], inv[0], b, c, d, inv[4], f, g, inv[7]);
	and and8(T[8], a, b, e, inv[5]);
	and and9(T[9], a, inv[1], c, e, inv[5], inv[6]);
	and and10(T[10], a, inv[1], c, d, e, inv[5], inv[6], inv[7]);
	and and11(T[11], a, inv[1], c, d, e, inv[5], g, inv[7]);
	and and12(T[12], a, b, c, e, f, inv[6]);
	and and13(T[13], a, b, inv[2], d, e, f, inv[6], inv[7]);
	and and14(T[14], a, b, c, d, e, f, g, inv[7]);
	or or0(s0, T[0], T[1], T[2], T[3], T[4], T[5], T[6], T[7], T[8], T[9], T[10], T[11], T[12], T[13], T[14]);
	
	//!AE + !A!B!EF + !AB!C!EFG + !A!B!C!E!FG + !A!B!C!D!E!F!GH + !A!BC!D!E!FGH + !AB!C!D!EF!GH + !ABC!D!EFGH + A!B!C!DE!F!GH + A!B!CE!FG + A!BEF + AB!DEFG + AB!C!DEF!GH + ABC!DEFGH
	and and15(T[15], inv[0], e);
	and and16(T[16], inv[0], inv[1], inv[4], f);
	and and17(T[17], inv[0], b, inv[2], inv[4], f, g);
	and and18(T[18], inv[0], inv[1], inv[2], inv[4], inv[5], g);
	and and19(T[19], inv[0], inv[1], inv[2],inv[3], inv[4], inv[5], inv[6], h);
	and and20(T[20], inv[0], inv[1], c, inv[3], inv[4], inv[5], g, h);
	and and21(T[21], inv[0], b, inv[2], inv[3], inv[4], f, inv[6], h);
	and and22(T[22], inv[0], b, c, inv[3], inv[4], f, g, h);
	and and23(T[23], a, inv[1], inv[2], inv[3], e, inv[5], inv[6], h);
	and and24(T[24], a, inv[1], inv[2], e, inv[5], g);
	and and25(T[25], a, inv[1], e, f);
	and and26(T[26], a, b, inv[3], e, f, g); 
	and and27(T[27], a, b, inv[2], inv[3], e, f, inv[6], h);
	and and28(T[28], a, b, c, inv[3], e, f, g, h);
	or or1(s1, T[15], T[16], T[17], T[18], T[19], T[20], T[21], T[22], T[23], T[24], T[25], T[26], T[27], T[28]);
	
	//!A!B!C!D!E!F!G!H + !A!B!CD!E!F!GH + !A!BCD!E!FGH + !A!BC!D!E!FG!H + !AB!C!D!EF!G!H + !AB!CD!EF!GH + !ABCD!EFGH + !ABC!D!EFG!H + A!B!C!DE!F!G!H + A!B!CDE!F!GH + A!BCDE!FGH + A!BC!DE!FG!H + 
	//AB!C!DEF!G!H + AB!CDEF!GH + ABCDEFGH + ABC!DEFG!H
	and and29(T[29], inv[0], inv[1], inv[2], inv[3], inv[4], inv[5], inv[6], inv[7]);
	and and30(T[30], inv[0], inv[1], inv[2], d, inv[4], inv[5], inv[6], h);
	and and31(T[31], inv[0], inv[1], c, d, inv[4], inv[5], g, h);
	and and32(T[32], inv[0], inv[1], c, inv[3], inv[4], inv[5], g, inv[7]);
	and and33(T[33], inv[0], b, inv[2], inv[3], inv[4], f, inv[6], inv[7]);
	and and34(T[34], inv[0], b, inv[2], d, inv[4], f, inv[6], h);
	and and35(T[35], inv[0], b, c, d, inv[4], f, g, h);
	and and36(T[36], inv[0], b, c, inv[3], inv[4], f, g, inv[7]);
	and and37(T[37], a, inv[1], inv[2], inv[3], e, inv[5], inv[6], inv[7]);
	and and38(T[38], a, inv[1], c, d, e, inv[5], g, h);
	and and39(T[39], a, inv[1], c, inv[3], e, inv[5], g, inv[7]);
	and and40(T[40], a, b, inv[2], inv[3], e, f, inv[6], inv[7]);
	and and41(T[41], a, b, inv[2], d, e, f, inv[6], h);
	and and42(T[42], a, inv[1], inv[2], d, e, inv[5], inv[6], h);
	and and43(T[43], a, b, c, d, e, f, g, h);
	and and44(T[44], a, b, c, inv[3], e, f, g, inv[7]);
	or or2(s2, T[29], T[30], T[31], T[32], T[33], T[34], T[35], T[36], T[37], T[38], T[39], T[40], T[41], T[42], T[43], T[44]);
	
endmodule	