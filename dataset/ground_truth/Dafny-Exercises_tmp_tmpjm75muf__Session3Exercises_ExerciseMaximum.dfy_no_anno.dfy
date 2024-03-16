//Algorithm 1: From left to right return the first
method mmaximum1(v:array<int>) returns (i:int) 
{
    var j:=1; i:=0;
    while(j<v.Length)
        decreases v.Length - j
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
