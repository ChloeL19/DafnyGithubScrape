method plus_one (x: int) returns (r:int)
{return x+1;}
method add_by_one (x:int, y:int) returns (r:int)
{
  assume (y >= 0);
  var i:int := 0;
  r := x;

  r := *;
  i := *;
  assume (i <= y);
  assume (r == x + i);
  if (i < y)
    // decreases y-i;
  {
    // assert (i >= -2);
    assume (i < -2);
    var t := y - i;
    r := r + 1;
    i := i + 1;
    assume (false);
  }

  return r;
}

