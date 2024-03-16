class MinStack
{
    var stack: seq<int>;
    var min_stack: seq<int>;


    constructor()
    {
        stack := [];
        min_stack := [];
    }

    method push(x: int)
    {
        stack := [x] + stack;

        if (|min_stack| == 0 || x <= min_stack[0])
        {
            min_stack := [x] + min_stack;
        }
    }

    method pop() returns (x: int)
    {
        if (stack[0] == min_stack[0])
        {
            min_stack := min_stack[1..];
        }

        x := stack[0];
        stack := stack[1..];
    }

    method top() returns (x: int)
    {
        x := stack[0];
    }

    method get_min() returns (x: int)
    {
        x := min_stack[0];
    }
}

