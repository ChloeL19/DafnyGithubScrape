module Helpers {
    method addOne(a: nat) returns (r: nat)
    ensures r == a+1 {
    
        return a + 1;
    }
}
