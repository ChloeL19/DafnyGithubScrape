// Noa Leron 207131871
// Tsuri Farhana 315016907


ghost predicate ExistsSubstring(str1: string, str2: string) {
	// string in Dafny is a sequence of characters (seq<char>) and <= on sequences is the prefix relation
	exists offset :: 0 <= offset <= |str1| && str2 <= str1[offset..]
}

ghost predicate Post(str1: string, str2: string, found: bool, i: nat) {
	(found <==> ExistsSubstring(str1, str2)) &&
	(found ==> i + |str2| <= |str1| && str2 <= str1[i..])
}

/*
Goal: Verify correctness of the following code. Once done, remove the {:verify false} (or turn it into {:verify true}).

Feel free to add GHOST code, including calls to lemmas. But DO NOT modify the specification or the original (executable) code.
*/
method {:verify true} FindFirstOccurrence(str1: string, str2: string) returns (found: bool, i: nat)
	ensures Post(str1, str2, found, i)
{/* TODO */ }

method Main() {/* TODO */ }




//this is our lemmas, invatiants and presicats


ghost predicate Outter_Inv_correctness(str1: string, str2: string, found: bool, i : nat)
{
	(found ==> (i + |str2| <= |str1| && str2 <= str1[i..])) // Second part of post condition
	&&
	(!found &&  0 < i <= |str1| && i != |str2|-1 ==> !(ExistsSubstring(str1[..i], str2))) // First part of post condition
	&&
	(!found ==> i <= |str1|)
}

ghost predicate Inner_Inv_correctness(str1: string, str2: string, i : nat, j: int, found: bool){
	0 <= j <= i && // index in range
	j < |str2| && // index in range
	i < |str1| &&// index in range
	(str1[i] == str2[j] ==> str2[j..] <= str1[i..]) &&
	(found ==> j==0 && str1[i] == str2[j])
}

ghost predicate Inner_Inv_Termination(str1: string, str2: string, i : nat, j: int, old_i: nat, old_j: nat){
	old_j - j == old_i - i
}
	
lemma {:verify true} Lemma1 (str1: string, str2: string, i : nat, j: int, old_i: nat, old_j: nat, found: bool)
// requires old_j - j == old_i - i;
requires !found;
requires |str2| > 0;
requires Outter_Inv_correctness(str1, str2, found, old_i);
requires i+|str2|-j == old_i + 1;
requires old_i+1 >= |str2|;
requires old_i+1 <= |str1|;
requires 0 <= i < |str1| && 0 <= j < |str2|;
requires str1[i] != str2[j];
requires |str2| > 0;
requires 0 < old_i <= |str1| ==> !(ExistsSubstring(str1[..old_i], str2));
ensures 0 < old_i+1 <= |str1| ==> !(ExistsSubstring(str1[..old_i+1], str2));
{/* TODO */ }


lemma {:verify true} Lemma2 (str1: string, str2: string, i : nat, found: bool)
requires 0 <= i < |str1|;
requires 0 < |str2| <= i+1;
requires !ExistsSubstring(str1[..i], str2);
requires ExistsSubstring(str1[..i+1], str2);
ensures str2 <= str1[i+1 - |str2| .. i+1];
{/* TODO */ }

lemma Lemma3(str1: string, str2: string, i : nat)
	requires 0 <= i < |str1|;
	requires 0 < |str2| <= i+1;
	requires exists offset :: (0 <= offset <= i+1) && str2 <= str1[offset..i+1];
	requires forall offset :: 0 <= offset <= i+1 ==> (offset <= i ==> !(str2 <= str1[offset..i]));
	ensures exists offset :: (0 <= offset <= i+1) && (str2 <= str1[offset..i+1]) && (offset <= i ==> !(str2 <= str1[offset..i]));
{/* TODO */ }



