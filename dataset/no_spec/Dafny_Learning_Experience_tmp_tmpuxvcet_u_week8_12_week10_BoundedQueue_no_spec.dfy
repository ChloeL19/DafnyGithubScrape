class BoundedQueue<T(0)>
{	
    //abstract state
    ghost var Elements: seq<T>
    ghost var max: int // max size of queue
    ghost var Repr: set<object>
    //concrete state
    var wr: nat
    var rd: nat
    var data: array<T>

    ghost predicate Valid()
    {
        this in Repr && data in Repr &&
        wr <= max && rd <= max && data.Length == max + 1 &&
        Elements == if rd <= wr then data[rd..wr]
                    else data[rd..] + data[..wr]
    }
    
}   
