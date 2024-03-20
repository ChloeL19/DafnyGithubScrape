// based on https://ethz.ch/content/dam/ethz/special-interest/infk/chair-program-method/pm/documents/Education/Courses/SS2019/Program%20Verification/05-EncodingToSMT.pdf

module DafnyVersion {
  datatype Pair = Pair(x: int, y: int)

  function pair_x(p: Pair): int {
    p.x
  }

  function pair_y(p: Pair): int {
    p.y
  }

  lemma UsePair() {
    var p := Pair(1, 2);
  }
}

// Dafny encodes pairs to SMT by emitting the SMT equivalent of the following.
module Encoding {

  // We define the new type as a new "sort" in SMT. This will create a new type
  // but not give any way to construct or use it.
  type Pair(==)

  // Then we define _uninterpreted functions_ for all the operations on the
  // type. These are all the implicit operations on a DafnyVersion.Pair:
  function pair(x: int, y: int): Pair
  function pair_x(p: Pair): int
  function pair_y(p: Pair): int

  // Finally (and this is the interesting bit) we define _axioms_ that assume
  // the uninterpreted functions have the expected properties. Getting the
  // axioms right is a bit of an art in that we want sound and minimal axioms,
  // ones that are efficient for the solver, and we want to fully characterize
  // pairs so that proofs go through.
  lemma {:axiom} x_defn()
    ensures forall x, y :: pair_x(pair(x, y)) == x
  lemma {:axiom} y_defn()
    ensures forall x, y :: pair_y(pair(x, y)) == y
  lemma {:axiom} bijection()
    ensures forall p:Pair :: pair(pair_x(p), pair_y(p)) == p

  lemma UseEncoding() {

    x_defn();
    y_defn();
    bijection();

      x_defn();
    }

      y_defn();
    }

        :: p1 == p2 by {
      bijection();
    }
  }

  // Exercises to think about:
  // How exactly are the axioms being used in each proof above?
  // What happens if we remove the bijection axiom?
  // Can you think of other properties wee would expect?
  // Are we missing any axioms? How would you know? (hard)
}

