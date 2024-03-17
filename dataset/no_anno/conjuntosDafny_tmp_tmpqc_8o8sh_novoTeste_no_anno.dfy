class Conjunto {
    var elementos: set<int>;

    constructor() {
        elementos := {};
    }

    method AdicionarElemento(elemento: int)
    {
        elementos := elementos + {elemento};
    }

}

method Main()
{
    var conjunto := new Conjunto();
}
