// 1 a)

// [ai, aj[
function sum(a: array<int>, i: int, j: int) : int
{
  if i == j then 0
  else a[j-1] + sum(a, i, j-1)
}

// 1 b)
method query(a: array<int>, i: int, j: int) returns (res : int)
{
  res := 0;
  var ind := j-1;

  while ind >= i
  {
    res := res + a[ind];
    ind := ind - 1;
  }
}

// 1 c)
// a -> [1, 10, 3, −4, 5]
// c -> [0, 1, 11, 14, 10, 15]
method queryFast(a: array<int>, c: array<int>, i: int, j: int) returns (r: int)
{
  var k := i;
  proof(a, 0, j, k);
  r := c[j] - c[i];
}

predicate is_prefix_sum_for (a: array<int>, c: array<int>)
  reads c, a
{
  a.Length + 1 == c.Length && forall i: int :: 0 <= i <= a.Length ==> c[i] == sum(a, 0, i)
}

lemma proof(a: array<int>, i: int, j: int, k:int)
{
  l := Nil;
  var i := a.Length - 1;
  while i >= 0
  {
    l := Cons(a[i], l);
    i := i - 1;
  }
}

function mem<T(==)> (x: T, l: List<T>) : bool
{
  match l
  case Nil => false
  case Cons(h, t) => h == x || mem(x, t)
}
