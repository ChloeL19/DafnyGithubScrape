//max of two integers -- Stephanie Renee McIntyre
//Based on the code used in the course overheads for Fall 2018
method max(x: int, y: int) returns (max: int)
/* Pre-Condition */   requires true;
/* Post-Condition */  ensures (x>y && max==x) || (x<=y && max==y);
{   
    /* (| true |) - Pre-Condition: from requires */

    if(x > y){
      /* (| true ^ x > y |)                             - if-then-else */   assert (true && x > y);
      /* (| (x > y ^ x = x) V (x <=y ^ x = y) |)        - implied (a) */    assert (x > y && x == x) || (x <=y && x == y);
      max := x;
      /* (| (x > y ^ max = x) V (x <=y ^ max = y) |)    - assignment */     assert (x > y && max == x) || (x <=y && max == y);
    }else{
      /* (| true ^ -(x > y) |)                          - if-then-else */   assert (true && !(x > y));
      /* (| (x > y ^ y = x) V (x <=y ^ y = y) |)        - implied (b) */    assert (x > y && y == x) || (x <=y && y == y);
      max := y;
      /* (| (x > y ^ max = x) V (x <=y ^ max = y) |)    - assignment */     assert (x > y && max == x) || (x <=y && max == y);
    }
    /* (| (x > y ^ max = x) V (x <=y ^ max = y) |)      - if-then-else //   Post-Condition: from ensures statement */
}

/* Proof of implied (a): 
    Let x > y.
    x = x via for-all elimination on EQ1.
    Using ^i, we get x > y ^ x = x.
    Using Vi, (x > y ^ x = x) V (x <=y ^ x = y).
*/
/* Proof of implied (b): Similar to previous proof. Left for you! */ 

