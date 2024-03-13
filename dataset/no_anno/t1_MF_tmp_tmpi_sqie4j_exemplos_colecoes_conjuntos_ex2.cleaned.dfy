method Main()
{
    //set comprehension
    //set x: T | p(x) :: f(x)
    //p é um predicado, f é uma função
    //conjunto de elementos f(x) tal que p(x) é verdadeiro

    assert (set x | x in {0,1,2} :: x + 0) == {0,1,2};

    //set comprehension com função identidade possui sintaxe especial
    assert (set x | x in {0,1,2,3,4,5} && x < 3) == {0,1,2};

    assert (set x:nat, y:nat | x < 2 && y < 2 :: (x,y)) == {(0, 0), (0, 1), (1, 0), (1,1)};

    //Dafny não consegue automaticamente lidar com asserções sobre set comprehension que não sejam identidades
    //assert {0*1, 1*1, 2*1} == {0,1,2};//incluir essa asserção para auxiliar o Dafny
    //assert (set x | x in {0,1,2} :: x * 1) == {0,1,2};
}
