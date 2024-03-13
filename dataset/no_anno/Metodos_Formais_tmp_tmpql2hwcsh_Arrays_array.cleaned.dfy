// Busca sequencial

// Busca: Array<N>xN -> B (um Array de Naturais mais um natural tem como resultado um booleano)
// Pré: True
// Pós: r <=> 
// Busca(A,x) {
    // i = 0
    // enquanto (i < |A|) {
        // se (A[] == x) {
            //retorno true
            // i++
        //}
    //}
    // retorne false
//}

// Processo da Busca
// A -> 3 | 1 | 0 | 0
// queremos x = 0, temos |A| = 4

// x | i | A[i] | |A|
// 0 | 0 |  3   | 4
// 0 | 1 |  1   | 4
// 0 | 2 |  0   | 4
// retorna True
// Pensamento da invariante:
// valor de i tem que ser maior ou igual a zero e menor que o tamanho do vetor
// 0 <= i <= |A|
// outra coisa, até o i = 2 sabemos com certeza que ainda não foi achado o valor
// para todo j pertencente aos naturais, j é maior ou igual a 0 e j é menor que i e que a
// posição do vetor j é diferente do valor x, o i não foi alterado ainda quando sai do laço, por isso 
// ela também é uma invariante

method Busca()
