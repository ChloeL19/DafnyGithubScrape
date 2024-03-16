
function min(a: int, b: int): int
{
    if a < b then a else b
}

method minMethod(a: int, b: int) returns (c: int)
{
    if a < b {
        c := a;
    } else {
        c := b;
    }
}

ghost function minFunction(a: int, b: int): int
{
    if a < b then a else b
}


// Return a minimum of a.
method minArray(a: array<int>) returns (m: int)
{
    /* TODO */
    m := a[0]; // Initialise m avec le premier élément du tableau
    var i := 1;
    while i < a.Length
    {
        /* TODO */
        if a[i] < m {
            m := a[i];
        }
        i := i + 1;
    }
}

method Main(){
    var integer:= min(1,2);
    print(integer);
}

