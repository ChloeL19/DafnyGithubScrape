module IntegerSet {

    class Set {

        var elements: seq<int>;

        constructor Set0() 
        {
            this.elements := [];
        }

        constructor Set(elements: seq<int>)
        {
            this.elements := elements;
        }

        method size() returns (size : int)
        {
            size := |elements|;
        }

        method addElement(element : int)
        {
            if (element !in elements) {
                elements := elements + [element];
            }
        }

        method removeElement(element : int)
        {
            if (element in elements) {
                var i := 0;

                while (0 <= i < |elements|)
                {
                    if (elements[i] == element) {
                        if (i < |elements| - 1 && i != -1) {
                            elements := elements[..i] + elements[i+1..];
                        } 
                        else if (i == |elements| - 1) {
                            elements := elements[..i];
                        }
                        break;
                    }
                    i := i + 1;
                }
            }
        }

        method contains(element : int) returns (contains : bool)
        {
            contains := false;
            if (element in elements) {
                contains := true;
            }
        }

        //for computing the length of the intersection of 2 sets
        function intersect_length(s1 : seq<int>, s2 : seq<int>, count : int, start : int, stop : int) : int 
        {
            if start == stop then count else (if s1[start] in s2 then intersect_length(s1, s2, count + 1, start + 1, stop) else intersect_length(s1, s2, count, start + 1, stop))
        }

        //for computing the length of the union of 2 sets
        //pass in the length of s2 as the initial count
        function union_length(s1 : seq<int>, s2 : seq<int>, count : int, i : int, stop : int) : int 
        {
            if i == stop then count else (if s1[i] !in s2 then union_length(s1, s2, count + 1, i + 1, stop) else union_length(s1, s2, count, i + 1, stop))
        }

        method intersect(s : Set) returns (intersection : Set)
        {
            intersection := new Set.Set0();
            var inter: seq<int> := [];

            var i := 0;
            while (0 <= i < |this.elements|)
            {
                
                var old_len := |inter|;
                if (this.elements[i] in s.elements && this.elements[i] !in inter) {
                    inter := inter + [this.elements[i]];
                }
                if (i == |this.elements| - 1) {
                    break;
                }
                i := i + 1;
            }
            intersection.elements := inter;
        }

        method union(s : Set) returns (union : Set)
        {
            var elems := s.elements;
            union := new Set.Set0();

            var i := 0;
            while (0 <= i < |this.elements|)
            {
                if (this.elements[i] !in elems) {
                    elems := elems + [this.elements[i]];
                }
                if (i == |this.elements| - 1) {
                    break;
                }
                i := i + 1;
            }

            union.elements := elems;
        }
    }
}
