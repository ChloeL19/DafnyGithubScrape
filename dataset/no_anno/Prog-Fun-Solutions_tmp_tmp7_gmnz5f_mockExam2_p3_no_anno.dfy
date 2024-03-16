// problem 3:
// name:      ....... (fill in your name)
// s-number: s....... (fill in your student number)
// table:     ....... (fill in your table number)

method problem3(m:int, X:int) returns (r:int)
{
    r := m;
    if (1-2*r >= 0) {
        r := 2*r;
        r := -r+1;
    } else {
        r := r -3;
    }
}

