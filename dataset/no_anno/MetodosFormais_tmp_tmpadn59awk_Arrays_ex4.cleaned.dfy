//for simples, pouco detalhado, sem nenhuma invariant
method Main () {
method Main () {
    var a := new nat[5];
    //inicializar todas as posições com 0
    //invariant - quem decrease é a distancia entre a e i
    forall i | 0 <= i < a.Length
    {
        a[i] := 0;
    }
    assert a[3] == 0;
}
