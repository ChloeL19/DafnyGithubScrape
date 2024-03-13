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
	return |pre| <= |str| && forall i :: 0 <= i < |pre| ==> pre[i] == str[i];
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
	if(|str| < |sub|)
	{
		return false;
	}
	else
	{
		var i: nat := 0;
	 	res := false;
		while (i <= |str|-|sub| && res == false)
		decreases |str| - |sub| - i + (if !res then 1 else 0)
		invariant 0 <= i <= |str|-|sub| + 1
		invariant res ==> isSubstringPred(sub,str)
		invariant forall j :: 0 <= j < i ==> isNotPrefixPred(sub, str[j..])
		{
			res := isPrefix(sub,str[i..]);
			if(!res)
			{
				i := i + 1;
			}
		}
	}
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
	if (k <= |str1| && k <= |str2|)
	{
		var slice : string;
		found := false;
		var i: nat := 0;

		while (i <= |str1| - k && found == false)
		decreases |str1| - k - i + (if !found then 1 else 0)
		invariant found ==> haveCommonKSubstringPred(k,str1,str2)
		invariant forall x, y :: 0 <= x < i && found == false && y == x + k && y <= |str1| ==> isNotSubstringPred(str1[x..y], str2)		
		{
			slice := str1[i..i+k];
			found := isSubstring(slice, str2);
				i := i + 1;
		}
	} else {
		return false;
	}
     
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat)
{
	assert isPrefixPred(str1[0..0],str2[0..]);

	len := |str1|;
	var hasCommon : bool := true;
	while(len > 0)
		decreases len
		invariant forall i :: len < i <= |str1| ==> !haveCommonKSubstringPred(i,str1,str2)
	{
		hasCommon := haveCommonKSubstring(len, str1, str2);
		if(hasCommon){
			return len;
		}
		len := len - 1;
	}
	return len;
}


