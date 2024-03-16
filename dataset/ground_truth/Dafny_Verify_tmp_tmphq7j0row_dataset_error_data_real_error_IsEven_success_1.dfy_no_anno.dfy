function even(n: int): bool
{
  if n == 0 then true else !even(n-1)
}

method is_even(n: int) returns (r: bool)
{
  var i: int := 0;
  r := true;

  while i < n
  {
    r := !r;
    i := i + 1;
  }
}
