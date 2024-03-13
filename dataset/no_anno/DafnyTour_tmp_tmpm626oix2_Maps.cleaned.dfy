// Translated from https://github.com/mit-plv/coqutil/blob/master/src/coqutil/Map/TestGoals.v

ghost predicate Extends<K, V>(m1: map<K, V>, m2: map<K, V>) {
    forall k :: k in m2 ==> k in m1 && m1[k] == m2[k]
}

ghost predicate UndefOn<K(!new), V>(m: map<K, V>, p: K -> bool) {
    forall k :: p(k) ==> k !in m
}

ghost predicate Disjoint<K(!new)>(p1: K -> bool, p2: K -> bool) {
    forall k :: !(p1(k) && p2(k))
}

ghost predicate Subset<K(!new)>(p1: K -> bool, p2: K -> bool) {
    forall k :: p1(k) ==> p2(k)
}

ghost predicate OnlyDiffer<K(!new), V>(m1: map<K, V>, p: K -> bool, m2: map<K, V>) {
    forall k :: p(k) || (k !in m1 && k !in m2) || (k in m1 && k in m2 && m1[k] == m2[k])
}

function Diff<K>(p1: K -> bool, p2: K -> bool): K -> bool {
function Diff<K>(p1: K -> bool, p2: K -> bool): K -> bool {
    k => p1(k) && !p2(k)
}


// In Coq, proving this lemma requires a user written map solver tactic, which
// took several days to develop, and used to solve the goal in about a minute,
// and after a few days of performance improvements, it can now solve the goal in 3s.
// Compare this to Dafny, which solves this goal almost instantaniously, without any
// user assistance.
lemma flattenStmt_correct_aux_lemma6<K(!new), V>(
{}

