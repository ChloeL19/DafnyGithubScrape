predicate relationOnASet<T> (R : set<(T,T)>, S : set<T>) {
    forall ts :: ts in R ==> ts.0 in S && ts.1 in S
}
predicate transitive<T>(R: set<(T,T)>, S: set<T>)
    requires relationOnASet(R, S)
{
  forall a, b, c ::
    a in S &&
    b in S &&
    c in S &&
    (a, b) in R &&
    (b, c) in R ==> (a, c) in R
}

lemma transitiveUnionContra<T>()
  returns (
  R1: set<(T, T)>, S1: set<T>,
  R2: set<(T, T)>, S2: set<T>)
  ensures relationOnASet(R1, S1)
  ensures relationOnASet(R2, S2)
  ensures transitive(R1, S1)
  ensures transitive(R2, S2)
  ensures ! transitive(R1 + R2, S1 + S2)
{
  var a : T :| assume true;
  var b : T :| assume a != b;
  var c : T :| assume a != c && b != c;
  S1 := {a, b};
  S2 := {b, c};
  R1 := {(a, b)};
  R2 := {(b, c)};
}

lemma notTrueAlways<T>()
  ensures !
  (forall S1 : set<T>, S2 : set<T>, R1 : set<(T,T)>, R2 : set<(T, T)> ::
  relationOnASet(R1, S1) &&
  relationOnASet(R2, S2) &&
  transitive(R1, S1) &&
  transitive(R2, S2)  ==> transitive(R1 + R2, S1 + S2)
  )
{
  var a, b, c, d := transitiveUnionContra<T>();
}
