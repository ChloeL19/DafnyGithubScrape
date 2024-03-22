method Abs(x:int) returns (y:int)
ensures y>=0;
ensures x>=0 ==> x == y;
ensures x<0 ==> -x == y;
ensures y == abs(x); // use this instead of line 3,4
{/* TODO */ }

function abs(x: int): int{
    if x>0 then x else -x
}

method Testing(){/* TODO */ }

method MultiReturn(x:int, y:int) returns (more:int, less:int)
requires y>=0;
ensures less <= x <= more;
{/* TODO */ }

method Max(x:int, y:int) returns (a:int)
ensures a == x || a == y;
ensures x > y ==> a == x;
ensures x <= y ==> a == y;
{/* TODO */ }
