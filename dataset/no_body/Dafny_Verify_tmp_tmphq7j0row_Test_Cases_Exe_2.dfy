method a_2_26(x: int, y: int)
requires 2 * x + y <= 98
ensures 2 * x + y <= 99
{/* TODO */ }

method b_2_26(x: int, y: int) returns (z: int)
requires 2 * x + y <= 99
ensures z <= 100
{/* TODO */ }

method c_2_26(x: int, y: int)
requires 2 * x + y <= 99
ensures 2 * x + y <= 99
{/* TODO */ }

method exerciseA(x: int, y: int)
requires x + y < 100
ensures true
{/* TODO */ }

method exerciseB(x: int, y: int) 
requires -2 * x + y - 4 < 100
ensures -2 * x + y - 4 < 100
{/* TODO */ }

method a_2_30(x: int, y: int)
requires x < 10
ensures x < 10
{/* TODO */ }

// method b_2_30(x: int, y: int)
// requires (y >= 10) || (x < 10 - y)
// ensures x < 10
// {/* TODO */ }


