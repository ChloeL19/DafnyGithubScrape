static function {:opaque} power(b:int, e:nat) : int
{
    if (e==0) then
        1
    else
        b*power(b,e-1)
}

