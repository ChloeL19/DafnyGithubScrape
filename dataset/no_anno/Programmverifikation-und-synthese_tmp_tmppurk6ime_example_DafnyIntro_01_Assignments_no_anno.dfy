// ****************************************************************************************
//                              DafnyIntro.dfy
// ****************************************************************************************
// Some very simple assorted Hoare triples.

// Here we model Hoare triples in Dafny
// Modify them and observe how Dafny reacts

method assign1()		// assertions are proved, not just tested!
{  var x := *;      // ignore this line for now
                        
// the Hoare Triple:		
//     { x=-4 } x := x*x+x+x+1 { x < 10 } 
// may be encoded, for now, as:

  assume x == -4;			      // try out  -5, -4, ... 
     x := x*x+x+x+1;			  // command C
}

 // another Hoare Triple:		
 // { -4 <= x < 2 } 
 //     x := x*x+x+x+1 
 // { x < 10 } 

 // try modifying pre, post and the assignment

method assign2()		// assertions are proved, not just tested!
{  var x := *;      // ignore this line for now

  assume -4 <= x < 2;		// precondition P
    x := x*x+x+x+1;			// command C
}
 // a Hoare Triple:		 
 // of shape { P } C1 ; C2 { Q }

method assign3()		
{  var x,y := *,*;  // ignore this line for now

  assume -3 <= x < 2  && -1 < y <= 5;	   // Pre
    x := x + y;				                   // C1
	  y := x*y+1;			                     // C2
}
 method assign4()		
{  var x,y,z := *,*,*;  // ignore this line for now

// a Hoare Triple:		 
 // of shape 
//     { P } if Bexpr then C1 else C2 { Q1 && Q2 }

  assume x == 17;			  // P 

	  if (x > y)			    // Bexpr
		  { z := x; }	      // C1
	  else 
      { z := y; }	       // C2

}

// a Hoare triple combining  assignments, composition and conditionals:

method assign5(a:int)		// assertions are proved, not just tested!
{  var x,y := *,*;      // ignore this line for now

assume y > 0 && x == a;
  x := x+y;
  if (x < y) {
    x := x+1 ; 
    y := y+1;
  } else {
    y := x-y;
  }
  x := x+1;

}
