class Queue
{
    var queue: seq<int>;


    constructor()
    {
        queue := [];
    }

    method enqueue(x: int)
    {
        queue := [x] + queue;
    }

    method dequeue() returns (x: int)
    {
        x := queue[|queue| - 1];
        queue := queue[0..|queue| - 1];
    }

    method front() returns (x: int)
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

