method Triple(x: int) returns (r: int)
  ensures r == 3*x
{
    var y := Double(x); // A verificação depende apenas do contrato e não da implementação concreta
    r := x + y;
}

method Double(x: int) returns (r: int)
 ensures r == 2*x

