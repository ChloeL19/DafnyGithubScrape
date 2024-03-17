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
    } else {
      var x :| x in setA;
      var setA' := setA - {x};
      var cp' := (set a, b | a in setA' && b in setB :: (a,b));
      var line := (set a, b | a == x && b in setB :: (a,b));

        var relation := iset p : ((A, B), B) | p.0.1 == p.1;
        forall b | b in setB
        {
          var p := (x, b);
        }
        BijectivityImpliesEqualCardinality(line, setB, relation);
      }

      CrossProductCardinality(setA', setB, cp');
          == |setA| * |setB|;
    }
  }
}

