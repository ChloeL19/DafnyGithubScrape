module UtilitiesLibrary {
  function DropLast<T>(theSeq: seq<T>) : seq<T>
  {
    theSeq[..|theSeq|-1]
  }

  function Last<T>(theSeq: seq<T>) : T
  {
    theSeq[|theSeq|-1]
  }

  function UnionSeqOfSets<T>(theSets: seq<set<T>>) : set<T>
  {
    if |theSets| == 0 then {} else
      UnionSeqOfSets(DropLast(theSets)) + Last(theSets)
  }

  // As you can see, Dafny's recursion heuristics easily complete the recursion
  // induction proofs, so these two statements could easily be ensures of
  // UnionSeqOfSets. However, the quantifiers combine with native map axioms
  // to be a bit trigger-happy, so we've pulled them into independent lemmas
  // you can invoke only when needed.
  // Suggestion: hide calls to this lemma in a an
  //   assert P by { SetsAreSubsetsOfUnion(...) }
  // construct so you can get your conclusion without "polluting" the rest of the
  // lemma proof context with this enthusiastic forall.
  lemma SetsAreSubsetsOfUnion<T>(theSets: seq<set<T>>)
  {
  }

  lemma EachUnionMemberBelongsToASet<T>(theSets: seq<set<T>>)
  {
  }

  // Convenience function for learning a particular index (invoking Hilbert's
  // Choose on the exists in EachUnionMemberBelongsToASet).
  lemma GetIndexForMember<T>(theSets: seq<set<T>>, member: T) returns (idx:int)
  {
    EachUnionMemberBelongsToASet(theSets);
    var chosenIdx :| 0<=chosenIdx<|theSets| && member in theSets[chosenIdx];
    idx := chosenIdx;
  }

  datatype Option<T> = Some(value:T) | None

  function {:opaque} MapRemoveOne<K,V>(m:map<K,V>, key:K) : (m':map<K,V>)
  {
    var m':= map j | j in m && j != key :: m[j];
  }

  ////////////// Library code for exercises 12 and 14 /////////////////////

  // This is tagged union, a "sum" datatype.
  datatype Direction = North() | East() | South() | West()

  function TurnRight(direction:Direction) : Direction
  {
    // This function introduces two new bis of syntax.
    // First, the if-else expression: if <bool> then T else T
    // Second, the element.Ctor? built-in predicate, which tests whether
    // the datatype `element` was built by `Ctor`.
    if direction.North?
      then East
    else if direction.East?
      then South
    else if direction.South?
      then West
    else  // By elimination, West!
      North
  }

  lemma Rotation()
  {
  }

  function TurnLeft(direction:Direction) : Direction
  {
    // Another nice way to take apart a datatype element is with match-case
    // construct. Each case argument is a constructor; each body must be of the
    // same type, which is the type of the entire `match` expression.
    match direction {
      case North => West
      case West => South
      case South => East  // Try changing "East" to 7.
      case East => North
    }
  }

  ////////////// Library code for exercises 13 and 14 /////////////////////

  // This whole product-sum idea gets clearer when we use both powers
  // (struct/product, union/sum) at the same time.

  datatype Meat = Salami | Ham
  datatype Cheese = Provolone | Swiss | Cheddar | Jack
  datatype Veggie = Olive | Onion | Pepper
  datatype Order =
      Sandwich(meat:Meat, cheese:Cheese)
    | Pizza(meat:Meat, veggie:Veggie)
    | Appetizer(cheese:Cheese)

  // There are 2 Meats, 4 Cheeses, and 3 Veggies.
  // Thus there are 8 Sandwiches, 6 Pizzas, and 4 Appetizers.
  // Thus there are 8+6+4 = 18 Orders.
  // This is why they're called "algebraic" datatypes.

}

