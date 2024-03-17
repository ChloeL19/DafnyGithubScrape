/*
lemma test<T(!new)>(l: seq<T>, i: int, n: int)
{}
*/

lemma updateSliceLen<T(!new)>(l: seq<T>, elems: seq<T>, i: int, sz: int, n: int)
{}

// Getting Boogie & SMT:
// export PATH=~/.vscode/extensions/dafny-lang.ide-vscode-3.1.1/out/resources/4.1.0/github/dafny:$PATH
// dafny Seqs.dfy /print:mydebug.bpl /proverLog:mydebug.smt2

// Info on how to get boogie output:
// https://github.com/dafny-lang/dafny/issues/1153

