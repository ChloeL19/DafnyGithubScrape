method Main(xInit: int, y: int) returns (z: int)
{
  var x := xInit;
  z := x * y;
  
  while x > 0
  {
    x := x - 1;
    z := z - y;
  }
}
