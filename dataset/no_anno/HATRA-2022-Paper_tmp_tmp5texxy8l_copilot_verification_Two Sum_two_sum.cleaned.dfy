method twoSum(nums: array<int>, target: int) returns (index1: int, index2: int)
{
    var i := 0;
    while i < nums.Length
        invariant 0 <= i < nums.Length
        invariant forall u, v :: 0 <= u < v < nums.Length && u < i ==> nums[u] + nums[v] != target
        invariant exists u, v :: i <= u < v < nums.Length && nums[u] + nums[v] == target
    {
        var j := i + 1;
        while j < nums.Length
            invariant 0 <= i < j <= nums.Length
            invariant forall u, v :: 0 <= u < v < nums.Length && u < i ==> nums[u] + nums[v] != target
            invariant exists u, v :: i <= u < v < nums.Length && nums[u] + nums[v] == target
            invariant forall u :: i < u < j ==> nums[i] + nums[u] != target
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

