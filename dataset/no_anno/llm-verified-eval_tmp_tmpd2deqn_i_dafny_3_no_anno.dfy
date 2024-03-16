function sum(s: seq<int>, n: nat): int
{
    if |s| == 0 || n == 0 then
        0
    else
        s[0] + sum(s[1..], n-1)
}

lemma sum_plus(s: seq<int>, i: nat)
{
}

method below_zero(ops: seq<int>) returns (result: bool)
{
    result := false;
    var t := 0;
    for i := 0 to |ops|
    {
        t := t + ops[i];
        sum_plus(ops, i);
        if t < 0 {
            result := true;
            return;
        }
    }
}
