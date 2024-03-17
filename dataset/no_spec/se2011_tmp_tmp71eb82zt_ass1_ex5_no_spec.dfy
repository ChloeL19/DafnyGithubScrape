predicate exist1(a: array<int>, x:int)
{ exists m :: (0 <= m < a.Length) && (a[m] == x) && (!(exist2(a, x))) }

predicate exist2(a: array<int>, x:int)
{ exists m :: 0 <= m < a.Length && exists n :: 0 <= n < a.Length && m != n && a[m] == x && a[n] == x}

predicate tail(a: array<int>)
{ forall m :: ((0 <= m < a.Length-1) && (a[m] == 0)) ==> a[m+1] == 0 }

method testExist1()
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	var x: int := 1;
	x := 0;
	x := 3;
	x := 42;
}

method testExist2()
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	var x: int := 1;
	x := 0;
	x := 3;
	x := 42;
}

method testTail()
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	var b: array<int> := new int[][0,0];
	var c: array<int> := new int[][];
	var d: array<int> := new int[][9,1,3,8,5];
	var e: array<int> := new int[][1,0,2];
	var f: array<int> := new int[][0,1];
}


