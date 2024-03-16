// line contém uma string de tamanho l
// remover p caracteres a partir da posição at
method Delete(line:array<char>, l:nat, at:nat, p:nat)
{
    var i:nat := 0;
    while i < l-(at+p)
    { 
        line[at+i] := line[at+p+i];
        i := i+1;
    }
}
