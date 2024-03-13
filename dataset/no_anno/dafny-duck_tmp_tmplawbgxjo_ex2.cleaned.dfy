// program verifies
predicate sorted(x: string)
{
  forall j,k:: 0<=j<k<|x| ==> (x[j] as int)<=(x[k] as int)
}

method String3Sort(a: string) returns (b: string)
ensures multiset{a[0],a[1],a[2]} == multiset{b[0],b[1],b[2]}
{ 
  b := a;

  if (b[2] as int) < (b[1] as int) {b:= b[1:= b[2]][2:= b[1]];}
  if (b[1] as int) < (b[0] as int) {b:= b[0:= b[1]][1:= b[0]];}
  if (b[2] as int) < (b[1] as int) {b:= b[1:= b[2]][2:= b[1]];}
}


