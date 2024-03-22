class Queue
{
    var queue: seq<int>;


    constructor()
    {
        queue := [];
    }

    method enqueue(x: int)
        modifies this
        ensures (queue == [x] + old(queue)) &&
                (x == queue[0])
    {/* TODO */ }

    method dequeue() returns (x: int)
        modifies this
        requires |queue| > 0
        ensures (queue == old(queue)[0..|old(queue)| - 1]) &&
                (x == old(queue)[|old(queue)| - 1])
    {/* TODO */ }

    method front() returns (x: int)
        requires |queue| > 0
        ensures queue == old(queue)
        ensures x == queue[|queue| - 1]
    {/* TODO */ }

    method size() returns (result: int)
    {/* TODO */ }

    method empty() returns (is_empty: bool)
    {/* TODO */ }
}

