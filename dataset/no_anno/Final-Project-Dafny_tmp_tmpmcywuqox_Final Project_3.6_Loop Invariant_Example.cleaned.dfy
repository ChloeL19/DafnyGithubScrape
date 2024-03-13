method incrementingNumber(N: nat) {
method incrementingNumber(N: nat) {
  var v: nat := 0;
  while (v < N)
    invariant 0 <= v <= N
  {
    v := v + 1;
  }
  assert v == N;
}
