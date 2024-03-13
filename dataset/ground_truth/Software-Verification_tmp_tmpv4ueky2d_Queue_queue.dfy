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
    {
        queue := [x] + queue;
    }

    method dequeue() returns (x: int)
        modifies this
        requires |queue| > 0
        ensures (queue == old(queue)[0..|old(queue)| - 1]) &&
                (x == old(queue)[|old(queue)| - 1])
    {
        x := queue[|queue| - 1];
        queue := queue[0..|queue| - 1];
    }

    method front() returns (x: int)
        requires |queue| > 0
        ensures queue == old(queue)
        ensures x == queue[|queue| - 1]
    {
        x := queue[|queue| - 1];
    }

    method size() returns (result: int)
    {
        result := |queue|;
    }

    method empty() returns (is_empty: bool)
    {
        is_empty := |queue| == 0;
    }
}

