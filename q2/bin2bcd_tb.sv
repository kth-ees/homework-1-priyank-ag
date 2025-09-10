module q2_tb;

    logic [3:0] in, out;
    logic cout;

    hex_to_bcd DUT(
        .hex_in(in),
        .BCD(out),
        .carry(cout)
    );

    initial begin

        for(int i =0; i<16;i++) begin

            in = i;
            #10ns;

        end

    end

endmodule

