//Module Definitions

module M1 {
    module M2 {
        module M3 {
            class Class{
                constructor(){}
                var field : int;
                method meth() {/* TODO */ }
            }
            method gmeth() {/* TODO */ }
        }
    }
}

module TestModul1 {
    import M1
    method test() {/* TODO */ }
}

module TestModul2 {
    import Mod1 = M1
    import Mod2 = Mod1.M2
    import Mod3 = Mod2.M3
    method test() {/* TODO */ }
}

