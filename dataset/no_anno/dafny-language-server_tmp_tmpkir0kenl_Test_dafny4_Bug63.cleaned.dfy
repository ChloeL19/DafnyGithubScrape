// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method M()
{
}

method Client()
{
  assume forall o: object {:nowarn} :: false;
  M();
}

