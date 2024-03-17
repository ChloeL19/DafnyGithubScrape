// shenanigans going through the dafny tutorial

method MultipleReturns(x: int, y: int) returns (more: int, less: int)
{
  more := x + y;
  less := x - y;
}

method Max(a: int, b: int) returns (c: int)
{
  if a > b {
    c := a;
  } else { c := b; }
}

method Testing() {
  var x := Max(3,15);
}

function max(a: int, b: int): int
{
  if a > b then a else b
}
method Testing'() {
}

function abs(x: int): int
{
  if x < 0 then -x else x
}
method Abs(x: int) returns (y: int)
{
  return abs(x);
}

method m(n: nat)
{
  var i := 0;
  while i != n
  {
    i := i + 1;
  }
}

function fib(n: nat): nat
{
  if n == 0 then 0
  else if n == 1 then 1
  else fib(n - 1) + fib(n - 2)
}

method Find(a: array<int>, key: int) returns (index: int)
{
  var i := 0;
  while i < a.Length
  {
    if a[i] == key {return i;}
    i := i+1;
  }
  return -1;
}

method FindMax(a: array<int>) returns (i: int)
{
  i := 0;
  var max := a[i];
  var j := 1;
  while j < a.Length 
  {
    if max < a[j] { max := a[j]; i := j; }
    j := j+1;
  }
}
predicate sorted(a: array<int>)
{
  forall j, k :: 0 <= j < k < a.Length ==> a[j] < a[k]
}

predicate sorted'(a: array?<int>) // Change the type
{
  forall j, k :: a != null && 0 <= j < k < a.Length ==> a[j] <= a[k]
}
