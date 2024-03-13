function increment(n: nat): nat
{
    if n == 0 then 1 else
        (if n % 2 == 1 then 2 * increment(n / 2) else n + 1)
}
