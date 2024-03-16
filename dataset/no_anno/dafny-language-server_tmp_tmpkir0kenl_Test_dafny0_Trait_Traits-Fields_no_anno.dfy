// RUN: %dafny /compile:3 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

trait J
{
  var x: int;
}

class C extends J
{

}

method Main()
{
  var c := new C;
  var j: J? := new C;

  j.x := 8;
  c.x := 9;
  j := c;
  print "j"; Print(j);
  print "c"; Print(c);

  c := null;
  j := null;
}

method Print(j: J)
{
  print ".x = ", j.x, "\n";
}

