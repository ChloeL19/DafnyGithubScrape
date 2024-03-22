method Eg(z: int) returns (x: int, y: int)
requires 7 <= z
ensures x < 10 && y <= z
{
    x:= 6;
    y:= 7;
}
