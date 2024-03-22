method Main()
{
    //set comprehension
    assert (set x | x in {0,1,2,3} && x < 2) == {0,1};
    
    assert (set x:nat, y:nat | x < 2 && y < 2 :: (x,y)) == {(0,0),(0,1),(1,0),(1,1)};

}
