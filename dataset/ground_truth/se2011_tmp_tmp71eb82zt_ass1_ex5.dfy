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
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	assert a[0] == 3 && a[1] == 3 && a[2] == 1 && a[3] == 0 && a[4] == 0 && a[5] == 0;
	var x: int := 1;
	assert exist1(a,x);
	x := 0;
	assert !exist1(a,x);
	x := 3;
	assert !exist1(a,x);
	x := 42;
	assert !exist1(a,x);
}

method testExist2()
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	assert a[0] == 3 && a[1] == 3 && a[2] == 1 && a[3] == 0 && a[4] == 0 && a[5] == 0;
	var x: int := 1;
	assert !exist2(a,x);
	x := 0;
	assert exist2(a,x);
	x := 3;
	assert exist2(a,x);
	x := 42;
	assert !exist2(a,x);
}

method testTail()
{
	var a: array<int> := new int[][3,3,1,0,0,0];
	assert a[0] == 3 && a[1] == 3 && a[2] == 1 && a[3] == 0 && a[4] == 0 && a[5] == 0;
	assert tail(a);
	var b: array<int> := new int[][0,0];
	assert b[0] == 0 && b[1] == 0;
	assert tail(b);
	var c: array<int> := new int[][];
	assert tail(c);
	var d: array<int> := new int[][9,1,3,8,5];
	assert d[0] == 9 && d[1] == 1 && d[2] == 3 && d[3] == 8 && d[4] == 5;
	assert tail(d);
	var e: array<int> := new int[][1,0,2];
	assert e[0] == 1 && e[1] == 0 && e[2] == 2;
	assert !tail(e);
	var f: array<int> := new int[][0,1];
	assert f[0] == 0 && f[1] == 1;
	assert !tail(f);
}


