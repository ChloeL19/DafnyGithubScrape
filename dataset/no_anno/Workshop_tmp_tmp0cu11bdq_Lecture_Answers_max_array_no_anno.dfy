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
    {
        if a[i] > max
        {
            max := a[i];
        }
        i := i + 1;
    }
 
} 
