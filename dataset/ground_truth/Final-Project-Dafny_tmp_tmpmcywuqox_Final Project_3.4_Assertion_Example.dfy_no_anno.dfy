method nonZeroReturn(x: int) returns (y: int)
{
  if x == 0 {
    return x + 1;
  } else {
    return -x;
  }
}
method test() {
  var input := nonZeroReturn(-1);
}
