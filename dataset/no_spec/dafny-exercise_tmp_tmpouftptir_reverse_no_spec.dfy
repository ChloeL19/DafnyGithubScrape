method Reverse(a: array<char>) returns (b: array<char>)
{
	b := new char[a.Length];
	var i := 0;
	while i < a.Length
	{
		b[i] := a[a.Length - i - 1];
		i := i + 1;
	}
}

method Main()
{
  var a := new char[]['s', 'k', 'r', 'o', 'w', 't', 'i'];
  var b := Reverse(a);
  print b[..];

  a := new char[]['!'];
  b := Reverse(a);
  print b[..], '\n';
}

