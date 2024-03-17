method GetEven(s: array<nat>) modifies s
{
	var i := 0;
	while i < s.Length 
	{
		if s[i] % 2 == 1 {
			s[i] := s[i] + 1;
		}
		i := i + 1;
	}
}

method evenTest()
{
	var a:array<nat> := new nat[][0,9,4];
   	GetEven(a);
}

