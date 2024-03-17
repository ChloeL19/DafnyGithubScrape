
function And(a: bool, b: bool): bool { a && b }
function Or(a: bool, b: bool): bool { a || b }
function Not(a: bool): bool { ! a }

// takes 20s in Coq 8.9 and 40s to Qed and times out in Coq 8.10, while it's immediate in Dafny
lemma test(Y: int, r0: int, r: int, q: int, q0: int, r1: int, q1 : int)
{}

