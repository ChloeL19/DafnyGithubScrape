ghost function gcd(x:int,y:int):int
{
  if x==y then x
  else if x > y then gcd(x-y,y)
  else gcd(x,y-x)
}


method gcdI(m:int, n:int) returns (d:int)
{
  var x,y := m,n;
        d := 1;
  while x != y
    decreases             x+y
   { if x > y { x := x-y; } else { y := y-x; }
   }
  d := x;
}

ghost function gcd'(x:int,y:int):int
{
  if x==y then x
  else if x > y then gcd'(x-y,y)
  else gcd'(y,x)
}

