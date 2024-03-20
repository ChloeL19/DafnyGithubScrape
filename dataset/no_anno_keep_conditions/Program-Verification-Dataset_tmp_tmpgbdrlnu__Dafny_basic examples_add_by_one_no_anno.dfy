method add_by_one (x:int, y:int) returns (r:int)
  requires y >= 0;
  ensures r == x + y;
{
  var i:int := 0;
  r := x;
  while (i < y)
  {
    r := r + 1;
    i := i + 1;
  }
  return r;
}



























































/*
 * Illustrates de-sugaring of the while loop.
*/
method bar (x:int, y:int) returns (r:int)
  requires y >= 0;
  ensures r == x + y;
{
  var i := 0;
  r := x;
  // the invariant is true before the loop
  i, r := *, *;
  // assume the invariant holds
  assume (i <= y && r == x + i);
  // assume the ranking function is positive
  assume (y-i >= 0);
  // store the value of ranking function to compare against later
  ghost var rank_before := y-i;

  // one body of the loop
  if (i < y)
  {
    r := r + 1;
    i := i + 1;
    // invariant is true at the end of the loop
    assume (false);
  }
  // at this point only know the invariant of the loop + negation of
  // the loop condition
  return r;
}

