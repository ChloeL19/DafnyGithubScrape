// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate G<X(!new)>(f:X~>bool)
  reads f.reads;
{
  true
}

predicate H()
{
  G((x:int) => true)
}

predicate P1<X>(m:map<X,bool>)
{
  true
}

predicate P2(m:map<int,bool>)
{
  P1(map x:int | x in m :: true)
}

