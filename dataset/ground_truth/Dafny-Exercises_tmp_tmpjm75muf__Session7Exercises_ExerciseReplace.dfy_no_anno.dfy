


method replace(v:array<int>, x:int, y:int)
{
    var i:=0;
    while(i<v.Length)
    decreases v.Length - i
    {

        if(v[i]==x){
            v[i]:=y;
        }
        i:=i+1;
    }
}

