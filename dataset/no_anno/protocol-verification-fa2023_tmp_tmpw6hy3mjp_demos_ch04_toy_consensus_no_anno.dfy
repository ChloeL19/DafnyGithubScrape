// Ported from ivy/examples/ivy/toy_consensus.ivy.

// Ivy only supports first-order logic, which is limited (perhaps in surprising
// ways). In this model of consensus, we use some tricks to model quorums in
// first-order logic without getting into the arithmetic of why sets of n/2+1
// nodes intersect.

type Node(==)
type Quorum(==)
type Choice(==)

ghost predicate Member(n: Node, q: Quorum)

// axiom: any two quorums intersect in at least one node
// SOLUTION
// note we give this without proof: this is in general dangerous! However, here
// we believe it is possible to have Node and Quorum types with this property.
//
// The way we might realize that is to have Node be a finite type (one value for
// each node in the system) and Quorum to capture any subset with strictly more
// than half the nodes. Such a setup guarantees that any two quorums intersect.
// END
lemma {:axiom} QuorumIntersect(q1: Quorum, q2: Quorum) returns (n: Node)
{
  ghost predicate WF()
  {
    && (forall n:Node :: n in votes)
  }
}

datatype Step =
  | CastVoteStep(n: Node, c: Choice)
  | DecideStep(c: Choice, q: Quorum)

ghost predicate CastVote(v: Variables, v': Variables, step: Step)
{
  var n := step.n;
  && (v.votes[n] == {})
     // learn to read these "functional updates" of maps/sequences:
     // this is like v.votes[n] += {step.c} if that was supported
  && (v' == v.(votes := v.votes[n := v.votes[n] + {step.c}]))
}

ghost predicate Decide(v: Variables, v': Variables, step: Step)
{
  // if all nodes of a quorum have voted for a value, then that value can be a
  // decision
  && (forall n: Node | Member(n, step.q) :: step.c in v.votes[n])
  && v' == v.(decision := v.decision + {step.c})
}

ghost predicate NextStep(v: Variables, v': Variables, step: Step)
{
  && v.WF()
  && match step {
       case CastVoteStep(_, _) => CastVote(v, v', step)
       case DecideStep(_, _) => Decide(v, v', step)
     }
}

lemma NextStepDeterministicGivenStep(v: Variables, step: Step, v'1: Variables, v'2: Variables)
{
}

ghost predicate Next(v: Variables, v': Variables)
{
  exists step :: NextStep(v, v', step)
}

ghost predicate Init(v: Variables) {
  && v.WF()
  && (forall n :: v.votes[n] == {})
  && v.decision == {}
}

ghost predicate Safety(v: Variables) {
  forall c1, c2 :: c1 in v.decision && c2 in v.decision ==> c1 == c2
}

// SOLUTION
ghost predicate ChoiceQuorum(v: Variables, q: Quorum, c: Choice)
{
  forall n :: Member(n, q) ==> c in v.votes[n]
}

ghost predicate Inv(v: Variables) {
  && v.WF()
  && Safety(v)
  && (forall n, v1, v2 :: v1 in v.votes[n] && v2 in v.votes[n] ==> v1 == v2)
  && (forall c :: c in v.decision ==> exists q:Quorum :: ChoiceQuorum(v, q, c))
}
// END

lemma InitImpliesInv(v: Variables)
{}

lemma InvInductive(v: Variables, v': Variables)
{
  var step :| NextStep(v, v', step);
  // SOLUTION
  match step {
    case CastVoteStep(n, c) => {
      forall c | c in v'.decision
      {
        var q :| ChoiceQuorum(v, q, c);
      }
      return;
    }
    case DecideStep(c, q) => {
      forall c | c in v'.decision
      {
        var q0 :| ChoiceQuorum(v, q0, c);
      }
      forall c1, c2 | c1 in v'.decision && c2 in v'.decision
      {
        var q1 :| ChoiceQuorum(v, q1, c1);
        var q2 :| ChoiceQuorum(v, q2, c2);
        var n := QuorumIntersect(q1, q2);
      }
      return;
    }
  }
  // END
}

lemma SafetyHolds(v: Variables, v': Variables)
{
  if Inv(v) && Next(v, v') {
    InvInductive(v, v');
  }
}

