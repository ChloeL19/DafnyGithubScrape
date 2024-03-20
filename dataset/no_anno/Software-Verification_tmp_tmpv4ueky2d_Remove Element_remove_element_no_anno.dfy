method remove_element(nums: array<int>, val: int) returns (i: int)
    modifies nums
{
    i := 0;
    var end := nums.Length - 1;

    while i <= end 
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

