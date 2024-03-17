//Module Definitions

module M1 {
    class Class {
        var field : nat;
        constructor(){}
        method Method() {}
    }

    method MethodIn_default() {}
}

module M2 {
    class Class {
        var field : nat;
        constructor(){}
        method Method() {}
    }

    method MethodIn_default() {}
}

//Tests

module ImportWithIdentifier { 
    import Mod = M1
    method test1() {
        var m1 := new Mod.Class();
        m1.Method();
        print m1.field;
        Mod.MethodIn_default();
    }
}
module ImportWithName {
    import M1                        
    method test2() {
        var m1 := new M1.Class();
        m1.Method();
        print m1.field;
        M1.MethodIn_default();
    }

}

module ImportOpened{ 
    import opened M2
    method test3() {
        var m2 := new Class();
        m2.Method();
        print m2.field;
    }
}

module ImportMultiple{
    import M1
    import M2
    method test3() {
        var m1 := new M1.Class();
        var m2 := new M2.Class();
        print m1.field;
        print m2.field;
        m1.Method();
        m2.Method();
        M1.MethodIn_default();
        M2.MethodIn_default();
    }
}
