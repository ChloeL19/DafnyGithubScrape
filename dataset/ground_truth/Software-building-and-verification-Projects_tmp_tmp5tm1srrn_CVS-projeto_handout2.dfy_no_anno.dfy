datatype List<T> = Nil | Cons(head:T,tail:List<T>)
datatype Option<T> = None | Some(elem:T)

ghost function mem<T>(x:T,l:List<T>) : bool {
  match l {
    case Nil => false
    case Cons(y,xs) => x==y || mem(x,xs)
  }
}

ghost function length<T>(l:List<T>) : int {
  match l {
    case Nil => 0
    case Cons(_,xs) => 1 + length(xs)
  }
}

function list_find<K(==),V(!new)>(k:K,l:List<(K,V)>) : Option<V>
          }
  decreases l
{
  match l {
    case Nil => None
    case Cons((k',v),xs) => if k==k' then Some(v) else list_find(k,xs)
  }
}

function list_remove<K(==,!new),V(!new)>(k:K, l:List<(K,V)>) : List<(K,V)>
  decreases l
{
  match l {
    case Nil => Nil
    case Cons((k',v),xs) => if k==k' then list_remove(k,xs) else
    Cons((k',v),list_remove(k,xs))
  }
}


class Hashtable<K(==,!new),V(!new)> {
  var size : int
  var data : array<List<(K,V)>>

  ghost var Repr : set<object>
  ghost var elems : map<K,Option<V>>

  ghost predicate RepInv()
    reads this, Repr
  {
    this in Repr && data in Repr && data.Length > 0 &&
    (forall i :: 0 <= i < data.Length ==> valid_hash(data, i)) &&
    (forall k,v :: valid_data(k,v,elems,data))
  }

  ghost predicate valid_hash(data: array<List<(K,V)>>, i: int)
  {
    forall k,v :: mem((k,v), data[i]) ==> (bucket(k,data.Length) == i)
  }


  ghost predicate valid_data(k: K,v: V,elems: map<K, Option<V>>, data: array<List<(K,V)>>)
    reads this, Repr, data
  {
    (k in elems && elems[k] == Some(v)) <==> mem((k,v), data[bucket(k, data.Length)])
  }


  function hash(key:K) : int
  {
    hash(k) % n
  }

  constructor(n:int)
  {
    size := 0;
    data := new List<(K,V)>[n](i => Nil);
    Repr := {this, data};
    elems := map[];
  }

  method clear()
  {
    var i := 0;
    while i < data.Length
    {
      data[i] := Nil;
      i := i + 1;
    }
    size := 0;
    elems := map[];
  }

  method resize()
  {
    var newData := new List<(K,V)>[data.Length * 2](i => Nil);
    var i := 0;
    var oldSize := data.Length;
    var newSize := newData.Length;

    {
                             !mem((k,v), newData[bucket(k, newSize)]));
      rehash(data[i],newData,i,oldSize,newSize);
      i := i + 1;
    }
    Repr := Repr - {data} + {newData};
    data := newData;
  }


  method rehash(l: List<(K,V)>, newData: array<List<(K,V)>>,i: int, oldSize: int, newSize: int)
  {
    match l {
      case Nil => return;
      case Cons((k,v), r) => {
        var b := bucket(k, newSize);
        newData[b] := Cons((k,v), newData[b]);
        rehash(r, newData, i, oldSize, newSize);
      }
    }
  }

  method find(k: K) returns (r: Option<V>)
  {
    var idx := bucket(k, data.Length);
    r := list_find(k, data[idx]);
           case Some(v) => mem((k,v),data[bucket(k,data.Length)]);
  }


  method remove(k: K)
  {
    var idx := bucket(k, data.Length);
    var opt := list_find(k, data[idx]);
      var idx := bucket(k, data.Length);
      data[idx] := list_remove(k, data[idx]);
      elems := elems[k := None];
      size := size - 1;
  }

  method add(k:K,v:V)
  {
    if(size >= data.Length * 3/4) {
      resize();
    }

    remove(k);
    var ind := bucket(k,data.Length);

    data[ind] := Cons((k,v), data[ind]);
    elems := elems[k := Some(v)];

    size := size + 1;

  }

}
