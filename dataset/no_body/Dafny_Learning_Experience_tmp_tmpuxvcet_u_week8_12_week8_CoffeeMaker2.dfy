class Grinder { 
	ghost var hasBeans: bool 
    ghost var Repr: set<object>

	ghost predicate Valid() 
		reads this, Repr
        ensures Valid() ==> this in Repr
		
	constructor() 
		ensures Valid() && fresh(Re/* TODO */ }

class WaterTank {/* TODO */ }

class CoffeeMaker {/* TODO */ }

method CoffeeTestHarness() {/* TODO */ }


