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
  function glue(a: Shard, b: Shard) : Shard
  lemma glue_commutative(a: Shard, b: Shard)
  lemma glue_associative(a: Shard, b: Shard, c: Shard)
  function unit() : Shard
  lemma glue_unit(a: Shard)
  predicate Inv(s: Shard)
  predicate Next(shard: Shard, shard': Shard)
  lemma NextPreservesValid(s: Shard, s': Shard)
  lemma NextAdditive(s: Shard, s': Shard, t: Shard)
  lemma NextPreservesInv(s: Shard, s': Shard)
