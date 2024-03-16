function IsLetter(c: char): bool 
{
  (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') 
}

function NoLetters(s: string, n: nat): bool 
{
  forall c :: 0 <= c < n ==> !IsLetter(s[c])
}

function ToggleCase(c: char): char
{
  if c >= 'a' && c <= 'z' 
  then 
    (c - 'a' + 'A')
  else if c >= 'A' && c <= 'Z' 
    then 
      (c - 'A' + 'a')
    else 
      c
}
function isReverse(s: string, s_prime: string): bool{
  (|s| == |s_prime|) &&
  (forall si :: 0 <= si < |s|/2 ==> s_prime[|s| - si - 1] == s[si])
}

method Reverse(original: seq<char>) returns (reversed: seq<char>)
{
  reversed := []; 
  var i := |original|;
  while i > 0
  {
    i := i - 1;
    reversed := reversed + [original[i]]; 
  }
}


method solve(s: string) returns (result: string)
{
    var flg : bool := false;
    result := "";
    for i := 0 to |s|
    {
      if IsLetter(s[i])
      {
        result := result + [ToggleCase(s[i])];
        flg := true;
      } else {
        result := result + [s[i]];
      }
    }
    if !flg
    {
      result := Reverse(s);
    }
}

