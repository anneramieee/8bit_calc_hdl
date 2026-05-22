`timescale 1ns / 1ps


module arithmetic_unit(
    input [7:0] A,
    input [7:0] B,
    input [1:0] opcode,
    output reg [15:0] result,
    output reg carry_out,
    output reg negative_flag
);

always @(*) begin

    // Default values
    result = 16'h0000;
    carry_out = 0;
    negative_flag = 0;

    case(opcode)

        // Addition
        2'b00: begin
            result = A + B;
            carry_out = (A + B > 8'hFF);
        end

        // Subtraction
        2'b01: begin
            result = A - B;

            if (A < B)
                negative_flag = 1;
        end

        // Multiplication
        2'b10: begin
            result = A * B;
        end

        // Unused Opcode
        default: begin
            result = 16'h0000;
        end

    endcase

end

endmodule