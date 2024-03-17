method contains_duplicate(nums: seq<int>) returns (result: bool)
{  
    var i := 0;
    var s: set<int> := {};
    while (i < |nums|)
    {
        var num := nums[i];
        if (num in s)
        {
            return false;
        }

        s := s + {num};
        i := i + 1;
    }

    return true;
}

predicate distinct(nums: seq<int>) {
    forall i, j :: 0 <= i < j < |nums| ==> nums[i] != nums[j]
}

