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
        modifies this
        ensures (stack == [x] + old(stack)) &&
                (x == stack[0])
        ensures (|old(min_stack)| == 0 || x <= old(min_stack)[0]) ==> 
                (min_stack == [x] + old(min_stack) &&
                (min_stack[0] == x))
    {
        stack := [x] + stack;

        if (|min_stack| == 0 || x <= min_stack[0])
        {
            min_stack := [x] + min_stack;
        }
    }

    method pop() returns (x: int)
        modifies this
        requires stack != [] && min_stack != []
        ensures (stack == old(stack)[1..]) &&
                (x == old(stack)[0])
        ensures (old(stack)[0] == old(min_stack)[0]) ==> 
                (min_stack == old(min_stack)[1..]) &&
                (x == old(min_stack)[0])
    {
        if (stack[0] == min_stack[0])
        {
            min_stack := min_stack[1..];
        }

        x := stack[0];
        stack := stack[1..];
    }

    method top() returns (x: int)
        requires stack != []
        ensures stack == old(stack)
        ensures x == stack[0]
    {
        x := stack[0];
    }

    method get_min() returns (x: int)
        requires min_stack != []
        ensures min_stack == old(min_stack)
        ensures x == min_stack[0]
    {
        x := min_stack[0];
    }
}

