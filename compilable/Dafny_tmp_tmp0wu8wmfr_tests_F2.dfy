method TestSeq( x: seq<int> )
{
    assert x == x[0..|x|];
    assert forall k | 0 <= k <= |x| :: x[0..k]+x[k..|x|] == x;
    assert forall k | 0 <= k <= |x| :: x[0..k] == x[..k];
    assert forall k | 0 <= k <= |x| :: x[k..] == x[k..|x|];
    assert forall k | 0 <= k <= |x| :: x[..k]+x[k..] == x;
    assert forall z | z in x :: exists i | 0 <= i < |x| :: z==x[i];
    assert forall z | z in multiset(x) :: exists i | 0 <= i < |x| :: z==x[i];
    assert forall z :: z in multiset(x) <==> exists i | 0 <= i < |x| :: z==x[i];
    assert forall p,q | 0 <= p <= q <= |x| :: x[..p]+x[p..q]+x[q..] == x;
    if x != []
    {
        assert x[0] in x;
        assert x[|x|-1] in x;
        assert multiset(x) == multiset{x[0]}+multiset(x[1..]);
        var i :| i in x;
        if 0 <= i < |x|
        {
            assert multiset(x) == multiset(x[..i])+multiset(x[i..]);
        }
    }
    else
    {
        assert |x| == 0;
        assert multiset(x) == multiset{};
        var s: set<int> := {};
        assert |s| == 0;
        assert multiset(x) == multiset(s);
    }
}

method TestMultiset( x: multiset<int> )
{
    assert x == multiset{} <==> |x| == 0;
    if |x| == 0
    {
        assert x == multiset{};
    }
    else
    {
        var z:| z in x;
        assert z in x;
        var x' := x-multiset{z};
        assert |x| == |x'|+1;
        assert x+multiset{z} != x;
        assert |x+multiset{z}| == |x|+1;
        assert x == x'+multiset{z};
    }
}

method TestSet( x: set<int> )
{
    assert x == {} <==> |x| == 0;
    if |x| == 0
    {
        assert x == {};
    }
    else
    {
        var z:| z in x;
        assert z in x;
        var x' := x-{z};
        assert |x| == |x'|+1;
        assert x+{z} == x == x'+{z};
    }
}
