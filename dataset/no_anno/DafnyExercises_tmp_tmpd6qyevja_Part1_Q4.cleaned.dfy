
class Rectangle {
class Rectangle {

  const width : nat;
  const height : nat;
  const x : int;
  const y : int;
  const yellowOrBlack : bool;
  constructor(xx : int, yy : int, ww : nat, hh : nat, yb : bool)
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
    ensures r.x == x + dx && r.y == y +dy && width == r.width && height == r.height && yellowOrBlack == r.yellowOrBlack{ 
      r := new Rectangle(x+dx,y+dy,width,height,yellowOrBlack);
    }

    method scale( s : nat ) returns (r : Rectangle) 
    ensures r.width == width*(s) && r.height == height*(s) && r.x == x && r.y ==y && yellowOrBlack == r.yellowOrBlack{ 
      r := new Rectangle(x,y,width*(s),height*(s),yellowOrBlack);
    }

    predicate containsPoint(px : int, py : int) reads this 
    { 
      (x <= px <= (x + width) && y <=py <=(y+height))
    }

    predicate containsRectangle(r :Rectangle) 
    requires r.height >=0 { 
      ((x <= r.x) && ((x+width) >= (r.x+r.width)) && (y <= r.y) && ((y+height) >= (r.y+r.height)))
    }

}    

lemma testContains (outer : Rectangle, inner : Rectangle, px : int, py : int)
  {}

method testScale (inner : Rectangle, px : int, py : int) 
  {
       var outer := inner.scale(2);
       testContains(outer,inner,px,py);
  }

  method Main () {
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




