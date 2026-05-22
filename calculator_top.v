`timescale 1ns / 1ps


module calculator_top(
    input [7:0] A,
    input [7:0] B,
    input [1:0] opcode,
    output [15:0] result,
    output carry_out,
    output negative_flag
);

arithmetic_unit AU (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry_out(carry_out),
    .negative_flag(negative_flag)
);

endmodule