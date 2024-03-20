// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {
  var s := { 1,9,3,7,5};
  m(s);
  mp(map[ 1:= 3, 3:= 5]);
}


method m(s: set<int>) {
  var ss := s;
  while ss != {}
  {
    var i: int :| i in ss;
    ss := ss - {i};
    print i, "\n";
  }
}

method mp(m: map<int,int>)
{
  var items := m.Items;
  while items != {}
  {
    var item :| item in items;
    items := items - { item };
    print item.0, " ", item.1, "\n";
  }
}

method mpi(m: imap<int,int>)
{
  var items: iset<(int,int)> := m.Items;
  var keys: iset<int> := m.Keys;
  var vals: iset<int> := m.Values;
}

method mseq(s: seq<int>) {
  var i: int := 0;
  var sum: int := 0;
  while i < |s|
  {
    sum := sum + s[i];
    i := i + 1;
  }
}

method marr(s: array<int>) {
  var i: int := 0;
  var sum: int := 0;
  while i < s.Length
  {
    sum := sum + s[i];
    i := i + 1;
  }

  var rev := new int[s.Length];
  forall i | 0 <= i < s.Length {
    rev[i] := s[s.Length-i-1];
  }
}

