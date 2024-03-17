function somaAteAberto(a:array<nat>, i:nat):nat
{
    if i ==0
    then 0
    else a[i-1] + somaAteAberto(a,i-1)
}

method somatorio(a:array<nat>) returns (s:nat)
{
    s := 0;
    for i:= 0 to a.Length
    {
        s := s + a[i];
    }
} 
