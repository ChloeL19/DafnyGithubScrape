// Exercise 7. Change the loop invariant to 0 <= i <= n+2. Does the loop still verify? Does the assertion i == n after the loop still verify?

method m(n: nat)
{
	var i: int := 0;
	while i < n
	{
		i := i + 1;
	}
}
//yes it will still verify
