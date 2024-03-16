// General form of a ShardedStateMachine
// To instantiate one, fill in the 'Shard' type, the 'glue' function
// provide the 'Next' predicate and the invariant 'Inv',
// and then meet various proof obligations in the form of lemmas.

abstract module ShardedStateMachine {
  /*
   * A ShardedStateMachine contains a 'Shard' type that represents
   * a shard of the state machine.
   */

  type Shard

  predicate valid_shard(a: Shard)

  /*
   * There must be some notion that lets us put two shards together.
   */

  function glue(a: Shard, b: Shard) : Shard

  /*
   * The 'glue' operation must respect monoidal laws.
   */

  lemma glue_commutative(a: Shard, b: Shard)
}

