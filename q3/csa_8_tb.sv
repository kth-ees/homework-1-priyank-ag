module CSA_8_tb;

  // Testbench signals
  logic [7:0] A, B;
  logic [7:0] sum;
  logic       carry;

  // Golden reference
  logic [8:0] golden;

  // DUT
  CSA_8 dut (
    .A(A),
    .B(B),
    .sum(sum),
    .carry(carry)
  );

  integer errors = 0;
  integer fd; // file descriptor

  initial begin
    // Open file for writing
    fd = $fopen("CSA_8_results.txt", "w");
    if (fd == 0) begin
      $error("Failed to open output file!");
      $finish;
    end

    // Write header
    $fwrite(fd, "Time\tA\tB\tDUT_sum\tDUT_carry\tGolden\tResult\n");

    // Loop through all inputs
    for (int i = 0; i < 256; i++) begin
      for (int j = 0; j < 256; j++) begin
        A = i;
        B = j;

        #10ns; // delay for waveform/debug

        golden = A + B;

        if ({carry, sum} !== golden) begin
          $fwrite(fd, "%0t\t%0d\t%0d\t%0d\t%b\t\t%0d\tFAIL\n",
                      $time, A, B, sum, carry, golden);
          errors++;
        end else begin
          $fwrite(fd, "%0t\t%0d\t%0d\t%0d\t%b\t\t%0d\tPASS\n",
                      $time, A, B, sum, carry, golden);
        end
      end
    end

    $fwrite(fd, "Finished exhaustive test: %0d errors\n", errors);
    $fclose(fd);

    $display("Exhaustive test complete. Results written to CSA_8_results.txt");
    $finish;
  end

endmodule
