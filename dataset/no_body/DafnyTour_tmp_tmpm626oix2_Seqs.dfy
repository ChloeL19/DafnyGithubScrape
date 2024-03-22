/*
lemma test<T(!new)>(l: seq<T>, i: int, n: int)
    requires |l| == n
    requires 0 <= i < n
    ensures |l[..i] + seq(n-i, j requires 0 <= j < n-i => l[i+j])| == n
{/* TODO */ }
*/

lemma updateSliceLen<T(!new)>(l: seq<T>, elems: seq<T>, i: int, sz: int, n: int)
    requires |l| == n
    requires 0 <= sz
    requires 0 <= i && i + sz < n
    requires |elems| == sz
    ensures |l[..i] + elems + l[i+sz..]| == n
{/* TODO */ }

// Getting Boogie & SMT:
// export PATH=~/.vscode/extensions/dafny-lang.ide-vscode-3.1.1/out/resources/4.1.0/github/dafny:$PATH
// dafny Seqs.dfy /print:mydebug.bpl /proverLog:mydebug.smt2

// Info on how to get boogie output:
// https://github.com/dafny-lang/dafny/issues/1153

