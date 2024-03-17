class Grinder { 
	ghost var hasBeans: bool 
    ghost var Repr: set<object>

	ghost predicate Valid() 
}

class WaterTank { 
	ghost var waterLevel: nat
    ghost var Repr: set<object>

	ghost predicate Valid() 			 
}

class CoffeeMaker { 	
	var g: Grinder 	
	var w: WaterTank
	ghost var ready: bool
	ghost var Repr: set<object>

	ghost predicate Valid() 
	{ 
		this in Repr && g in Repr && w in Repr &&
		g.Repr <= Repr && w.Repr <= Repr &&
		g.Valid() && w.Valid() &&
		this !in g.Repr && this !in w.Repr && w.Repr !! g.Repr &&
		ready == (g.hasBeans && w.waterLevel != 0) 
	}

    constructor() 
	{ 
	
		g := new Grinder(); 
		w := new WaterTank(); 
		ready := false;
		new;
		Repr := {this, g, w} + g.Repr + w.Repr;
		
	}

    predicate Ready() 
	{ 
		g.Ready() && w.Level() != 0
	}

    method Restock() 
	{ 
		g.AddBeans(); 
		w.Fill();  
		ready := true;
		Repr := Repr + g.Repr + w.Repr;
	} 

    method Dispense()
	{ 	
		g.Grind(); 
		w.Use(); 
		ready := g.hasBeans && w.waterLevel != 0;
		Repr := Repr + g.Repr + w.Repr;
		
	}
}

method CoffeeTestHarness() { 
	var cm := new CoffeeMaker(); 
	cm.Restock(); 
	cm.Dispense();
}


