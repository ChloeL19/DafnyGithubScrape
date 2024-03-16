method Busca<T(==)>(a:array<T>, x:T) returns (r:int)
{
    r :=0;
    while r < a.Length
    {
        if a[r]==x
        {
            return;
        }
        r := r +  1;
    }
    r := -1;
}
