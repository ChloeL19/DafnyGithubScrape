// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

type t = i:int | 0 <= i < 10

ghost function f():t

ghost function g():int

lemma L1() returns(m:map<int, t>)
{/* TODO */ }

lemma L2() returns(m:map<int, t>)
{/* TODO */ }

