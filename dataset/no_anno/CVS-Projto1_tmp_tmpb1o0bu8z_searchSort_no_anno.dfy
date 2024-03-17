method fillK(a: array<int>, n: int, k: int, c: int) returns (b: bool)
{
    if c == 0 {
        return true;
    }

    var p := 0;
    while p < c
        {
            if a[p] != k
            {
                return false;
            }

            p := p + 1;
        }
    return true;

}


method containsSubString(a: array<char>, b: array<char>) returns (pos: int)
{
    pos := -1;

    if b.Length == 0 {
        return pos;
    }

    var p := 0;

    while p < a.Length
    {
        if a.Length - p < b.Length
        {
            return pos;
        }

        if a[p] == b[0] {

                var i := 0;
                    while i < b.Length
                    {
                        if a[i + p] != b[i] {
                            return -1;
                        }
                    i:= i + 1;
                    }
                    pos := p;
                return pos;
        }

        p:= p +1;
    }

}

