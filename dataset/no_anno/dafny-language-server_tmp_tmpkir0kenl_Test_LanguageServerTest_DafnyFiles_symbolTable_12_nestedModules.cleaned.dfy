//Module Definitions

module M1 {
    module M2 {
        module M3 {
            class Class{
            class Class{
                constructor(){}
                constructor(){}
                var field : int;
                method meth() {}
                method meth() {}
            }
            method gmeth() {}
            method gmeth() {}
        }
    }
}

module TestModul1 {
    import M1
    method test() {
    method test() {
        var x := new M1.M2.M3.Class();
        x.meth();
        print x.field;
        //M1.M2.M3.gmeth(); seems not to be supported by Dafny
    }
}

module TestModul2 {
    import Mod1 = M1
    import Mod2 = Mod1.M2
    import Mod3 = Mod2.M3
    method test() {
    method test() {
        var x := new Mod2.M3.Class();
        var z := new Mod3.Class();
        
        x.meth();
        print x.field;

        z.meth();
        print z.field;

        Mod3.gmeth();
        //Mod2.M3.gmeth(); //not allowed
    }
}

