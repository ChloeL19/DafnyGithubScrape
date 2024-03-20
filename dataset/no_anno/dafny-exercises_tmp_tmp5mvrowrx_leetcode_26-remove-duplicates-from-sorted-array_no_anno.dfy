
method RemoveDuplicates(nums: array<int>) returns (num_length: int)
  modifies nums
{
  if nums.Length <= 1 {
    return nums.Length;
  }
  var last := 0;
  var i := 1;
  ghost var nums_before := nums[..];
  while i < nums.Length
    // verify that `last` will strictly smaller than `i`
  {
    if nums[last] < nums[i] {
      last := last + 1;
      nums[last] := nums[i];
      // Theses two assertion are used for the last invariant, which
      // verifies that all elements in origin `nums[..i]` are contained in new `nums[..last+1]`
    }
    i := i + 1;
  }
  return last + 1;
}

method Testing() {
  var nums1 := new int[3];
  nums1[0] := 1;
  nums1[1] := 1;
  nums1[2] := 2;
  var num_length1 := RemoveDuplicates(nums1);
  print "nums1: ", nums1[..], ", num_length1: ", num_length1, "\n";

  var nums2 := new int[10];
  nums2[0] := 0;
  nums2[1] := 0;
  nums2[2] := 1;
  nums2[3] := 1;
  nums2[4] := 1;
  nums2[5] := 2;
  nums2[6] := 2;
  nums2[7] := 3;
  nums2[8] := 3;
  nums2[9] := 4;
  var num_length2 := RemoveDuplicates(nums2);
  print "nums2: ", nums2[..], ", num_length2: ", num_length2, "\n";
}

method Main() {
  Testing();
}
