predicate Permutacao(a: seq<int>, b:seq<int>)
{
    multiset(a) == multiset(b)
}

method Main()
{
    var a:= new int[3];
    a[0], a[1], a[2] := 1, 2, 3;
    var b:= new int[3];
    b[0], b[1], b[2] := 3, 1, 2;
    // Dafny não consegue comparar direto pois não é código executável.
    //assert Permutacao(a[..], b[..]);

    // o assert ativa um trigger lógico que faz com que o Dafny saiba o valor de a[..]
}
