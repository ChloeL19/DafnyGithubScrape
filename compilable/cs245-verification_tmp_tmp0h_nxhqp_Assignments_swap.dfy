//Swap -- Stephanie Renee McIntyre
//Based on the code used in the course overheads for Fall 2018
method swap(x0: int, y0: int) returns (x: int,y: int)
/* Pre-Condition should be here, but we need to "hack" it as inputs are immutable... So see (*) below */
/* Post-Condition */ ensures y == x0 && x == y0;
{
    /* (*) */ x := x0; y := y0; //This needs to be done in Dafny as inputs are considered immutable.
    
    /* (| x = x0 ^ y = y0 |) - Pre-Condition */ assert x==x0 && y==y0;
    
    /* (| y = y0 ^ x = x0 |) - implied (a) */   assert y==y0 && x==x0;

    var t := x;
    
    /* (| y = y0 ^ t = x0 |) - assignment */    assert y==y0 && t==x0;
    
    x := y;
    
    /* (| x = y0 ^ t = x0 |) - assignment */    assert x==y0 && t==x0;
    
    y := t;
    
    /* (| x = y0 ^ y = x0 |) - assignment // Post-Condition: from ensures statement */
}

/* Proof of implied (a): 
    Let x = x0 ^ y = y0 
    Using ^e, we get x = x0 and y = y0.
    Using ^i, we get y = y0 ^ x = x0.
*/

