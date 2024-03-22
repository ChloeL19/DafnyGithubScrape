// ****************************************************************************************
//                              DafnyIntro.dfy
// ****************************************************************************************
// Some very simple assorted Hoare triples.

// Here we model Hoare triples in Dafny
// Modify them and observe how Dafny reacts

method assign1()		// assertions are proved, not just tested!
{/* TODO */ }

 // another Hoare Triple:		
 // { -4 <= x < 2 } 
 //     x := x*x+x+x+1 
 // { x < 10 } 

 // try modifying pre, post and the assignment

method assign2()		// assertions are proved, not just tested!
{/* TODO */ }
 // a Hoare Triple:		 
 // of shape { P } C1 ; C2 { Q }

method assign3()		
{/* TODO */ }
 method assign4()		
{/* TODO */ }

// a Hoare triple combining  assignments, composition and conditionals:

method assign5(a:int)		// assertions are proved, not just tested!
{/* TODO */ }
