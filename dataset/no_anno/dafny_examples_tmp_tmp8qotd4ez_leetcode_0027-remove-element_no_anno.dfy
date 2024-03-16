method RemoveElement(nums: array<int>, val: int) returns (newLength: int)
{
    var i := 0;
    var j := 0;
    while i < nums.Length
    {
        if nums[i] != val {
            nums[j] := nums[i];
            j := j + 1;
        }
        i := i + 1;
    }
    return j;
}

