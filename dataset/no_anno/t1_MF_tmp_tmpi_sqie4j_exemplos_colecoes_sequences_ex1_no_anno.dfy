//tipo seq<T>
//tipo valor imutável
//literal [1,2,3]

method Main()
{
    var vazia: seq<int> := []; //sequência vazia precisa especificar o tipo explicitamente
    var s := [1, 2, 3, 4, 5];
    
    var t := [3.14, 2.7, 1.41, 1985.44, 100.0, 37.2][1:0:3]; //slices
}
