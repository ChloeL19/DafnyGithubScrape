function sum(a: array<int>, i: int): int
{
    a[i] + if i == 0 then 0 else sum(a, i - 1)
}

method cumsum(a: array<int>, b: array<int>)
{
    b[0] := a[0]; // Initialise le premier élément de b
    var i := 1;
    
    while i < a.Length
        invariant 1 <= i <= a.Length
        invariant forall i' | 0 <= i' < i :: b[i'] == sum(a, i')
    {
        b[i] := b[i - 1] + a[i]; // Calcule la somme cumulée pour chaque élément
        i := i + 1;
    }
}

