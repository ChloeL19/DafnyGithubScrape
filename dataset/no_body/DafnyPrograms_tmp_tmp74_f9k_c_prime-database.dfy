//predicate for primeness
ghost predicate prime(n: nat)

{ n > 1 && (forall nr | 1 < nr < n :: n % nr != 0) }

datatype Answer = Yes | No | Unknown

//the class containing a prime database, if a number is prime it returns Yes, if it is not No and if the number
//is not in the database it returns Unknown
class {:autocontracts} PrimeMap{

  var database: map<nat, bool>; 

//the valid invariant of the class
  ghost predicate Valid()
    reads this
  {
    forall i | i in database.Keys :: (database[i] == true <==> prime(i)) 
  }

//the constructor
  constructor()
    ensures database == map[]
  {
    database := map[];
  }

  // insert an already known prime number into the database
  method InsertPrime(n: nat)
    modifies this;
    ensures database.Keys == old(database.Keys) + {/* TODO */ }
    requires prime(n)
    ensures database == database[n := true] 
  {
    database := database[n := true];
  }

  // check the primeness of n and insert it accordingly into the database 
  method InsertNumber(n: nat) 
    modifies this
    ensures database.Keys == old(database.Keys) + {/* TODO */ }
    ensures prime(n) <==> database == database[n := true] 
    ensures !prime(n) <==> database == database[n := false] 
  {
    var prime : bool;
    prime := testPrimeness(n);
    database := database[n := prime];
  }

  // lookup n in the database and reply with Yes or No if it's in the database and it is or it is not prime,
  // or with Unknown when it's not in the databse
  method IsPrime?(n: nat) returns (answer: Answer) 
      ensures database.Keys == old(database.Keys)
      ensures (n in database) && prime(n) <==> answer == Yes 
      ensures (n in database) && !prime(n) <==> answer == No 
      ensures !(n in database) <==> answer == Unknown
  {/* TODO */ }

  // method to test whether a number is prime, returns bool
  method testPrimeness(n: nat) returns (result: bool) 
      requires n >= 0
      ensures result <==> prime(n)
  {/* TODO */ }
}

method testingMethod() {/* TODO */ }





