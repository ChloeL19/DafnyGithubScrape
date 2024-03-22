method Min2(x: int, y: int) returns (m:int)
    ensures m <= x && m <= y
    ensures m == x || m == y // m est le min de x et y
{
    if x < y{ m := x;}
    else{ m := y; }
}

method Min3(x: int, y: int, z: int) returns (m:int)
    ensures m <= x && m <= y && m <= z
    ensures m == x || m == y || m == z // m est le min de x, y et z
{
    if x < y {
        if x < z {
            m := x;
        }else{
            m := z;
        }  
    }else{
        if y < z{
            m := y;
        }else{
            m := z;
        }
    }
}

method Min3_bis(x: int, y: int, z: int) returns (m:int)
    ensures m <= x && m <= y && m <= z
    ensures m == x || m == y || m == z // m est le min de x, y et z
{
    var min_xy := Min2(x,y);
    m := Min2(min_xy, z);
}
    
