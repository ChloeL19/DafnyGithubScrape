class Grinder { 
class Grinder { 
	ghost var hasBeans: bool 

	ghost predicate Valid() 
		reads this

	constructor() 
    predicate Ready() 
	method AddBeans() 
	method Grind() 
class WaterTank { 
class WaterTank { 
	ghost var waterLevel: nat

	ghost predicate Valid() 			 
		reads this 

	constructor() 				 
    function Level(): nat 
	method Fill() 
	method Use() 
class CoffeeMaker { 	
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
	{
		g := new Grinder();
		w := new WaterTank();
		ready := false;
		new;
		Repr := {this, g, w};
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
	}
	
    method Dispense()
	{
		g.Grind();
		w.Use();
		ready := g.hasBeans && w.waterLevel != 0;
	}	

	method ChangeGrinder()
	{
		g := new Grinder();
		ready := false;
		Repr := Repr + {g};
	}

	method InstallCustomGrinder(grinder: Grinder)
		ensures Valid() && fresh(Repr - old(Repr) - {grinder})
	{
		g := grinder;
		ready := g.hasBeans && w.waterLevel != 0;
		Repr := Repr + {g};
	}
}

method Main() {
method Main() {
	var cm := new CoffeeMaker();
	cm.ChangeGrinder();
	cm.Restock();
}
