/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09
// Date      : Sun Apr  5 05:01:22 2026
/////////////////////////////////////////////////////////////


module up_down_counter ( Clock, rst, up_down, count );
  output [3:0] count;
  input Clock, rst, up_down;
  wire   N14, N15, N16, n9, n10, n11, n12, n13, n14, n15, n16, n17;

  DFFARX1_RVT \count_reg[0]  ( .D(n15), .CLK(Clock), .RSTB(n9), .Q(count[0]), 
        .QN(n15) );
  DFFARX1_RVT \count_reg[1]  ( .D(N14), .CLK(Clock), .RSTB(n9), .Q(count[1]), 
        .QN(n16) );
  DFFARX1_RVT \count_reg[2]  ( .D(N15), .CLK(Clock), .RSTB(n9), .Q(count[2]), 
        .QN(n17) );
  DFFARX1_RVT \count_reg[3]  ( .D(N16), .CLK(Clock), .RSTB(n9), .Q(count[3])
         );
  INVX0_RVT U16 ( .A(rst), .Y(n9) );
  AO22X1_RVT U17 ( .A1(count[1]), .A2(count[0]), .A3(n16), .A4(n15), .Y(n10)
         );
  HADDX1_RVT U18 ( .A0(up_down), .B0(n10), .SO(N14) );
  INVX1_RVT U19 ( .A(up_down), .Y(n12) );
  OA222X1_RVT U20 ( .A1(up_down), .A2(n16), .A3(n12), .A4(count[0]), .A5(
        count[1]), .A6(n15), .Y(n11) );
  HADDX1_RVT U21 ( .A0(count[2]), .B0(n11), .SO(N15) );
  AO22X1_RVT U22 ( .A1(count[1]), .A2(count[0]), .A3(n16), .A4(n12), .Y(n13)
         );
  OA221X1_RVT U23 ( .A1(count[2]), .A2(n15), .A3(n17), .A4(up_down), .A5(n13), 
        .Y(n14) );
  HADDX1_RVT U24 ( .A0(count[3]), .B0(n14), .SO(N16) );
endmodule

