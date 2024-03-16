class Contador
{
    var valor: int;

    //construtor anônimo
    constructor ()
    {
        valor := 0;
    }

    //construtor com nome
    constructor Init(v:int)
    {
        valor := v;
    }

    method Incrementa()
    {
        valor := valor + 1;
    }

    method Decrementa()
    {
        valor := valor -1 ;
    }

    method GetValor() returns (v:int)
    {
        return valor;
    }
}

method Main()
{
    var c := new Contador(); //cria um novo objeto no heap via construtor anônimo
    var c2 := new Contador.Init(10); //cria um novo objeto no heap via construtor nomeado
    var v := c.GetValor();
    var v2 := c2.GetValor();
    c.Incrementa();
    v := c.GetValor();
    c.Decrementa();
    v := c.GetValor();
}
