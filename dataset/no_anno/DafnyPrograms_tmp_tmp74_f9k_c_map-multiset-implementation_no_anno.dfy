/**
  This ADT represents a multiset.
 */
trait MyMultiset {

  // internal invariant
  ghost predicate Valid()
  { elem in theMultiset }

  method Remove(elem: int) returns (didChange: bool)
}

/**
This implementation implements the ADT with a map.
 */
class MultisetImplementationWithMap extends MyMultiset {

  // valid invariant predicate of the ADT implementation
  ghost predicate Valid()
  {
    (forall i | i in elements.Keys :: elements[i] > 0) && (theMultiset == A(elements)) && (forall i :: i in elements.Keys <==> Contains(i))
  }

  // the abstraction function
  function A(m: map<int, nat>): (s:multiset<int>)
  var elements: map<int, nat>;

  // constructor of the implementation class that ensures the implementation invariant
  constructor MultisetImplementationWithMap()
  {
    elements := map[];
    theMultiset := multiset{};
  }
//adds an element to the multiset
  method Add(elem: int) returns (didChange: bool)
  {
    if !(elem in elements) {
      elements := elements[elem := 1];
    } else {
      elements := elements[elem := (elements[elem] + 1)];
    }
    
    didChange := true;

    theMultiset := A(elements);
  }

//removes an element from the multiset
  method Remove(elem: int) returns (didChange: bool)
  {
    /* If the multiset does not contain the element */
    if elem !in elements {
      return false;
    }

    /* If the multiset contains the element */
    elements := elements[elem := elements[elem] - 1];

    if(elements[elem] == 0) {
      elements := elements - {elem};
    }

    theMultiset := A(elements);
    didChange := true;
  }

//gets the length of the multiset
  method Length() returns (len: int)
  {
    var result := Map2Seq(elements);
    return |result|;
  }

//compares the current multiset with another multiset and determines if they're equal
  method equals(other: MyMultiset) returns (equal?: bool)
  {
    var otherMapSeq := other.getElems();
    var c := this.getElems();
    return multiset(c) == multiset(otherMapSeq);
  }

//gets the elements of the multiset as a sequence
  method getElems() returns (elems: seq<int>)
  {
    var result : seq<int>;
    result := Map2Seq(elements);
    return result;
  }

//Transforms a map to a sequence
  method Map2Seq(m: map<int, nat>) returns (s: seq<int>)
  {
    if |m| == 0 {return []; }

    var keys := m.Keys;
    var key: int;
    s := [];

    while keys != {}
    {

      key :| key in keys;

      var counter := 0;

      while counter < m[key]
      {
        s := s + [key];
        counter := counter + 1;
      }

      keys := keys - {key};

    }
    LemmaReverseA(m, s);
  }

  method Test1()
  {

    assume this.theMultiset == multiset{1, 2, 3, 4};
    assume this.Valid();

    // get elements test
    var a := this.getElems();
    var theOtherBag : MultisetImplementationWithMap;
    theOtherBag := new MultisetImplementationWithMap.MultisetImplementationWithMap();

    // equals test - unequal bags
    var b:= this.equals(theOtherBag);
    theOtherBag.theMultiset := multiset{1, 2, 3, 4};
    theOtherBag.elements := map[1 := 1, 2:=1, 3:=1,4:=1];
    var c:= this.equals(theOtherBag);
  }

  method Test2()
  {

    assume this.theMultiset == multiset{1, 2, 3, 4};
    assume this.Valid();

    // get elements test
    var a := this.getElems();
    var d := this.Add(3);
    var e := this.getElems();
    var f := this.Remove(4);
    var g := this.getElems();
    var h := this.Length();
  }

  method Test3()
  {

    //test Map2Seq
    var m := map[2:= 2, 3:=3, 4:= 4];
    var s :seq<int> := [2, 2, 3, 3, 3, 4, 4,4 ,4];

    var a := this.Map2Seq(m);
    var x := map[1 := 1, 2:= 1, 3:= 1];
    var y :seq<int> := [1, 2, 3];

    var z := this.Map2Seq(x);
  }
}
