method intersperse(numbers: seq<int>, delimiter: int) returns (interspersed: seq<int>)
{
    interspersed := [];
    for i := 0 to |numbers|
    {
        if i > 0 {
            interspersed := interspersed + [delimiter];
        }
        interspersed := interspersed + [numbers[i]];
    }
}

