function min(a: nat, b: nat): nat
{
    if a < b then a else b
}

method eat(number: nat, need: nat, remaining: nat) returns (totalEaten: nat, leftOver: nat)
    requires number <= 1000
    requires need <= 1000
    requires remaining <= 1000
    ensures totalEaten == min(number + need, number + remaining)
    ensures leftOver == if number + need <= remaining then remaining - need else 0
{/* TODO */ }
