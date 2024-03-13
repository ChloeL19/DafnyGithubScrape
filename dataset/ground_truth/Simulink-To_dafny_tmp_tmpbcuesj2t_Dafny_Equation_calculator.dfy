//equation is y = a^2 + 2ab +b^2

method equation(a: int,b: int) returns (y: int)
requires true;
ensures y== (a*a)+ (2*a*b) + (b*b)
{     
    y:= a*a;
    y:= y+(2*a*b);
    y:= y+(b*b);
}

