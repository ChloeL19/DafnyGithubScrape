function Average(a: int, b: int): int 
{
    (a + b) / 2
}

ghost method Triple(x: int) returns (r: int)
{
    r := Average(2 * x, 4 * x);
}

method Triple1(x: int) returns (r: int)
{
    var y := 2 * x; 
    r := x + y;
    ghost var a, b := DoubleQuadruple(x);
}

ghost method DoubleQuadruple(x: int) returns (a: int, b: int)
{
    a := 2 * x;
    b := 2 * a;
}

function F(): int {
29
}

method M() returns (r: int) 
{
r := 29;
}

method Caller() {
var a := F();
var b := M();
}

method MyMethod(x: int) returns (y: int)
{ 
    var a, b;
    a := x + 3;

    if x < 20 {
        b := 32 - x;
    } else {
        b := 16;
    }

    y := a + b;
}
