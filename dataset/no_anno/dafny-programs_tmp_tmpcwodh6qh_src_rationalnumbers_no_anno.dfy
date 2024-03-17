datatype Pair = Pair(first: int, second: int)

function make_rat(n: int, d: int): Pair
{
    Pair(n, d)
}

function numer(n: Pair): int
{
    n.first 
}

function denom(n: Pair): int
{
    n.second
}

predicate eq(n1: Pair, n2: Pair)
{
    numer(n1) * denom(n2) == numer(n2) * denom(n1)
}

function add_rat(n1: Pair, n2: Pair): Pair 
{
    Pair(numer(n1) * denom(n2) + numer(n2) * denom(n1), denom(n1) * denom(n2))
}

function sub_rat(n1: Pair, n2: Pair): Pair 
{
    Pair(numer(n1) * denom(n2) + numer(n2) * denom(n1), denom(n1) * denom(n2))
}

