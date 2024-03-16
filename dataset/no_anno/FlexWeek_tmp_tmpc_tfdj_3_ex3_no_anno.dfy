method Max(a:array<nat>)returns(m:int)
{
    if(a.Length == 0){
        return -1;
    }
    var i := 0;
    m := a[0];
    {
        if(a[i] >= m){
            m:= a[i];
        }
        i := i+1;
    }
    
}
method Checker()
{
    var a := new nat[][1,2,3,50,5,51];
    // ghost var  a := [1,2,3];
    var n := Max(a);
    // assert a[..] == [1,2,3];
    // assert MAXIMUM(1,2) == 2;
    
    // assert ret_max(a,a.Length-1) == 12;
    // assert ret_max(a,a.Length-1) == x+3;
}
