// RUN: %dafny  /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Main()
{
  mapTest();
  imapTest();
}

method mapTest() {
  print "map test \n";
  var m := map[4 := 5, 6 := 7];
  print m.Keys, "\n";
  print m.Values, "\n";
  print m.Items, "\n";
}

method imapTest() {
  print "imap test \n";
  var m := imap[4 := 5, 6 := 7];
  print m.Keys, "\n";
  print m.Values, "\n";
  print m.Items, "\n";
}


