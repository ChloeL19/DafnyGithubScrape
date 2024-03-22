// Forall
method Q1(){/* TODO */ }

// Quantifiers
class Secret{
    var secret : int;
    var known : bool;
    var count : int;

    method Init(x : int)
    modifies `secret, `known, `count
    requires 1 <= x <= 10
    ensures secret == x
    ensures known == false
    ensures count == 0
    {/* TODO */ }

    method Guess(g : int) returns (result : bool, guesses : int)
    modifies `known, `count
    requires known == false
    ensures if g == secret then 
                result == true && known == true 
            else 
                result == false && known == false
    ensures count == old(count) + 1 && guesses == count
    {/* TODO */ }

    method Main()
    {/* TODO */ }
}

