method if_else_test (i: int) returns (out: int)
requires true;
ensures (out==100 && i>0) || (out==200 && i<= 0)
{
    if(i > 0)
    {
        out:= 100;
    }
    else
    {
        out:= 200;
    }
}
