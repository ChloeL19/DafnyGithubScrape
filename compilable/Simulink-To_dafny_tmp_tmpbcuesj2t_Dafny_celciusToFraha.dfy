
method celsToFraha(c: real) returns (f: real)
requires c >= -10.0 && c <= 110.0
ensures f == (1.8) * c + 32.0
{
    f:= (1.8)* c;
    f:= f+32.0;
}
