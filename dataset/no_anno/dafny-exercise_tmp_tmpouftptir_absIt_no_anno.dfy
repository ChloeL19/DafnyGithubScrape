method AbsIt(s: array<int>) 
modifies s
{
	var i: int := 0;
	
	while i < s.Length
	{	
		if (s[i] < 0) {
			s[i] := -s[i];
		}
		i := i + 1;
	}
}

method Tester()
{
   var a := new int[][-1,2,-3,4,-5,6,-7,8,-9];                 
   // testcase 1
   AbsIt(a);
   var b:array<int> := new int[][-42,-2,-42,-2,-42,-2];        
   // testcase 2
   AbsIt(b);
   var c:array<int> := new int[][-1];                          
   // testcase 3
   AbsIt(c);
   var d:array<int> := new int[][42];                          
   // testcase 4
   AbsIt(b);
   var e:array<int> := new int[][];                            
   // testcase 5
   AbsIt(e);
}

