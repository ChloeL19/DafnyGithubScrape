method twoSum(nums: array<int>, target: int) returns (index1: int, index2: int)
{
    var i := 0;
    while i < nums.Length
    {
        var j := i + 1;
        while j < nums.Length
        {
            if nums[i] + nums[j] == target
            {
                return i, j;
            } 
            j := j + 1;
        }
        i := i + 1;
    }
}

