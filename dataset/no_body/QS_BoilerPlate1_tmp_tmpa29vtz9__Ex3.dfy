
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
    ensures Valid() 
      && next == null && list == [ data ] 
      && footprint == { this } 
      && val == data 
  {
    this.data := val; 
    this.next := null; 
    this.list := [ val ]; 
    this.footprint := { this };
  } 

  method prepend (val : int) returns (r : Node)
    requires Valid()
    ensures r.Valid()
    ensures r.list == [ val ] + this.list
    ensures r.footprint == {/* TODO */ } + this.footprint
    ensures fresh(r) 
  {
    r := new Node(val); 
    r.next := this; 
    r.footprint := { r } + this.footprint; 
    r.list := [ val ] + this.list;  
    return; 
  }

  // Ex1
  
  method reverse(tail : Node?) returns (r : Node) 
    requires Valid()
    requires tail != null ==> this !in tail.footprint && tail.Valid() 
    requires tail != null && this.next != null ==> this.next.footprint !! tail.footprint
    ensures tail != null ==> r.list == rev(old(this.list)) + tail.list
    ensures tail == null ==> r.list == rev(old(this.list))
    ensures tail == null ==> this.footprint == {/* TODO */ } && this.list == [ this.data ] && this.next == null
    ensures r.Valid() && this.Valid()
    ensures old(this.next) == null ==> r == this
    ensures this.next == tail
    ensures forall k :: k in footprint ==> k in r.footprint
    ensures forall k :: k in list ==> k in r.list
    modifies footprint
    decreases footprint
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
  requires nd == null || nd.Valid()
  ensures r.Valid()
  ensures fresh(r)
  ensures nd != null ==> r.list == [v] + nd.list && r.footprint == {/* TODO */ } + nd.footprint
  ensures nd == null ==> r.list == [v] && r.footprint == {r}
  ensures nd == null ==> r.next == null
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

