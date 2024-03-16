/*
https://leetcode.com/problems/two-sum/
function twoSum(nums: number[], target: number): number[] {
    const n = nums.length;
    for(let i = 0; i < n; i++) {
        for(let k = i+1; k < n; k++) {
            if(nums[i] + nums[k] == target) return [i,k]; 
        }
    }
};
*/
predicate summingPair(i: nat, j: nat, nums: seq<int>, target: int)
{
    i != j &&  nums[i] + nums[j] == target
}
method twoSum(nums: seq<int>, target: int) returns (pair: (nat, nat))
{
    pair := (0,0);
    var i: nat := 0;
    while i < |nums| 
    {
        var k: nat := i + 1;
        while k < |nums| 
        {
            // assert i < k < |nums|;
            if nums[i] + nums[k] == target {
                pair := (i,k);
                return pair;
            }
            k := k + 1;
        }
        i := i + 1;
    }
}
