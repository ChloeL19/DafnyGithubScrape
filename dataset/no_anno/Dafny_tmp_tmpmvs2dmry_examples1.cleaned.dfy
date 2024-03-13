method Abs(x:int) returns (y:int)
{   
    if(x<0)
    {
        return -x;
    }
    else{
    return x;
    }
}

function abs(x: int): int{
function abs(x: int): int{
    if x>0 then x else -x
}

method Testing(){
method Testing(){
    var v:= Abs(-3);
    assert v >= 0;
    assert v == 3;
}

method MultiReturn(x:int, y:int) returns (more:int, less:int)
{
    more := x + y;
    less := x - y;
}

method Max(x:int, y:int) returns (a:int)
{
    if ( x > y ) 
    { 
        a := x;
    } else 
    { 
        a := y; 
    }
}
