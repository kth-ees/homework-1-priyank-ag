module CSA_8 (
    input logic [7:0] A,B,
    output logic [7:0]sum,
    output logic carry
);

logic carry_int_lsb, carry_int_msb, carry_ov,ccarry_nov, carry_c0;
logic [3:0] sum_lsb, sum_msb_c1_int, sum_msb_c1, sum_msb_c0;

 adder_4 lsb(
    .A(A[3:0]),
    .B(B[3:0]),
    .sum(sum_lsb),
    .carry(carry_int_lsb)
 );

 adder_4 msb_c1(
    .A(A[7:4]),
    .B(4'b0001),
    .sum(sum_msb_c1_int),
    .carry(carry_ov)
 );

 adder_4 msb_c1_ab(
    .A(sum_msb_c1_int),
    .B(B[7:4]),
    .sum(sum_msb_c1),
    .carry(carry_nov)
 );

  adder_4 msb_c0(
    .A(A[7:4]),
    .B(B[7:4]),
    .sum(sum_msb_c0),
    .carry(carry_c0)
 );

    assign sum = { (carry_int_lsb? sum_msb_c1: sum_msb_c0), sum_lsb};
    assign carry = carry_int_lsb? (carry_ov | carry_nov): carry_c0; 




endmodule

// module adder_4(
//     input logic [3:0] A,B,
//     output logic[3:0] sum,
//     output logic carry
// );

// assign {carry, sum} = A+B;

endmodule
