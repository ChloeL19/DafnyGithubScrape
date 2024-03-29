// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This test ensures that the trigger  collector (the routine that picks trigger
// candidates) does not  actually consider all subsets of terms;  if it did, the
// following would take horribly long

predicate P0(x: bool)
predicate P1(x: bool)
predicate P2(x: bool)
predicate P3(x: bool)
predicate P4(x: bool)
predicate P5(x: bool)
predicate P6(x: bool)
predicate P7(x: bool)
predicate P8(x: bool)
predicate P9(x: bool)
predicate P10(x: bool)
predicate P11(x: bool)
predicate P12(x: bool)
predicate P13(x: bool)
predicate P14(x: bool)
predicate P15(x: bool)
predicate P16(x: bool)
predicate P17(x: bool)
predicate P18(x: bool)
predicate P19(x: bool)
predicate P20(x: bool)
predicate P21(x: bool)
predicate P22(x: bool)
predicate P23(x: bool)
predicate P24(x: bool)
predicate P25(x: bool)
predicate P26(x: bool)
predicate P27(x: bool)
predicate P28(x: bool)
predicate P29(x: bool)
predicate P30(x: bool)
predicate P31(x: bool)
predicate P32(x: bool)
predicate P33(x: bool)
predicate P34(x: bool)
predicate P35(x: bool)
predicate P36(x: bool)
predicate P37(x: bool)
predicate P38(x: bool)
predicate P39(x: bool)
predicate P40(x: bool)
predicate P41(x: bool)
predicate P42(x: bool)
predicate P43(x: bool)
predicate P44(x: bool)
predicate P45(x: bool)
predicate P46(x: bool)
predicate P47(x: bool)
predicate P48(x: bool)
predicate P49(x: bool)

method M() {
  assert forall x :: true || P0(x) || P1(x) || P2(x) || P3(x) || P4(x) || P5(x) || P6(x) || P7(x) || P8(x) || P9(x) || P10(x) || P11(x) || P12(x) || P13(x) || P14(x) || P15(x) || P16(x) || P17(x) || P18(x) || P19(x) || P20(x) || P21(x) || P22(x) || P23(x) || P24(x) || P25(x) || P26(x) || P27(x) || P28(x) || P29(x) || P30(x) || P31(x) || P32(x) || P33(x) || P34(x) || P35(x) || P36(x) || P37(x) || P38(x) || P39(x) || P40(x) || P41(x) || P42(x) || P43(x) || P44(x) || P45(x) || P46(x) || P47(x) || P48(x) || P49(x);
}

