
module Ex3 {


class Node {

  var data : int 
  var next : Node? 

  ghost var list : seq<int>
  ghost var footprint : set<Node>

  ghost function Valid() : bool 
    reads this, footprint
    decreases footprint
  {
    (this in footprint) &&
    ((next == null) ==> list == [ data ] && footprint == { this }) &&
    ((next != null) ==> 
      (next in footprint) && 
      footprint == next.footprint + { this } && 
      (this !in next.footprint) &&
      list == [ data ] + next.list &&
      next.Valid())
  }

  constructor (val : int) 
      && footprint == { this } 
      && val == data 
  {
    this.data := val; 
    this.next := null; 
    this.list := [ val ]; 
    this.footprint := { this };
  } 

  method prepend (val : int) returns (r : Node)
  {
    r := new Node(val); 
    r.next := this; 
    r.footprint := { r } + this.footprint; 
    r.list := [ val ] + this.list;  
    return; 
  }

  // Ex1
  
  method reverse(tail : Node?) returns (r : Node) 
  {
    var old_next := this.next; 
    this.next := tail; 

    if( tail == null ) {
        this.footprint := { this };
        this.list := [ this.data ];
    } else {
        this.footprint := { this } + tail.footprint;
        this.list := [ this.data ] + tail.list;
    }

    if (old_next == null) {
      r := this; 
      return; 
    } else {
      r := old_next.reverse(this);
      return;  
    }
  }
}

function rev(s : seq<int>) : seq<int>
{
  if (s == []) then []
  else rev(s[1..]) + [s[0]]
}

// Ex2

method ExtendList(nd : Node?, v : int) returns (r : Node)
{
  if (nd == null) {
    r := new Node(v);
    return;
  } else {
    r := nd.prepend(v); 
    return; 
  }
}

}

