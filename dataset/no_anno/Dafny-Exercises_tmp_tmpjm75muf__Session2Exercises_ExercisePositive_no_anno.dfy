predicate positive(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}


method mpositive(v:array<int>) returns (b:bool)
{
    var i:=0;
    //1. assert positive(v[..0])
    while i<v.Length && v[i]>=0
    {
        //2. assert 0<=i<v.Length && positive(v[..i]);
        i:=i+1;
        //2. assert 0<=i<v.Length && positive(v[..i]);
    }
    //3. assert i==v.Length ==> positive(v[..]);
    //3. assert i<v.Length => v[i]<0;
    b := i==v.Length;
}

method mpositive3(v:array<int>) returns (b:bool)
{
    var i:=0; b:=true;
    while(i<v.Length && b)
    {
        b:=v[i]>=0;
        i:=i+1;
    }
}

method mpositive4(v:array<int>) returns (b:bool)
{
    var i:=0; b:=true;
    while(i<v.Length && b)
    {
        b:=v[i]>=0;
        i:=i+1;
    }
    
}

method mpositivertl(v:array<int>) returns (b:bool)
{
    var i:=v.Length-1;
    while(i>=0 && v[i]>=0)
    {
        i:=i-1;
    }
    b:= i==-1;
}



