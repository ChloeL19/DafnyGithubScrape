method Min2(x: int, y: int) returns (m:int)
    ensures m <= x && m <= y
    ensures m == x || m == y // m est le min de x et y
{/* TODO */ }

method Min3(x: int, y: int, z: int) returns (m:int)
    ensures m <= x && m <= y && m <= z
    ensures m == x || m == y || m == z // m est le min de x, y et z
{/* TODO */ }

method Min3_bis(x: int, y: int, z: int) returns (m:int)
    ensures m <= x && m <= y && m <= z
    ensures m == x || m == y || m == z // m est le min de x, y et z
{/* TODO */ }
    
