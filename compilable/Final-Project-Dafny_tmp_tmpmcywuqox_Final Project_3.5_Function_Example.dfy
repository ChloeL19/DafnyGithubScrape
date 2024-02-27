function nonZeroReturn(x: int): int {
  if x == 0 then x + 1 else -x
}
method test() {
  assert nonZeroReturn(-1) == 1;
}
