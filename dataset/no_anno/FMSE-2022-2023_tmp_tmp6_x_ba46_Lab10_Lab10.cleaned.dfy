predicate IsOdd(x: int) {
predicate IsOdd(x: int) {
    x % 2 == 1
}

newtype Odd = n : int | IsOdd(n) witness 3

trait OddListSpec
{
    var s: seq<Odd>
    var capacity: nat

    predicate Valid()
    {
        0 <= |s| <= this.capacity &&
        forall i :: 0 <= i < |s| ==> IsOdd(s[i] as int)
    }

    method insert(index: nat, element: Odd)
    method pushFront(element: Odd)
    method pushBack(element: Odd)
    method remove(element: Odd)
    method removeAtIndex(index: nat)
    method popFront() returns (x: Odd)
    method popBack() returns (x: Odd)
    method length() returns (n: nat)
    method at(index: nat) returns (x: Odd)
    method BinarySearch(element: Odd) returns (index: int)
    method mergedWith(l2: OddList) returns (l: OddList)
class OddList extends OddListSpec
{
    constructor (capacity: nat)
    {
        s := [];
        this.capacity := capacity;
    }

    method insert(index: nat, element: Odd)
    {
        var tail := s[index..];
        s := s[..index] + [element];
        s := s + tail;
    }

    method pushFront(element: Odd)
    {
        insert(0, element);
    }

    method pushBack(element: Odd)
    {
        insert(|s|, element);
    }

    method remove(element: Odd)
    {
        for i: int := 0 to |s|
            invariant 0 <= i <= |s|
            invariant forall k :: 0 <= k < i ==> s[k] != element
        {
            if s[i] == element
            {
                s := s[..i] + s[i + 1..];
                break;
            }
        }
    }

    method removeAtIndex(index: nat)
    {
        s := s[..index] + s[index + 1..];
    }

    method popFront() returns (x: Odd)
    {
        x := s[0];
        s := s[1..];
    }

    method popBack() returns (x: Odd)
    {
        x := s[|s| - 1];
        s := s[..|s| - 1];
    }

    method length() returns (n: nat)
    {
        return |s|;
    }

    method at(index: nat) returns (x: Odd)
    {
        return s[index];
    }

    method BinarySearch(element: Odd) returns (index: int)
    {
        var left, right := 0, |s|;

        while left < right
            invariant 0 <= left <= right <= |s|
            invariant element !in s[..left] && element !in s[right..]
        {
            var mid := (left + right) / 2;

            if element < s[mid] 
            {
                right := mid;
            } 
            else if s[mid] < element 
            {
                left := mid + 1;
            } 
            else 
            {
                return mid;
            }
        }

        return -1;
    }

    method mergedWith(l2: OddList) returns (l: OddList)
    {
        l := new OddList(this.capacity + l2.capacity);

        var i, j := 0, 0;

        while i < |s| || j < |l2.s|
            invariant 0 <= i <= |s|
            invariant 0 <= j <= |l2.s|
            invariant i + j == |l.s|
            invariant |l.s| <= l.capacity
            invariant l.capacity == this.capacity + l2.capacity
            decreases |s| - i, |l2.s| - j
        {
            if i == |s|
            {
                if j == |l2.s|
                {
                    return l;
                }
                else
                {
                    l.pushBack(l2.s[j]);
                    j := j + 1;
                }
            }
            else
            {
                if j == |l2.s|
                {
                    l.pushBack(s[i]);
                    i := i + 1;
                }
                else
                {
                    if s[i] < l2.s[j]
                    {
                        l.pushBack(s[i]);
                        i := i + 1;
                    } 
                    else
                    {
                        l.pushBack(l2.s[j]);
                        j := j + 1;
                    }
                }
            }
        }

        return l;
    }
}

trait CircularLinkedListSpec<T(==)>
{
    var l: seq<T>
    var capacity: nat 

    predicate Valid()
    {
        0 <= |l| <= this.capacity
    }

    method insert(index: int, element: T)
    method remove(element: T)
    method removeAtIndex(index: int)
    method length() returns (n: nat)
    method at(index: int) returns (x: T)
    method nextAfter(index: int) returns (x: T)
class CircularLinkedList<T(==)> extends CircularLinkedListSpec<T>
{
    constructor (capacity: nat)
    {
        l := [];
        this.capacity := capacity;
    }

    method insert(index: int, element: T)
    {
        if (|l| == 0)
        {
            l := [element];
        } 
        else 
        {
            var actualIndex := index % |l|;
            var tail := l[actualIndex..];
            l := l[..actualIndex] + [element];
            l := l + tail;
        }
    }

    method remove(element: T)
    {
        for i: nat := 0 to |l|
            invariant 0 <= i <= |l|
            invariant forall k :: 0 <= k < i ==> l[k] != element
        {
            if l[i] == element
            {
                l := l[..i] + l[i + 1..];
                break;
            }
        }
    }

    method removeAtIndex(index: int)
    {
        var actualIndex := index % |l|;
        l := l[..actualIndex] + l[actualIndex + 1..];
    }

    method length() returns (n: nat)
    {
        return |l|;
    }

    method at(index: int) returns (x: T)
    {
        var actualIndex := index % |l|;
        return l[actualIndex];
    }

    method nextAfter(index: int) returns (x: T)
    {
        if (|l| == 1)
        {
            x := l[0];
        }
        else
        {
            var actualIndex := index % |l|;
            if (actualIndex == (|l| - 1))
            {
                x := l[0];
            } else {
                x := l[actualIndex + 1];
            }
        }
        
        return x;
    }

    method isIn(element: T) returns (b: bool)
    {
        if (|l| == 0)
        {
            b := false;
        }
        else 
        {
            b := false;
            for i: nat := 0 to |l|
                invariant 0 <= i <= |l|
                invariant forall k :: 0 <= k < i ==> l[k] != element
            {
                if l[i] == element
                {
                    b := true;
                    break;
                }
            }
        }
    }
}
