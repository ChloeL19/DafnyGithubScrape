// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

ghost method M()
{
   ghost var s := iset{2};
   // test "in"
   if(2 in s)
   {
   }
   else
   { assert false; }
   // test "!in"
   if(3 !in s)
   {
   }
   else
   { assert false; }

   if(s == iset{2})
   {
   }
   else
   { assert false; }
}

ghost method m1() {
 var s1:iset<int> := iset{}; // the empty set
 var s2 := iset{1, 2, 3}; // set contains exactly 1, 2, and 3
 var s3, s4 := iset{1,2}, iset{1,4};

}



