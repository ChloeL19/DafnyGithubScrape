method LinearSearch<T>(a: array<T>, P: T -> bool) returns (n: int)
{
    n := 0;
    while n != a.Length
    {
        if P(a[n]) {
            return;
        }
        n := n + 1;
    }
}
