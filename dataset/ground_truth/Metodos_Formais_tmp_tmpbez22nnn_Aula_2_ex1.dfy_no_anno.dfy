method Mult(x:nat, y:nat) returns (r: nat)
{
    var m := x;
    var n := y;
    r:=0;

    while m > 0
    {
        r := r + n;
        m := m - 1;
    }

    return r;
}
