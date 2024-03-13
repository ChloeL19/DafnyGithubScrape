// a)
function F(x: int): int 
    decreases x
{
    if x < 10 then x else F(x - 1)
}

// b)
function G(x: int): int 
    decreases x
{
    if x >= 0 then G(x - 2) else x
}

// c)
function H(x: int): int 
    decreases x + 61
{
    if x < -60 then x else H(x - 1)
}

// d)
function I(x: nat, y: nat): int 
    decreases x + y
{
    if x == 0 || y == 0 then
        12
    else if x % 2 == y % 2 then
        I(x - 1, y)
    else
        I(x, y - 1)
}

// e)
function M(x: int, b: bool): int
    decreases !b
{
    if b then x else M(x + 25, true)
}

// f)
function L(x: int): int 
    decreases 99 - x
{
    if x < 100 then L(x + 1) + 10 else x
}

// g)
function J(x: nat, y: nat): int
    decreases x, y // SOMETHING
{
    if x == 0 then
        y
    else if y == 0 then
        J(x - 1, 3)
    else
        J(x, y - 1)
}
