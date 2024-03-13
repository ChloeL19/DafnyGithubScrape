// predicate P(x:int)

// predicate Q(x:int)


lemma M(a: seq<int>, m: map<bool,int>)
{
    assume forall i {:trigger a[i]} :: 0 <= i < |a|-1 ==> a[i] <= a[i+1];
    var x :| 0 <= x <= |a|-2;
    assert a[x] <= a[x+1];
}
