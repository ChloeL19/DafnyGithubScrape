method LinearSearch<T>(a: array<T>, P: T -> bool) returns (n: int)
{
    n := 0;

    while n != a.Length
        decreases a.Length - n
    {
        if P(a[n]) {
            return; }
        n := n + 1;
    }
    n := -1;

}

method LinearSearch1<T>(a: array<T>, P: T -> bool, s1:seq<T>) returns (n: int)
{
    n := 0;

    while n != |s1|
        decreases |s1| - n
    {
        if P(a[n]) {
            return; }
        n := n + 1;
    }
    n := -1;

}


method LinearSearch2<T(==)>(data: array<T>, Element:T, s1:seq<T>) returns (position:int)
{
    var n := 0;
    position := 0;
    while n != |s1|
        decreases |s1| - n
    {
        if data[|s1|-1-n] == Element 
        {
            position := n + 1;
            return position; 
        }
        n := n + 1;
    }
    position := -1;
}

method LinearSearch3<T(==)>(data: array<T>, Element:T, s1:seq<T>) returns (position:int)
{
    var n := 0;
    var n1 := |s1|;
    position := 0;
    while n != |s1|
        decreases |s1| - n
    {
        if data[data.Length -n1 +n] == Element 
        {
            position := n + 1;
            return position; 
        }
        n := n + 1;
    }
    
    position := -1;
}
