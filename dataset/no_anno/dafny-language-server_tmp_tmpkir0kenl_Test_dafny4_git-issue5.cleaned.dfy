// RUN: %dafny /compile:0 /print:"%t.print" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate isEven(x:int)
{
  x % 2 == 0
}

function f(x:int, y:int): (z:int)
{
	  2*(x+y) + 10
}

twostate function P2(x: int) : (z: int)
  ensures z == x - 1
	ensures P2(x) == z
	ensures P2(x) == x - 1
{
   x - 1
}

module Interface
{
  function addSome(n: nat): nat
{
  function addSome(n: nat): (z: nat)
  {
    n + 1
  }
}

function foo(x:int, y:int) : (v: (int, int))
{
  (x, y)
}

// bar will not be marked as recursive
function bar(x:int, y:int) : int
{
   10
}

// bar1 will be marked as recursive
function bar1(x:int, y:int) : int
{
   10
}

// bar2 will be marked as recursive
function bar2(x:int, y:int) : int
{
  10
}


