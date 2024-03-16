predicate isPrefixPred(pre:string, str:string)
{
	(|pre| <= |str|) && pre == str[..|pre|]
}

predicate isNotPrefixPred(pre:string, str:string)
{
	// A way of writing !isPrefixPred according to DeMorgan 1
    !(|pre| <= |str|) || !(pre == str[..|pre|])
}

// Sanity check: Dafny should be able to automatically prove the following lemma
lemma PrefixNegationLemma(pre:string, str:string)
{}


predicate isSubstringPred(sub:string, str:string)
{
  // There exists an x where sub is a prefix of str[x..] 
  exists x :: ((|sub| <= x <= |str|) && (isPrefixPred(sub,str[x..]))) 
}

predicate isNotSubstringPred(sub:string, str:string)
{
    // A way to write !isSubstringPred with a forall
	// !exists x == forall !x
    forall x :: !((|sub| <= x <= |str|) && (isPrefixPred(sub,str[x..])))
}


// Sanity check: Dafny should be able to automatically prove the following lemma
lemma SubstringNegationLemma(sub:string, str:string)
{}


predicate haveCommonKSubstringPred(k:nat, str1:string, str2:string)
{
	// There exists a str1[i..j] which is a substring of str2 and i and j are within bounds
  	exists i,j :: (((j==i+k) && (k<=|str1| && k<=|str2|) && (0<=i<=|str1|-k)) && isSubstringPred(str1[i..j],str2))
}

predicate haveNotCommonKSubstringPred(k:nat, str1:string, str2:string)
{
	// A way to write !haveCommonKSubstringPred with a forall
	// !exists x == forall !x
	 forall i,j :: !(((j==i+k) && (k<=|str1| && k<=|str2|) && (0<=i<=|str1|-k)) && isSubstringPred(str1[i..j],str2))
}

// Sanity check: Dafny should be able to automatically prove the following lemma
lemma commonKSubstringLemma(k:nat, str1:string, str2:string)
{}

