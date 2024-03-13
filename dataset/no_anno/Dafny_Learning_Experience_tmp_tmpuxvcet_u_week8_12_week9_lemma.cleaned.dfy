method AssignmentsToMark(students:int, tutors: int) returns (r:int)
{
    assert students > 0 && tutors > 1;
    assert students > 0 && tutors > 1 && true;
    assert students > 0 && tutors > 1 && students/tutors < students ==> students/tutors < students;
    DivisionLemma(students,tutors);
    assert students/tutors < students;
    r:= students/tutors;
    assert r< students;
    calc  {
        //true;
        1/tutors < 1;
        students/tutors < students;
    }
}

lemma DivisionLemma(n:int,d:int) 
method AssignmentsToMarkOne(students:int, tutors: int) returns (r:int)
{
    
    r:= students/tutors;
    
    calc == {
        true;
        1/tutors < 1;
        students/tutors < students;
    }
}

lemma CommonElement(a:array<nat>, b:array<nat>)
    //ensures multiset{a[..]}  * multiset{b[..]} == multiset([a[0]]) + multiset{a[1..]} * multiset{b[1..]}
/*
{
    var E := multiset{a[0]};
    calc =={
        multiset(a[..]) * multiset(b[..]);
        assert (a[..] == [a[0]] + a[1..]) && (b[..] == [b[0]] + b[1..]); 
        (E+ multiset(a[1..])) * (E + multiset(a[1..]));
        E + multiset(a[1..]) * multiset(b[1..]);
    }
}*/
