method A(x: nat, y: nat)
{
    B(x, y);
}

method B(x: nat, y: nat) 
{
    if x > 0 && y > 0 {A(x - 1,y - 1);}
}
