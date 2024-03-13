module SetBijectivity {
  lemma BijectivityImpliesEqualCardinality<A, B>(setA: set<A>, setB: set<B>, relation: iset<(A, B)>)
  {
    if |setA| == 0 {
    } else {
      var a :| a in setA;
      var b :| b in setB && (a, b) in relation;
      var setA' := setA - {a};
      var setB' := setB - {b};
      BijectivityImpliesEqualCardinality(setA', setB', relation);
    }
  }

  lemma CrossProductCardinality<A, B>(setA: set<A>, setB: set<B>, cp: set<(A,B)>)
  {
    if |setA| == 0 {
      assert setA == {};
      assert cp == {};
    } else {
      var x :| x in setA;
      var setA' := setA - {x};
      var cp' := (set a, b | a in setA' && b in setB :: (a,b));
      var line := (set a, b | a == x && b in setB :: (a,b));

      assert |line| == |setB| by {
        var relation := iset p : ((A, B), B) | p.0.1 == p.1;
        forall b | b in setB
        ensures exists p :: p in line && (p, b) in relation
        {
          var p := (x, b);
          assert p in line && (p, b) in relation;
        }
        BijectivityImpliesEqualCardinality(line, setB, relation);
      }

      CrossProductCardinality(setA', setB, cp');
      assert cp == cp' + line;
      assert cp' !! line;
      assert |cp'| == |setA'| * |setB|;
      assert |setA'| == |setA| - 1;
      assert |cp|
          == |cp' + line|
          == |cp'| + |line|
          == (|setA| - 1) * |setB| + |setB|
          == |setA| * |setB|;
    }
  }
}

