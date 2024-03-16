method TestSeq( x: seq<int> )
{
    {
        var i :| i in x;
        if 0 <= i < |x|
        {
        }
    }
    else
    {
        var s: set<int> := {};
    }
}

method TestMultiset( x: multiset<int> )
{
    {
    }
    else
    {
        var z:| z in x;
        var x' := x-multiset{z};
    }
}

method TestSet( x: set<int> )
{
    {
    }
    else
    {
        var z:| z in x;
        var x' := x-{z};
    }
}
