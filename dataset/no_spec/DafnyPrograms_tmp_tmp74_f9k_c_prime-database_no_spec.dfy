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
  {
    forall i | i in database.Keys :: (database[i] == true <==> prime(i)) 
  }

//the constructor
  constructor()
  {
    database := map[];
  }

  // insert an already known prime number into the database
  method InsertPrime(n: nat)
  {
    database := database[n := true];
  }

  // check the primeness of n and insert it accordingly into the database 
  method InsertNumber(n: nat) 
  {
    var prime : bool;
    prime := testPrimeness(n);
    database := database[n := prime];
  }

  // lookup n in the database and reply with Yes or No if it's in the database and it is or it is not prime,
  // or with Unknown when it's not in the databse
  method IsPrime?(n: nat) returns (answer: Answer) 
  {
    if !(n in database){
      return Unknown;
    } else if database[n] == true {
      return Yes;
    } else if database[n] == false {
      return No;
    }
  }

  // method to test whether a number is prime, returns bool
  method testPrimeness(n: nat) returns (result: bool) 
  {
   if n == 0 || n == 1{
    return false;
   }
    var i := 2;
    result := true;

    while i < n 
    {
      if n % i == 0 {
        result := false; 
      }
      i := i + 1;
    }
  }
}

method testingMethod() {

  // witness to prove to dafny (exists nr | 1 < nr < n :: n % nr != 0), since 
  // the !(forall nr | 1 < nr < n :: n % nr != 0) from !prime predicate ==>  (exists nr | 1 < nr < n :: n % nr == 0)
  var pm := new PrimeMap();

  // InsertPrime test
  pm.InsertPrime(13);
  // InsertNumber test
  pm.InsertNumber(17);
  pm.InsertNumber(15);

  var result: Answer := pm.IsPrime?(17);
  var result2: Answer := pm.IsPrime?(15);
  var result3: Answer := pm.IsPrime?(454);
  var result4: Answer := pm.IsPrime?(13);
}





