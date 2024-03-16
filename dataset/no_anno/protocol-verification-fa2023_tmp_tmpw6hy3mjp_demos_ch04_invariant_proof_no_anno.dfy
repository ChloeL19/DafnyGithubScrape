/* These three declarations are _abstract_ - we declare a state machine, but
 * don't actually give a definition. Dafny will assume nothing about them, so our
 * proofs below will be true for an abitrary state machine. */

type Variables
predicate Init(v: Variables)
predicate Next(v: Variables, v': Variables)

/* We'll also consider an abstract Safety predicate over states and a
 * user-supplied invariant to help prove the safety property. */

predicate Safety(v: Variables)
predicate Inv(v: Variables)

// We're going to reason about infinite executions, called behaviors here.
type Behavior = nat -> Variables

/* Now we want to prove the lemma below called SafetyAlwaysHolds. Take a look at
 * its theorem statement. To prove this lemma, we need a helper lemma for two
 * reasons: first, (because of Dafny) we need to have access to a variable for i
 * to perform induction on it, and second, (more fundamentally) we need to
 * _strengthen the induction hypothesis_ and prove `Inv(e(i))` rather than just
 * `Safety(e(i))`. */

// This is the key induction.
lemma InvHoldsTo(e: nat -> Variables, i: nat)
{
  if i == 0 {
    return;
  }
  InvHoldsTo(e, i-1);
  // this is the inductive hypothesis
}

ghost predicate IsBehavior(e: Behavior) {
  && Init(e(0))
  && forall i:nat :: Next(e(i), e(i+1))
}

lemma SafetyAlwaysHolds(e: Behavior)
  // In the labs, we'll prove these three conditions. Note that these properties
  // only require one or two states, not reasoning about sequences of states.
{
  if IsBehavior(e) {
      InvHoldsTo(e, i);
    }
  }
}

