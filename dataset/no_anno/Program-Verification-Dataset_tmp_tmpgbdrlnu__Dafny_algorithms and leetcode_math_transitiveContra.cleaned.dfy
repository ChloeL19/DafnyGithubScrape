predicate relationOnASet<T> (R : set<(T,T)>, S : set<T>) {
predicate relationOnASet<T> (R : set<(T,T)>, S : set<T>) {
    forall ts :: ts in R ==> ts.0 in S && ts.1 in S
}
predicate transitive<T>(R: set<(T,T)>, S: set<T>)
{
  forall a, b, c ::
    a in S &&
    b in S &&
    c in S &&
    (a, b) in R &&
    (b, c) in R ==> (a, c) in R
}

lemma transitiveUnionContra<T>()
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
{
  var a, b, c, d := transitiveUnionContra<T>();
}
