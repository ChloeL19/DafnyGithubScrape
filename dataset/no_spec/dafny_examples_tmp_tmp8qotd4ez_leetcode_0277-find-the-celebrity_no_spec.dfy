// Author: Shaobo He

predicate knows(a: int, b: int)

predicate isCelebrity(n : int, i : int)
{
    forall j :: 0 <= j < n && i != j ==> knows(j, i) && !knows(i, j)
}

lemma knowerCannotBeCelebrity(n: int, i: int)
{}

ghost method isCelebrityP(n: int, i: int) returns (r : bool)
{
    var j := 0;
    r := true;
    while j < n
    {
        if j != i {
            if !knows(j, i) || knows(i, j) {
                return false;
            }
        }
        j := j + 1;
    }
    return r;
} 

ghost method findCelebrity(n : int) returns (r : int)
{
    var candidate := 0;
    var i := 1;
    while i < n 
    {
        if knows(candidate, i) {
            candidate := i;
        }
        i := i + 1;
    }
    //assert forall j :: 0 <= j < n && j != candidate ==> !isCelebrity(n, j);
    var isCelebrityC := isCelebrityP(n, candidate);
    if isCelebrityC {
        r := candidate;
    } else {
        r := -1;
    }
}
