class {:autocontracts} CarPark {
    const totalSpaces: nat := 10;
    const normalSpaces: nat:= 7;
    const reservedSpaces: nat := 3;
    const badParkingBuffer: int := 5;

    var weekend: bool;
    var subscriptions: set<string>;
    var carPark: set<string>;
    var reservedCarPark: set<string>;

    constructor()
    {

    this.subscriptions := {};
    this.carPark := {};
    this.reservedCarPark := {};
    this.weekend := false;
    }

    // This predicate checks if the car park is in a valid state at all times.
    // It checks if the sets of cars in the car park and the reserved car park are disjoint and share no values,
    // the total number of cars in the car park is less than or equal to the total number of spaces in
    // the car park plus the bad parking buffer, the number of normal spaces plus reserved spaces is
    // equal to the total number of spaces, and the number of cars in the reserved car park is less than or equal
    // to the number of reserved spaces
    ghost predicate Valid()
    reads this
    {
                          carPark * reservedCarPark == {} && |carPark| <= totalSpaces + badParkingBuffer && (normalSpaces + reservedSpaces) == totalSpaces && |reservedCarPark| <= reservedSpaces
    }

  // The method maintains the invariant that if success is true, then the car parameter is removed from either
  // the carPark or the reservedCarPark set. Otherwise, neither set is modified
  method leaveCarPark(car: string) returns (success: bool)
    {
    success := false;

    if car in carPark {
      carPark := carPark - {car};
      success := true;
    } else if car in reservedCarPark {
      reservedCarPark := reservedCarPark - {car};
      success := true;
    }
    }

  // The method maintains the invariant that the number of available spaces availableSpaces is updated correctly
  // based on the current state of the car park and whether it is a weekend or not
  method checkAvailability() returns (availableSpaces: int)
    {
    if (weekend){
      availableSpaces := (normalSpaces - |carPark|) + (reservedSpaces - |reservedCarPark|) - badParkingBuffer;
    } else{
      availableSpaces := (normalSpaces - |carPark|) - badParkingBuffer;
    }

    }

  // The method maintains the invariant that if success is true, then the car parameter is added to the
  // subscriptions set. Otherwise, the subscriptions set is not modified
  method makeSubscription(car: string) returns (success: bool)
    {
    if |subscriptions| >= reservedSpaces || car in subscriptions {
      success := false;
    } else {
      subscriptions := subscriptions + {car};
      success := true;
    }
    }


  // The method maintains the invariant that the weekend variable is set to true
  method openReservedArea()
    {
    weekend := true;
    }

  // The method maintains the invariant that the carPark, reservedCarPark, and subscriptions sets are all cleared
  method closeCarPark()
    {
    carPark := {};
    reservedCarPark := {};
    subscriptions := {};
    }

  // The method maintains the invariant that if success is true, then the car parameter is added to the carPark
  // set and the number of cars in the carPark set is less than the number of normal spaces minus the bad parking
  // buffer. Otherwise, the carPark and reservedCarPark sets are not modified
  method enterCarPark(car: string) returns (success: bool)
    {
    if (|carPark| >= normalSpaces - badParkingBuffer || car in carPark || car in reservedCarPark) {
      return false;
    }
    else
    {
      carPark := carPark + {car};
      return true;
    }
    }

  // The method maintains the invariant that if success is true, then the car parameter is added to the
  // reservedCarPark set and the number of cars in the reservedCarPark set is less than the number of
  // reserved spaces and either the weekend variable is true or the car parameter is in the subscriptions set.
  // Otherwise, the carPark and reservedCarPark sets are not modified
  method enterReservedCarPark(car: string) returns (success: bool)
  {
    if (|reservedCarPark| >= reservedSpaces || car in carPark || car in reservedCarPark || (car !in subscriptions && weekend == false)) {
      return false;
    }
    else
    {
      reservedCarPark := reservedCarPark + {car};
      return true;
    }
  }
}


method Main() {
  // Initialises car park with 10 spaces, 3 of which are reserved and therefore 7 are normal
  var carPark := new CarPark();

  // As we are allowing 5 spaces for idiots who can't park within the lines 7 - 5 == 2
  var availableSpaces := carPark.checkAvailability();
  var success := carPark.enterCarPark("car1");
  availableSpaces := carPark.checkAvailability();
  success := carPark.enterCarPark("car2");
  availableSpaces := carPark.checkAvailability();
  success := carPark.enterCarPark("car3");
  success := carPark.makeSubscription("car4");
  success := carPark.enterReservedCarPark("car4");
  success := carPark.enterReservedCarPark("car5");
  success := carPark.makeSubscription("car6");
  success := carPark.makeSubscription("car7");
  success := carPark.makeSubscription("car8");
  success := carPark.enterReservedCarPark("car6");
  success := carPark.enterReservedCarPark("car7");
  success := carPark.leaveCarPark("car1");
  success := carPark.leaveCarPark("car9");
  success := carPark.leaveCarPark("car6");
  carPark.closeCarPark();
}

// Added due to timeout in Main
method MainB () {
  var carPark := new CarPark();

  // Test opening the reserved carPark
  carPark.openReservedArea();
  var success := carPark.enterReservedCarPark("car3");
  carPark.closeCarPark();
}
