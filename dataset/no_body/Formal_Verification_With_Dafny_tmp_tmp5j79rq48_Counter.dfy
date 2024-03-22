class Counter {
 
  var value : int ;
  
  constructor init() 
  ensures value == 0;
  {
    value := 0 ;
  }
  
  method getValue() returns (x:int)
  ensures x == value;
  {/* TODO */ }
  
  method inc()
  modifies this`value
  requires value >= 0;
  ensures value == old(value) + 1; 
  {/* TODO */ }
  
  method dec()
  modifies this`value
  requires value > 0;
  ensures value == old(value) - 1; 
  {/* TODO */ }
  
  method Main ()
  {/* TODO */ }
}

