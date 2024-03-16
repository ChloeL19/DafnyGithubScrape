method AssignmentsToMark(students:int, tutors: int) returns (r:int)
{
    DivisionLemma(students,tutors);
    r:= students/tutors;
    calc  {
        //true;
        1/tutors < 1;
        students/tutors < students;
    }
}

lemma DivisionLemma(n:int,d:int) 
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
        (E+ multiset(a[1..])) * (E + multiset(a[1..]));
        E + multiset(a[1..]) * multiset(b[1..]);
    }
}*/
