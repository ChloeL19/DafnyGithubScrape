// CoPilot function converted to dafny
method largest_sum(nums: array<int>, k: int) returns (sum: int)
{
    var max_sum := 0;
    var current_sum := 0;
    
    var i := 0;
    while (i < nums.Length)
    {
        current_sum := current_sum + nums[i];
        if (current_sum > max_sum)
        {
            max_sum := current_sum;
        }
        if (current_sum < 0)
        {
            current_sum := 0;
        }
        i := i + 1;
    }
    return max_sum;
}

// Predicate to confirm that sum is the maximum summation of element [start, stop) 
predicate max_sum_subarray(arr: array<int>, sum: int, start: int, stop: int)
{
    forall u, v :: start <= u < v <= stop ==> Sum_Array(arr, u, v) <= sum
}


//Sums array elements between [start, stop)
function Sum_Array(arr: array<int>, start: int, stop: int): int
{
    if start >= stop then 0
    else arr[stop-1] + Sum_Array(arr, start, stop-1)
}




