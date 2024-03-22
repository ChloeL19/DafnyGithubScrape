datatype Tree<Data> = Nil | Leaf(key: int, value: Data)
		| Tree(key: int, value: Data, left: Tree, right: Tree)

datatype Option<T> = None | Some(T) 

function LookUp<Data>(key: int, t: Tree): Option<Data> 
{
	match t
	case Nil => None
	case Leaf(k, v) => if k == key then Some(v) else None
	case Tree(k, v, l, r) => if k == key then Some(v)
		else if key < k then LookUp(key, l) else LookUp(key, r)         
}

function Add<Data>(key: int, value: Data, t: Tree): Tree
{
	match t
    case Nil => Leaf(key, value)
	case Leaf(k, v) => if k == key then Leaf(k, value) 
                       else if key < k then Tree(k,v,Leaf(key, value), Nil) 
                           else Tree(k, v, Nil, Leaf(key, value)) 
    case Tree(k, v, l, r) => if k == key then Tree(k, value, l, r)
                             else if key < k then Tree(k, v, Add(key, value, l), r)
                                  else Tree(k, v, l, Add(key, value, r))
}

predicate Ordered<Data>(t: Tree<Data>) {
    match t
    case Nil => true
    case Leaf(_, _) => true
    case Tree(k, _, l, r) => (l != Nil ==> k > l.key && Ordered(l)) && 
                             (r != Nil ==> k < r.key && Ordered(r))
}

lemma AddLemma<Data>(k: int, v: Data, t:Tree<Data>)
    requires Ordered(t)
    ensures Ordered(Add(k,v,t))
{/* TODO */ }
