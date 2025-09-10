
module hex_to_bcd(
    input logic [3:0] hex_in,
    output logic [3:0] BCD,
    output logic carry
);

logic [15:0] bcd1, bcd2,bcd3,bcd4,carry_lut;

assign bcd4 = 16'b0000001100000000;
assign bcd3 = 16'b1100000011110000;
assign bcd2 = 16'b0011000011001100;
assign bcd1 = 16'b1010101010101010;
assign carry_lut = 16'b11111110000000000;

always_comb begin
    BCD = 4'b0;
    carry = 1'b0;

    BCD[0] = bcd1[hex_in];
    BCD[1] = bcd2[hex_in];
    BCD[2] = bcd3[hex_in];
    BCD[3] = bcd4[hex_in];
    carry = carry_lut[hex_in];

end

endmodule
