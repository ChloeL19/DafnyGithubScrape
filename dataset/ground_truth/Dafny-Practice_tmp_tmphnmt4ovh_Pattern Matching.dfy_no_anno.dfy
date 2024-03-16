
method {:verify true} FindAllOccurrences(text: string, pattern: string) returns (offsets: set<nat>)
{
    offsets := {};
    var i:int := 0;
	// no pattern in text at all.
    if |pattern| > |text|
    {
        return offsets;
    }

	//all offsets are offsets of pattern/ 
    if pattern == ""
    {
        while i < |text|
		{
			offsets := offsets + {i};
            i:=i+1;
		}
        offsets := offsets + {|text|};
		return offsets;
    }

    var pattern_hash: int := RecursiveSumDown(pattern);
    var text_hash: int := RecursiveSumDown(text[..|pattern|]);
	if pattern_hash == text_hash{
        if text[..|pattern|] == pattern
        {
            offsets := offsets + {0};
        }
    }
	
    else
	{
        LemmaRabinKarp(text[..|pattern|], pattern, text_hash, pattern_hash);
    }

	while i < |text| - |pattern|
	{
		var old_text_hash := text_hash;
		var left_letter_as_int := text[i] as int;
		var right_new_letter_as_int := text[i+|pattern|] as int;
		text_hash := text_hash - left_letter_as_int + right_new_letter_as_int;
		//updating i
		i := i + 1;
		if pattern_hash == text_hash{
			if text[i..i + |pattern|] == pattern
			{
				offsets := offsets + {i};
			}
			LemmaHashEqualty(text_hash, text, i, old_text_hash, pattern);
		}
		else{
			LemmaHashEqualty(text_hash, text, i, old_text_hash, pattern);
			LemmaRabinKarp(text[i..i+|pattern|], pattern, text_hash, pattern_hash);
		}
		Lemma2Sides(text, pattern, i, offsets);
		//=>
	}
}

function RecursiveSumDown(str: string): int
	decreases |str|
{
	if str == "" then 0 else str[|str|-1] as int +RecursiveSumDown(str[..|str|-1])
}

function RecursiveSumUp(str: string): int
	decreases |str|
{
	if str == "" then 0 else str[0] as int + RecursiveSumUp(str[1..])
}

lemma {:verify true}LemmaRabinKarp(t_sub:string, pattern:string, text_hash:int, pattern_hash:int)
{}

lemma Lemma2Sides(text: string, pattern: string, i: nat, offsets: set<nat>)
{}

lemma LemmaHashEqualty(text_hash : int, text: string, i: nat, old_text_hash: int, pattern: string)
{
	ghost var temp_val := old_text_hash + text[i - 1 + |pattern|] as int;
	ghost var str := text[i - 1..];
	LemmaAddingOneIndex(str, |pattern|, old_text_hash);
	PrependSumUp(text[i - 1..i + |pattern|]);
	EquivalentSumDefinitions(text[i - 1..i + |pattern|]);
	EquivalentSumDefinitions(text[i..i + |pattern|]);
	//=>
}

lemma LemmaAddingOneIndex(str: string, i: nat, sum: int)
{
	var str1 := str[..i+1];
	calc {
		RecursiveSumDown(str[..i+1]);
	== // def.
		if str1 == [] then 0 else str1[|str1|-1] as int + RecursiveSumDown(str1[..|str1|-1]);
	== { assert str1 != []; } // simplification for a non-empty sequence
		str1[|str1|-1] as int + RecursiveSumDown(str1[..|str1|-1]);
	== { assert |str1|-1 == i; }
		str1[i] as int + RecursiveSumDown(str1[..i]);
	== { assert str1[..i] == str[..i]; }
		str[i] as int + RecursiveSumDown(str[..i]);
	== // inv.
		str[i] as int + sum;
	==
		sum + str[i] as int;
	}
}

lemma PrependSumUp(str: string)
{
	// directly from the definition of RecursiveSumUp (for a non-emty sequence)
}

lemma EquivalentSumDefinitions(str: string)
{
	if |str| == 0
	{
	}
	else if |str| == 1
	{
	}
	else
	{
		var first: char, mid: string, last:char := str[0], str[1..|str|-1], str[|str|-1];
		calc {
			RecursiveSumDown(str);
		== { assert str != [] && str[|str|-1] == last && str[..|str|-1] == [first] + mid; }
			last as int + RecursiveSumDown([first] + mid);
		== // arithmetic
			RecursiveSumDown([first] + mid) + last as int;
		== { EquivalentSumDefinitions([first] + mid); } // induction hypothesis
			RecursiveSumUp([first] + mid) + last as int;
		== { assert [first] + mid != []; }
			first as int + RecursiveSumUp(mid) + last as int;
		== { EquivalentSumDefinitions(mid); } // induction hypothesis
			first as int + RecursiveSumDown(mid) + last as int;
		==
			first as int + RecursiveSumDown(mid + [last]);
		== { EquivalentSumDefinitions(mid + [last]); } // induction hypothesis
			first as int + RecursiveSumUp(mid + [last]);
		== { assert str != [] && str[0] == first && str[1..] == mid + [last]; }
			RecursiveSumUp(str);
		}
	}
}

