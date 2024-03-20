method A(x: nat, y: nat)
{
    if y > 2 {B(x + 2, y - 2);}
}

method B(x: nat, y: nat) 
{
    if x > 2 {A(x - 2,y + 1);}
}
