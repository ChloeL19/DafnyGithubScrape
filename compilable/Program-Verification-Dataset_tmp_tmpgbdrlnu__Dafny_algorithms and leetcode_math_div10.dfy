method divu10(n: bv16) returns (r: bv16)
  ensures r == n/10;
 {
  var q: bv16;
//   step1
  q := (n >> 1) + (n >> 2);
//   step2
  q := q + (q >> 4);
  // step3
  q := q + (q >> 8);
  // step4
  q := q >> 3;
  // step5
  r := n - (((q << 2) + q) << 1);
  // step 6
  return q + if (r > 9) then 1 else 0;
}

