method Max(a: int, b: int) returns (c: int)
{
 if a > b {
   return a;
 } else {
   return b;
 }
}
 
method MaxTest() {
 var low := 1;
 var high := 10;
 var v := Max(low, high);
}

function max(a: int, b: int): int
{
  if a > b then a else b
}

method maxTest() {
}
