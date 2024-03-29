method a_2_26(x: int, y: int)
requires 2 * x + y <= 98
ensures 2 * x + y <= 99
{
    var x := x + 1;
    var y := x + y;
}

method b_2_26(x: int, y: int) returns (z: int)
requires 2 * x + y <= 99
ensures z <= 100
{
    var y := x + y;
    var x := x + 1;
    z := x + y;
}

method c_2_26(x: int, y: int)
requires 2 * x + y <= 99
ensures 2 * x + y <= 99
{
    var x, y := x + 1, x + y;
}

method exerciseA(x: int, y: int)
requires x + y < 100
ensures true
{   
    var x := 0;
    var y := 0;
    x := 32;
    y := 40;
}

method exerciseB(x: int, y: int) 
requires -2 * x + y - 4 < 100
ensures -2 * x + y - 4 < 100
{
    var x := 0;
    var y := 0;

    x := x + 2;
    y := y - 3 * x;
}

method a_2_30(x: int, y: int)
requires x < 10
ensures x < 10
{
    if x % 2 == 0 { 
        var y := y + 3; 
    } else {
        var y := 4; 
    }
}

// method b_2_30(x: int, y: int)
// requires (y >= 10) || (x < 10 - y)
// ensures x < 10
// {
//     if y < 10 {
//         y := x + y;
//     } else { 
//         x := 8;
//     }
// }


