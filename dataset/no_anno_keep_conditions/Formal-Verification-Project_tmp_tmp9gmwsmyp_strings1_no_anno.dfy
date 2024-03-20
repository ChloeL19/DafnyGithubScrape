//The following method should return true if and only if pre is a prefix of str. That is, str starts with pre
method isPrefix(pre: string, str: string) returns (res:bool) 
{
    if |str| < |pre| 
    {
        return false;
    }
    else if pre[..] == str[..|pre|]
    {
        return true;
    }
    else{
        return false;
    }
}

// The following method should return true if and only if sub is a substring of str. That is, str contains sub
method isSubstring(sub: string, str: string) returns (res:bool)
{
    var i := 0;
    // Check if sub is a prefix of str[i..] and if not, keep incrementing until i = |str| - |sub|
    while i <= |str| - |sub|
    {
        var temp := isPrefix(sub, str[i..]);
        if  temp == true 
        {
            return true;
        }
        else 
        {
            i := i + 1;
        }
    }
    return false;
}

// The following method should return true if and only if str1 and str1 have a common substring of length k
method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool)
{
    var i := 0;
    // Don't want to exceed the bounds of str1 when checking for the element that is k entries away
    while i <= (|str1| - k)
    {
        // Get an index from the array position were are at to the array position that is k away and check the substring
        var temp := isSubstring(str1[i..(i + k)], str2);
        if  temp == true 
        {
            return true;
        }
        else 
        {
            i := i + 1;
        }
    }
    return false;
}

// The following method should return the natural number len which is equal to the length of the longest common substring of str1 and str2. 
// Note that every two strings have a common substring of length zero.
method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat)
{
    var maxlength := 0;
    var i := 0;

    while i <= |str1|
    {
        // Idea is to increment the size of the substring we want to find, if we find a substring then the length of that substring is the new maxlength
        var temp := haveCommonKSubstring(i, str1, str2);
        if  temp == true 
        {
            maxlength := i;
        }

        i := i + 1;
    }
    return maxlength;
}
