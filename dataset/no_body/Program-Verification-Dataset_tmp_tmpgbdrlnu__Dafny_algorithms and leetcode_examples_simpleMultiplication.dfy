
method Foo(y: int, x: int) returns (z: int) 
  requires 0 <= y
  ensures z == x*y
{/* TODO */ }

function stringToSet(s: string): (r: set<char>)
ensures forall x :: 0 <= x < |s| ==> s[x] in r
{
 set x | 0 <= x < |s| :: s[x]
}
//ensures forall a, b :: 0 <= a < b < |s|  ==> forall k, j :: a <=k < j <=b ==> k !=j ==> s[k] != s[j] ==> b-a <= longest
// lemma stringSet(s: string)
//    
//   {/* TODO */ }


method Main() {/* TODO */ }
