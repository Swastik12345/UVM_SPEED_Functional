module tb_top;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    logic clk;
    always #5 clk = ~clk;

    speed_if sif(clk);

    speed_dut dut(
        .clk(clk),
        .speed(sif.speed),
        .overspeed(sif.overspeed)
    );

    initial begin
        clk = 0;
        run_test("speed_test");
    end

endmodule
