method Triple(x: int) returns (r: int)
{
    var y := Double(x); // A verificação depende apenas do contrato e não da implementação concreta
    r := x + y;
}

method Double(x: int) returns (r: int)
