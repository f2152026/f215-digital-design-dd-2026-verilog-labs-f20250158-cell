// cla4.v
// (Carried forward from Task 3 -- paste in your completed, delay-annotated
// version.)
// Gate-level 4-bit carry-lookahead adder, matching the lecture circuit.
// Every gate needs an explicit delay (constant is fine here, e.g. #(2)) --
// this is the default from Task 2 onward, not a special step.
//
// TODO -- Step 1: generate/propagate signals (one xor + one and per bit)
//   p[i] = a[i] ^ b[i]
//   g[i] = a[i] & b[i]
//
// TODO -- Step 2: direct (non-recursive) carry equations. Verilog's and/or
// primitives accept more than 2 inputs directly, e.g.:
//   and #(2) (t2, p1, p0, g0);
// so you do not need to manually chain 2-input gates.
//   c1 = g0 + p0.cin
//   c2 = g1 + p1.g0 + p1.p0.cin
//   c3 = g2 + p2.g1 + p2.p1.g0 + p2.p1.p0.cin
//   c4 = g3 + p3.g2 + p3.p2.g1 + p3.p2.p1.g0 + p3.p2.p1.p0.cin
//
// TODO -- Step 3: sum bits
//   sum[i] = p[i] ^ c[i]     (c0 = cin)

module cla4(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire p0, p1, p2, p3;
  wire g0, g1, g2, g3;
  wire c1, c2, c3;

  // TODO: your gate-level P/G, carry, and sum logic goes here.
  // (cout should be connected to c4.) Remember the delay on every gate.
module cla64_blocked(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [15:1] c;   // carries BETWEEN blocks: c[1]..c[15]

  // TODO: your sixteen cla4 instances go here.
  cla4 block0 (.a(a[3:0]),    .b(b[3:0]),    .cin(cin),  .sum(sum[3:0]),    .cout(c[1]));
  cla4 block1 (.a(a[7:4]),    .b(b[7:4]),    .cin(c[1]),  .sum(sum[7:4]),    .cout(c[2]));
  cla4 block2 (.a(a[11:8]),    .b(b[11:8]),    .cin(c[2]),  .sum(sum[11:8]),    .cout(c[2]));
  cla4 block3 (.a(a[15:12]),    .b(b[15:12]),    .cin(c[3]),  .sum(sum[15:12]),    .cout(c[3]));
  cla4 block4 (.a(a[19:16]),    .b(b[19:16]),    .cin(c[4]),  .sum(sum[19:16]),    .cout(c[4]));
  cla4 block5 (.a(a[23:20]),    .b(b[23:20]),    .cin(c[5]),  .sum(sum[23:20]),    .cout(c[5]));
  cla4 block6 (.a(a[27:24]),    .b(b[27:24]),    .cin(c[6]),  .sum(sum[27:24]),    .cout(c[6]));
  cla4 block7 (.a(a[31:28]),    .b(b[31:28]),    .cin(c[7]),  .sum(sum[31:28]),    .cout(c[7]));
  cla4 block8 (.a(a[35:32]),    .b(b[35:32]),    .cin(c[8]),  .sum(sum[35:32]),    .cout(c[8]));
  cla4 block9 (.a(a[39:36]),    .b(b[39:36]),    .cin(c[9]),  .sum(sum[39:36]),    .cout(c[9]));
  cla4 block10 (.a(a[43:40]),    .b(b[43:40]),    .cin(c[10]),  .sum(sum[43:40]),    .cout(c[10]));
  cla4 block11 (.a(a[47:44]),    .b(b[47:44]),    .cin(c[11]),  .sum(sum[47:44]),    .cout(c[11]));
  cla4 block12 (.a(a[51:48]),    .b(b[51:48]),    .cin(c[12]),  .sum(sum[51:48]),    .cout(c[12]));
  cla4 block13 (.a(a[55:52]),    .b(b[55:52]),    .cin(c[13]),  .sum(sum[55:52]),    .cout(c[13]));
  cla4 block14 (.a(a[59:56]),    .b(b[59:56]),    .cin(c[14]),  .sum(sum[59:56]),    .cout(c[14]));
  cla4 block15 (.a(a[63:60]),    .b(b[63:60]),    .cin(c[15]),  .sum(sum[63:60]),    .cout(c[15]));

endmodule
