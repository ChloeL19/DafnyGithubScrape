// problem 4:
// name:      Gabriele Berardi
// s-number: s4878728
// table:     XXX

method problem4(a: nat, b: nat)
{
  var i,j: int;
  i,j := a,b;
  while i > 0 && j > 0
  {
    if i < j {
      i,j := j,i;
    } else {
      i := i - 1;
    }
  }
}
