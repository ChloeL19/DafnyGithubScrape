method partA(z: int) returns (x: int, y: int)
requires z == 2
ensures y - x == 3
{
    x:= z;
    x:= x + 1;
    y:= 2*x;
}

method partB(z: int) returns (x:int, y:int)
requires z == 4
ensures y - x == 3
{
    x:= z;
    x, y := x + 1, 2*x;

}
