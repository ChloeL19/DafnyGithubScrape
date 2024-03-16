predicate isPrefixPredicate(pre: string, str:string)
{
  |str| >= |pre| && pre <= str
}

method isPrefix(pre: string, str: string) returns (res: bool)
{
  if |pre| > |str|
    {return false;}

  var i := 0;
  while i < |pre|
    decreases |pre| - i
  {
    if pre[i] != str[i]
    {
        return false;
    } 
    i := i + 1;
  }
 return true;
}

predicate isSubstringPredicate (sub: string, str:string)
{
  |str| >= |sub| && (exists i :: 0 <= i <= |str| && isPrefixPredicate(sub, str[i..]))
}

method isSubstring(sub: string, str: string) returns (res:bool)
{
    if |sub| > |str| {
        return false;
    }

    var i := |str| - |sub|;
    while i >= 0 
    decreases i
    {
        var isPref := isPrefix(sub, str[i..]);
        if isPref
        {
            return true;
        }
        i := i-1;
    }
    return false;
}

predicate haveCommonKSubstringPredicate(k: nat, str1: string, str2: string)
{
  |str1| >= k && |str2| >= k && (exists i :: 0 <= i <= |str1| - k && isSubstringPredicate((str1[i..])[..k], str2))
}


method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool)
{
    if( |str1| < k || |str2| < k){
        return false;
    }
    var i := |str1| - k;
    while i >= 0
      decreases i
    {
        var isSub := isSubstring(str1[i..][..k], str2);
        if isSub 
        {
            return true;
        }
        i := i-1;
    }
    return false;
}


predicate maxCommonSubstringPredicate(str1: string, str2: string, len:nat)
{
   forall k :: len < k <= |str1| ==> !haveCommonKSubstringPredicate(k, str1, str2)
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat)
{
    
  var i := |str1|;

  while i > 0
  decreases i
  {
    var ans := haveCommonKSubstring(i, str1, str2);
    if ans {
       return i;
    }
    i := i -1;
  }
  return 0;

}
