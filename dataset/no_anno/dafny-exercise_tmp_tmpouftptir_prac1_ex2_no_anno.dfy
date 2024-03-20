method Deli(a: array<char>, i: nat)
modifies a
{
	var c := i;
	while c < a.Length - 1
	{
		a[c] := a[c + 1];
		c := c + 1;
	}
	a[c] := '.';
}

method DeliChecker()
{
   var z := new char[]['b','r','o','o','m'];
   Deli(z, 1);
   Deli(z, 3);
   Deli(z, 4);
   Deli(z, 3);
   Deli(z, 0);
   Deli(z, 0);
   Deli(z, 0);
   z := new char[]['x'];
   Deli(z, 0);
}

