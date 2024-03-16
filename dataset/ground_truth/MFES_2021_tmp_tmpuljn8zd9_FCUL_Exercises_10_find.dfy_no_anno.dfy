method find(a: array<int>, key: int) returns(index: int)
{
    index := 0;
    while index < a.Length && a[index] != key 
        decreases a.Length - index 
    {
        index := index + 1;
    }
}
