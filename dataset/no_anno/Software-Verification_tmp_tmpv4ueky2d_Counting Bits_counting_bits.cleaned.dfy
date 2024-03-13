method counting_bits(n: int) returns (result: array<int>)
{
    result := new int[n + 1](i => 0);

    var i := 1;
    while (i < n + 1)
        invariant 1 <= i <= n + 1
        invariant forall j :: 1 <= j < i ==> result[j] == result[j / 2] + j % 2
    {
        result[i] := result[i / 2] + i % 2;

        i := i + 1;
    }
}

