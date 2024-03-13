// http://verifythus.cost-ic0701.org/common-example/arraymax-in-dafny

method max(a:array<int>) returns(max:int)
{
    if (a.Length == 0)  { 
        max := 0;
        return;
    }

    max := a[0];
    var i := 1;

    while i < a.Length
        invariant i <= a.Length //i is bounded by the array
        invariant forall j :: 0 <= j < i ==> max >= a[j] //max is bigger or equal to anything seen so far (up to j)
        invariant exists j :: 0 <= j < i && max==a[j]    //max exists somewhere in the seen portion of the array
    {
        if a[i] > max
        {
            max := a[i];
        }
        i := i + 1;
    }
 
} 
