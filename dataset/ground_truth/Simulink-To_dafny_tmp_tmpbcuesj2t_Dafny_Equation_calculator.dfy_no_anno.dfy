//equation is y = a^2 + 2ab +b^2

method equation(a: int,b: int) returns (y: int)
{     
    y:= a*a;
    y:= y+(2*a*b);
    y:= y+(b*b);
}

