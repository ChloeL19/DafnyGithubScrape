method longest_increasing_subsequence(nums: array<int>) returns (max: int)
{
    var length := nums.Length;
    if (length == 1)
    {
        return 1;
    }

    max := 1;
    var dp := new int[length](_ => 1);

    var i := 1;
    while (i < length)
        modifies dp
    {
        var j := 0;
        while (j < i)
        {
            if (nums[j] < nums[i])
            {
                dp[i] := find_max(dp[i], dp[j] + 1);
            }

            j := j + 1;
        }

        max := find_max(max, dp[i]);
        i := i + 1;
    }
}


// Function
function find_max(x: int, y: int): int
{
    if x > y then x
    else y
}

