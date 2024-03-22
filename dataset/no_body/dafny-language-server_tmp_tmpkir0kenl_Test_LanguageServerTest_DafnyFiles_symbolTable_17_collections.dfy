method F() {
   var s1 : set<int> := {}; // the empty set
   var s2 := {1, 2, 3}; // set contains exactly 1, 2, and 3
   assert s2 == {1,1,2,3,3,3,3}; // same as before
   var s3, s4 := {1,2}, {1,4};

   assert s2 + s4 == {1,2,3,4}; // set union
   assert s2 * s3 == {1,2} && s2 * s4 == {1}; // set intersection
   assert s2 - s3 == {3}; // set difference

   assert {1} <= {1, 2} && {1, 2} <= {1, 2}; // subset
   assert {} < {1, 2} && !({1} < {1}); // strict, or proper, subset
   assert {1, 2} == {1, 2} && {1, 3} != {1, 2}; // equality and non-equality

   assert 5 in {1,3,4,5};
   assert 1 in {1,3,4,5};
   assert 2 !in {1,3,4,5};
   assert forall x :: x !in s1;
}
