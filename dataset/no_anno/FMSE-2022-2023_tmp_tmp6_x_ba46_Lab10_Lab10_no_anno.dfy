predicate IsOdd(x: int) {
    x % 2 == 1
}

newtype Odd = n : int | IsOdd(n) witness 3

trait OddListSpec
{
    var s: seq<Odd>
    var capacity: nat

    predicate Valid()
        reads this
    {
        0 <= |s| <= this.capacity &&
        forall i :: 0 <= i < |s| ==> IsOdd(s[i] as int)
    }

    method insert(index: nat, element: Odd)
        modifies this
}

class OddList extends OddListSpec
{
    constructor (capacity: nat)
    {
        s := [];
        this.capacity := capacity;
    }

    method insert(index: nat, element: Odd)
        modifies this
    {
        var tail := s[index..];
        s := s[..index] + [element];
        s := s + tail;
    }

    method pushFront(element: Odd)
        modifies this
    {
        insert(0, element);
    }

    method pushBack(element: Odd)
        modifies this
    {
        insert(|s|, element);
    }

    method remove(element: Odd)
        modifies this
    {
        for i: int := 0 to |s|
        {
            if s[i] == element
            {
                s := s[..i] + s[i + 1..];
                break;
            }
        }
    }

    method removeAtIndex(index: nat)
        modifies this
    {
        s := s[..index] + s[index + 1..];
    }

    method popFront() returns (x: Odd)
        modifies this
    {
        x := s[0];
        s := s[1..];
    }

    method popBack() returns (x: Odd)
        modifies this
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
        reads this
    {
        0 <= |l| <= this.capacity
    }

    method insert(index: int, element: T)
    // allows for integer and out-of-bounds index due to circularity
    // managed by applying modulus
        modifies this
}

class CircularLinkedList<T(==)> extends CircularLinkedListSpec<T>
{
    constructor (capacity: nat)
    {
        l := [];
        this.capacity := capacity;
    }

    method insert(index: int, element: T)
    // allows for integer and out-of-bounds index due to circularity
    // managed by applying modulus
        modifies this
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
        modifies this
    {
        for i: nat := 0 to |l|
        {
            if l[i] == element
            {
                l := l[..i] + l[i + 1..];
                break;
            }
        }
    }

    method removeAtIndex(index: int)
        modifies this
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
