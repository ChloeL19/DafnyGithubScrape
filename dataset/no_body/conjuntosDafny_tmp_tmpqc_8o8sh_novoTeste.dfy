class Conjunto {
    var elementos: set<int>;

    constructor() {
        elementos := {};
    }

    method AdicionarElemento(elemento: int)
        requires elemento !in elementos
        modifies this
    {/* TODO */ }

}

method Main()
{/* TODO */ }
