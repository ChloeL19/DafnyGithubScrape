predicate exist1(a: array<int>, x:int)
reads a
{ exists m :: (0 <= m < a.Length) && (a[m] == x) && (!(exist2(a, x))) }

predicate exist2(a: array<int>, x:int)
reads a
{ exists m :: 0 <= m < a.Length && exists n :: 0 <= n < a.Length && m != n && a[m] == x && a[n] == x}

predicate tail(a: array<int>)
reads a
{ forall m :: ((0 <= m < a.Length-1) && (a[m] == 0)) ==> a[m+1] == 0 }

method testExist1()
{/* TODO */ }

method testExist2()
{/* TODO */ }

method testTail()
{/* TODO */ }


