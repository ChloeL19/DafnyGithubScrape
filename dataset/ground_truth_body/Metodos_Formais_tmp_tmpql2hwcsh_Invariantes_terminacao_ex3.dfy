// Exercício 3 da folha de exercícios
method m() {
    var i, n := 0 , 20;
    while i < n
    decreases n - i
    {
        i := i + 1;
    }
}

// i  | n  | n-i
// 0  | 20 | 20 
// 1  | 20 | 19
// 2  | 20 | 18
// .. |..  | ..
// 20 | 20 | 0
