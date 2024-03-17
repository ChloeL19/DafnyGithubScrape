function min(a: nat, b: nat): nat
{
    if a < b then a else b
}

method eat(number: nat, need: nat, remaining: nat) returns (totalEaten: nat, leftOver: nat)
{
    totalEaten := min(number + need, number + remaining);
    if (number + need <= remaining) {
        leftOver := remaining - need;
    } else {
        leftOver := remaining - min(number + need, remaining);
    }
}
