


method replace(v:array<int>, x:int, y:int)
{
    var i:=0;
    while(i<v.Length)
    {

        if(v[i]==x){
            v[i]:=y;
        }
        i:=i+1;
    }
}

