method Study(n: nat, h: nat)
    decreases n , h
{
    if h != 0 {
        Study(n, h - 1);
    } else if n == 0 {

    } else {
        var hours := RequiredStudyTime(n - 1);
        Study(n - 1, hours);
    }
}

method RequiredStudyTime(c: nat) returns (hours: nat)
