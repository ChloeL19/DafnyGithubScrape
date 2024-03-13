class Grinder { 
	ghost var hasBeans: bool 

	ghost predicate Valid() 
		reads this

	constructor() 
		ensures Valid() && !hasBeans

    predicate Ready() 
		requires Valid() 
		reads this
		ensures Ready() == hasBeans

	method AddBeans() 
		requires Valid() 
		modifies this
		ensures Valid() && hasBeans

	method Grind() 
		requires Valid() && hasBeans 
		modifies this 
		ensures Valid()
}

class WaterTank { 
	ghost var waterLevel: nat

	ghost predicate Valid() 			 
		reads this 

	constructor() 				 
		ensures Valid() && waterLevel == 0

    function Level(): nat 
		requires Valid()
		reads this
		ensures Level() == waterLevel

	method Fill() 
		requires Valid() 
		modifies this 
		ensures Valid() && waterLevel == 10

	method Use() 
		requires Valid() && waterLevel != 0 
		modifies this 
		ensures Valid() && waterLevel == old(Level()) - 1
}

class CoffeeMaker { 	
	ghost var Repr: set<object>
	ghost var ready: bool
	var g: Grinder
	var w: WaterTank

	ghost predicate Valid() 
		reads this, Repr
        ensures Valid() ==> this in Repr
	{
		this in Repr && g in Repr && w in Repr &&
		g.Valid() && w.Valid() &&
		ready == (g.hasBeans && w.waterLevel != 0)
	}

    constructor() 
		ensures Valid() && fresh(Repr) && !ready
	{
		g := new Grinder();
		w := new WaterTank();
		ready := false;
		new;
		Repr := {this, g, w};
	}

    predicate Ready() 
		requires Valid() 
		reads Repr 
		ensures Ready() == ready
	{
		g.Ready() && w.Level() != 0
	}

    method Restock() 
		requires Valid() 
		modifies Repr 
		ensures Valid() && Ready() && fresh(Repr - old(Repr))
	{
		g.AddBeans();
		w.Fill();
		ready := true;
	}
	
    method Dispense()
		requires Valid() && Ready() 
		modifies Repr 
		ensures Valid() && fresh(Repr - old(Repr)) 
	{
		g.Grind();
		w.Use();
		ready := g.hasBeans && w.waterLevel != 0;
	}	

	method ChangeGrinder()
		requires Valid()
		modifies Repr
		ensures Valid() && fresh(Repr - old(Repr))
	{
		g := new Grinder();
		ready := false;
		Repr := Repr + {g};
	}

	method InstallCustomGrinder(grinder: Grinder)
		requires Valid() && grinder.Valid()
		modifies Repr
		ensures Valid() && fresh(Repr - old(Repr) - {grinder})
	{
		g := grinder;
		ready := g.hasBeans && w.waterLevel != 0;
		Repr := Repr + {g};
	}
}

method Main() {
	var cm := new CoffeeMaker();
	cm.ChangeGrinder();
	cm.Restock();
}
