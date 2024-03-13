method remove_element(nums: array<int>, val: int) returns (i: int)
{
    i := 0;
    var end := nums.Length - 1;

    while i <= end 
        invariant 0 <= i <= nums.Length
        invariant end < nums.Length
        invariant forall k :: 0 <= k < i ==> nums[k] != val
    {
        if (nums[i] == val)
        {
            if (nums[end] == val)
            {
                end := end - 1;
            }
            else {
                nums[i] := nums[end];
                i := i + 1;
                end := end  - 1;
            }
        }
        else {
            i := i + 1;
        }
    }
}

