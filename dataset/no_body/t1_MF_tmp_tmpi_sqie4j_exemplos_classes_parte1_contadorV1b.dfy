class Contador
{
    var valor: int;

    //construtor anônimo
    constructor ()
      ensures valor == 0
    {
        valor := 0;
    }

    //construtor com nome
    constructor Init(v:int)
      ensures valor == v
    {
        valor := v;
    }

    method Incrementa()
      modifies this
      ensures valor == old(valor) + 1
    {/* TODO */ }

    method Decrementa()
      modifies this
      ensures valor == old(valor) - 1
    {/* TODO */ }

    method GetValor() returns (v:int)
      ensures v == valor
    {/* TODO */ }
}

method Main()
{/* TODO */ }
