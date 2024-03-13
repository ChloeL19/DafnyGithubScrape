
class Rectangle {

  const width : nat;
  const height : nat;
  const x : int;
  const y : int;
  const yellowOrBlack : bool;
  constructor(xx : int, yy : int, ww : nat, hh : nat, yb : bool)
  requires ww >=0 && hh >=0
  ensures width >= 0
  ensures height >= 0
  ensures width == ww && height == hh && x ==xx && y ==yy && yellowOrBlack ==yb{
    width := ww as nat;
    height := hh as nat;
    x := xx;
    y := yy;
    yellowOrBlack := yb;
  } 

  function area() : nat 
  reads this{
    width*height
   }

    method move(dx : int, dy : int) returns (r : Rectangle) 
    requires width >= 0
    requires height >= 0
    ensures r.x == x + dx && r.y == y +dy && width == r.width && height == r.height && yellowOrBlack == r.yellowOrBlack{ 
      r := new Rectangle(x+dx,y+dy,width,height,yellowOrBlack);
    }

    method scale( s : nat ) returns (r : Rectangle) 
    requires s >=0
    requires height >=0
    requires width >=0
    ensures r.width >= 0
    ensures r.height >= 0
    ensures 0 <= (width *s)
    ensures 0 <= (height *s)
    ensures r.width == width*(s) && r.height == height*(s) && r.x == x && r.y ==y && yellowOrBlack == r.yellowOrBlack{ 
      r := new Rectangle(x,y,width*(s),height*(s),yellowOrBlack);
    }

    predicate containsPoint(px : int, py : int) reads this 
    requires width >=0
    requires height >= 0
    { 
      (x <= px <= (x + width) && y <=py <=(y+height))
    }

    predicate containsRectangle(r :Rectangle) 
    reads this 
    reads r
    requires width >=0
    requires height >= 0
    requires r.width >= 0
    requires r.height >=0 { 
      ((x <= r.x) && ((x+width) >= (r.x+r.width)) && (y <= r.y) && ((y+height) >= (r.y+r.height)))
    }

}    

lemma testContains (outer : Rectangle, inner : Rectangle, px : int, py : int)
  requires outer.containsRectangle(inner)
  requires inner.containsPoint(px,py)
  ensures  outer.containsPoint(px,py) 
  {}

method testScale (inner : Rectangle, px : int, py : int) 
  requires inner.containsPoint(px,py)
  {
       var outer := inner.scale(2);
       testContains(outer,inner,px,py);
  }

  method Main () {
    // var r := new Rectangle(0,0,40,40,true);
    // var b := new Rectangle(0,0,20,20,false);
    // var boo :=  r.containsRectangle(b);
    // print boo;

    // var t := b.scale(2);
    // var no := t.containsRectangle(b);
    // print no;
  print true;
  }




