// We spent 2h each on this assignment

predicate isPrefixPred(pre:string, str:string)
{
	(|pre| <= |str|) && 
	pre == str[..|pre|]
}

predicate isNotPrefixPred(pre:string, str:string)
{
	(|pre| > |str|) || 
	pre != str[..|pre|]
}

lemma PrefixNegationLemma(pre:string, str:string)
{}

method isPrefix(pre: string, str: string) returns (res:bool)
{
	if |pre| > |str|
    	{return false;}

  	var i := 0;
  	while i < |pre|
  	{
    	if pre[i] != str[i]
    	{
       		return false;
    	} 
    	i := i + 1;
  	}
 	return true;
}
predicate isSubstringPred(sub:string, str:string)
{
	(exists i :: 0 <= i <= |str| &&  isPrefixPred(sub, str[i..]))
}

predicate isNotSubstringPred(sub:string, str:string)
{
	(forall i :: 0 <= i <= |str| ==> isNotPrefixPred(sub,str[i..]))
}

lemma SubstringNegationLemma(sub:string, str:string)
{}

method isSubstring(sub: string, str: string) returns (res:bool)
{
	if |sub| > |str| {
        return false;
    }

    var i := |str| - |sub|;
    while i >= 0 
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

predicate haveCommonKSubstringPred(k:nat, str1:string, str2:string)
{
	exists i1, j1 :: 0 <= i1 <= |str1|- k && j1 == i1 + k && isSubstringPred(str1[i1..j1],str2)
}

predicate haveNotCommonKSubstringPred(k:nat, str1:string, str2:string)
{
	forall i1, j1 :: 0 <= i1 <= |str1|- k && j1 == i1 + k ==>  isNotSubstringPred(str1[i1..j1],str2)
}

lemma commonKSubstringLemma(k:nat, str1:string, str2:string)
{}

method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool)
{
	 if( |str1| < k || |str2| < k){
        return false;
    }
    var i := |str1| - k;
    while i >= 0
    {
				var t := i+k;
        var isSub := isSubstring(str1[i..t], str2);
        if isSub 
        {
            return true;
        }
        i := i-1;
    }
    return false;
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat)
{
	var i := |str1|;

  	while i > 0
  	{
    	var ans := haveCommonKSubstring(i, str1, str2);
    	if ans {
       		return i;
    	}
    	i := i -1;
  	}
  	return 0;
}



