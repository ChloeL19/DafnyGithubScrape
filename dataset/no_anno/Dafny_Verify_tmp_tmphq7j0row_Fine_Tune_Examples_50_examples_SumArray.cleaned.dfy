function Sum(arr: array<int>, len: int): int
{
    if len == 0 then 0 else arr[len-1] + Sum(arr, len-1)
}

method SumArray(arr: array<int>) returns (sum: int)
{
    sum := 0;
    var i := 0;
    while i < arr.Length
        invariant 0 <= i <= arr.Length
        invariant sum == Sum(arr, i)
    {
        sum := sum + arr[i];
        i := i + 1;
    }
}
