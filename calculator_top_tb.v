`timescale 1ns / 1ps


module calculator_top_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg [1:0] opcode;

    wire [15:0] result;
    wire carry_out;
    wire negative_flag;

    // Instantiate Top Module
    calculator_top uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out),
        .negative_flag(negative_flag)
    );

    // VCD File Generation
    initial begin
        $dumpfile("calculator_waveform.vcd");
        $dumpvars(0, calculator_top_tb);
    end

    // Monitor Outputs
    initial begin
        $monitor("TIME=%0t | A=%d | B=%d | OPCODE=%b | RESULT=%d | CARRY=%b | NEGATIVE=%b",
                  $time, A, B, opcode, result, carry_out, negative_flag);
    end

    initial begin

        // ADDITION
        A = 8'd10;
        B = 8'd5;
        opcode = 2'b00;
        #10;

        // ADDITION OVERFLOW
        A = 8'd255;
        B = 8'd1;
        opcode = 2'b00;
        #10;

        // SUBTRACTION
        A = 8'd20;
        B = 8'd10;
        opcode = 2'b01;
        #10;

        // NEGATIVE SUBTRACTION
        A = 8'd5;
        B = 8'd10;
        opcode = 2'b01;
        #10;

        // MULTIPLICATION
        A = 8'd12;
        B = 8'd4;
        opcode = 2'b10;
        #10;

        $finish;

    end

endmodule