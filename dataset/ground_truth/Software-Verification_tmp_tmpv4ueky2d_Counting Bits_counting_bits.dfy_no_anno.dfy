method counting_bits(n: int) returns (result: array<int>)
{
    result := new int[n + 1](i => 0);

    var i := 1;
    while (i < n + 1)
    {
        result[i] := result[i / 2] + i % 2;

        i := i + 1;
    }
}

