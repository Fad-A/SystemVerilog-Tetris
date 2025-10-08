// ### Fadi Ajaj ### 
// A SystemVerilog Tetris Project

// Tetris: Runs the game.
// Inputs:
// Rotate: 00 -> No rotation, 01 -> Clockwise, 10 -> Counterclockwise
// direction: 00 -> No movement, 01 -> left, 10 -> Down, 11 -> Right
// Outputs: 
// screen: 10x20 array of displayed 
Module tetris(input logic rotate[1:0], input logic direction[1:0], input logic reset,
              input logic start, output logic[399:0] screen);


endmodule
// module part1(input logic [3:0] a, b, input logic c_in,
//     output logic [3:0] s, c_out);

//     FA u0(a[0], b[0], c_in, s[0], c_out[0]);
//     FA u1(a[1], b[1], c_out[0], s[1], c_out[1]);
//     FA u2(a[2], b[2], c_out[1], s[2], c_out[2]);
//     FA u3(a[3], b[3], c_out[2], s[3], c_out[3]);

// endmodule

// module FA(input logic a, b, c_in, output logic s, c0);
//     logic a_xor_b;

//     assign s = c_in ^ a_xor_b;
//     assign a_xor_b = a ^ b;

//     always_comb
//     case (a_xor_b)
//         1'b0: c0 = b;
//         1'b1: c0 = c_in;
//         default: c0 = 0;
//     endcase
// endmodule