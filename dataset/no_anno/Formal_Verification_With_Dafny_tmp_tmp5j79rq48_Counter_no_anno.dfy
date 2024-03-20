class Counter {
 
  var value : int ;
  
  constructor init() 
  {
    value := 0 ;
  }
  
  method getValue() returns (x:int)
  {
    x := value ;
  }
  
  method inc()
  modifies this`value
  {
    value := value + 1;
  }
  
  method dec()
  modifies this`value
  {  
    value := value - 1 ;
  }
  
  method Main ()
  {
   var count := new Counter.init() ;
   count.inc();
   count.inc();
   count.dec();
   count.inc();
   var aux : int := count.getValue();
  }
}

