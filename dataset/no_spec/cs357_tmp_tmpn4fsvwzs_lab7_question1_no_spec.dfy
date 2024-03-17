method partA(z: int) returns (x: int, y: int)
{
    x:= z;
    x:= x + 1;
    y:= 2*x;
}

method partB(z: int) returns (x:int, y:int)
{
    x:= z;
    x, y := x + 1, 2*x;

}
