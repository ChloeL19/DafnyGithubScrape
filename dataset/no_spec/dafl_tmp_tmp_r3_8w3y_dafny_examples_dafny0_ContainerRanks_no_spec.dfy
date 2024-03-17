// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype Abc = End | Wrapper(seq<Abc>)

lemma SeqRank0(a: Abc)
{
}

lemma SeqRank1(s: seq<Abc>)
{
}

datatype Def = End | MultiWrapper(multiset<Def>)

lemma MultisetRank(a: Def)
{
}

datatype Ghi = End | SetWrapper(set<Ghi>)

lemma SetRank(a: Ghi)
{
}

