module q1_tb;
    logic [3:0] de_mux_sel;
    logic [15:0] one_hot_out;



one_hot_ecoder DUT(
    .binary(de_mux_sel),
    .one_hot(one_hot_out)
);

initial begin
    for(int i=0;i<16;i++) begin
        de_mux_sel = i;
        #10ns;
    end
    
end

endmodule

