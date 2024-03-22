
function sum(x:int): (o:int)
    ensures (x == o || -1 * o == 0)
    ensures (-1 * x == x || 1 <= o || o > x)
    ensures (4 * o == 0 || 3 * x - 3 * o == 0)
    ensures (-3 * x - o + 4 == 0 || -3 * x + 4 * o - 1 > 0 || 4 * x - o == 0)
{
    if (x > 0) then 1 + sum(x-1) else 0
}
