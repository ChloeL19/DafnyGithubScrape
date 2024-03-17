method mult(a:int, b:int) returns (x:int)
{
  	x := 0;
	var y := a;
  	while y > 0
	{
		x := x + b;
		y := y - 1;
	}
}
