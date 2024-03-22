method MultipleReturns(inp1: int, inp2: int) returns (more: int, less: int)
   requires inp1 > 0
   requires inp2 > 0
   ensures less < inp1 < more
{
   more := inp1 + inp2;
   less := inp1 - inp2;
}
