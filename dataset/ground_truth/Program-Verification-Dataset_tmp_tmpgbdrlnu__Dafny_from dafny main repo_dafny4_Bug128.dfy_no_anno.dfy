// RUN: %dafny /noNLarith /proverOpt:O:pi.warnings=true /proverWarnings:1 /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

ghost function GetIndexInSequence<T>(s:seq<T>, x:T) : int
		var i :| 0 <= i < |s| && s[i] == x;
		i
	}




