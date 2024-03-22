// Sequencias são imutáveis
// não pode ser alterado dados de uma sequencia
// normalmente apresentado como um conjunto de valores sequentes entre colchetes
method Main()
{
    // Isto é uma sequencia de inteiros vazia
    var vazia: seq<int> := [];

    // Isto é uma sequencia de valores entre 1 á 5
    var s := [1,2,3,4,5];

    // Possuem com pertence e não pertence na sequencia implementado
    // posso verificar qual o tamanho da sequencia, como abaixo:
    assert |s| == 5;

    // pode ser verificado o valor de uma posição de uma sequencia
    assert s[0] == 1;

    // posso verificar e criar uma outra sequencia, separando em pedaços
    assert s[1..3] == [2,3];

    // posso verificar de uma posição em diante
    assert s[1..] == [2,3,4,5];

    // posso verificar até a posição 3
    assert s[..3] == [1,2,3];

    // posso verificar se um item pertence a uma sequencia
    assert 1 in s;

    // posso verificar se um item não pertence a uma sequencia
    assert 0 !in s;

    // posso concatenar sequencias
    assert [1,2] + [3,4] == [1,2,3,4];

    assert vazia < s; // prefixos
    assert [1,2] < s; // prefixo, se ler da esquerda para a direita
    assert [1,2,3,4,5] <= s; //prefixo próprio, precisa ter <=

    // NÃO PODE TIRAR OU COLOCAR NADA DENTRO

    //tentando criar uma nova sequencia
    assert s[2 := 0] == [1,2,0,4,5]; //igual a sequencia s mas quer na pos 2 o valor 0
}
