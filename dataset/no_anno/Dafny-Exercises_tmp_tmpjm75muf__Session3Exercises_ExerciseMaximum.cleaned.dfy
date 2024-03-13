//Algorithm 1: From left to right return the first
method mmaximum1(v:array<int>) returns (i:int) 
{
    var j:=1; i:=0;
    while(j<v.Length)
        decreases v.Length - j
        invariant 0<=j<=v.Length
        invariant 0<=i<j
        invariant forall k:: 0<=k<j ==> v[i] >= v[k]
    {
        if(v[j] > v[i]){i:=j;}
        j:=j+1;
    }
}

//Algorithm 2: From right to left return the last
method mmaximum2(v:array<int>) returns (i:int) 
{
    var j:=v.Length-2; i:=v.Length - 1;
    while(j>=0)
        decreases j
        invariant 0<=i<v.Length
        invariant -1<=j<v.Length-1
        invariant forall k :: v.Length>k>j ==> v[k]<=v[i]
    {
        if(v[j] > v[i]){i:=j;}
        j:=j-1;
    }
}


method mfirstMaximum(v:array<int>) returns (i:int)
{
    var j:=1; i:=0;
    while(j<v.Length)
        decreases v.Length - j
        invariant 0<=j<=v.Length
        invariant 0<=i<j
        invariant forall k:: 0<=k<j ==> v[i] >= v[k]
        invariant forall k:: 0<=k<i ==> v[i] > v[k]
    {
        if(v[j] > v[i]){i:=j;}
        j:=j+1;
    }
}

method mlastMaximum(v:array<int>) returns (i:int)
{
    var j:=v.Length-2;
    i := v.Length-1;
    while(j>=0)
    decreases j
    invariant -1<=j<v.Length-1
    invariant 0<=i<v.Length
    invariant forall k :: v.Length>k>j ==> v[k]<=v[i]
    invariant forall k :: v.Length>k>i ==> v[k]<v[i]
    {
        if(v[j] > v[i]){i:=j;}
        j:=j-1;
    }
}

//Algorithm : from left to right
//Algorithm : from right to left

method mmaxvalue1(v:array<int>) returns (m:int)
{
    var i:=mmaximum1(v);
    m:=v[i];
}

method mmaxvalue2(v:array<int>) returns (m:int)
{
    var i:=mmaximum2(v);
    m:=v[i];
}
