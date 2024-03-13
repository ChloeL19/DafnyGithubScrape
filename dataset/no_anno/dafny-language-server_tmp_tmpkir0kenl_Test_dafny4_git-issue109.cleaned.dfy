// RUN: %dafny /compile:0 /rprint:"%t.rprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype MyTuple = MyTuple(x:int, y:int)

method M()
{
}



