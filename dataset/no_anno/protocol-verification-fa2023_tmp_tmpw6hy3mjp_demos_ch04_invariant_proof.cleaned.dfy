/* These three declarations are _abstract_ - we declare a state machine, but
 * don't actually give a definition. Dafny will assume nothing about them, so our
 * proofs below will be true for an abitrary state machine. */

type Variables
predicate Init(v: Variables)
predicate Next(v: Variables, v': Variables)
predicate Safety(v: Variables)
predicate Inv(v: Variables)
lemma InvHoldsTo(e: nat -> Variables, i: nat)
{
  if i == 0 {
    return;
  }
  InvHoldsTo(e, i-1);
  // this is the inductive hypothesis
  assert Inv(e(i-1));
  // the requirements let us take the invariant from one step to the next (so in
  // particular from e(i-1) to e(i)).
  assert forall i:nat :: Inv(e(i)) ==> Inv(e(i+1));
}

ghost predicate IsBehavior(e: Behavior) {
  && Init(e(0))
  && forall i:nat :: Next(e(i), e(i+1))
}

lemma SafetyAlwaysHolds(e: Behavior)
{
  if IsBehavior(e) {
    assert Inv(e(0));
    forall i:nat
      ensures Safety(e(i)) {
      InvHoldsTo(e, i);
    }
  }
}

