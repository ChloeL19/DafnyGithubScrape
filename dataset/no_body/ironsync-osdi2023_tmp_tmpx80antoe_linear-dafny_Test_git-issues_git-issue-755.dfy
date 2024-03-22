// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }


method m(s: set<int>) {/* TODO */ }

method mp(m: map<int,int>)
{/* TODO */ }

method mpi(m: imap<int,int>)
{/* TODO */ }

method mseq(s: seq<int>) {/* TODO */ }

method marr(s: array<int>) {/* TODO */ }

