method Allocate<T(0)>(n: int) returns (a: array<T>)
{
    a := new T[n];
}

method Main()
{
    var a := Allocate<int>(10);
    a[0] := 0;
}

