//Module Definitions

module M1 {
    class Class {
        var field : nat;
        constructor(){}
        method Method() {/* TODO */ }
    }

    method MethodIn_default() {/* TODO */ }
}

module M2 {
    class Class {
        var field : nat;
        constructor(){}
        method Method() {/* TODO */ }
    }

    method MethodIn_default() {/* TODO */ }
}

//Tests

module ImportWithIdentifier { 
    import Mod = M1
    method test1() {/* TODO */ }
}
module ImportWithName {
    import M1                        
    method test2() {/* TODO */ }

}

module ImportOpened{ 
    import opened M2
    method test3() {/* TODO */ }
}

module ImportMultiple{
    import M1
    import M2
    method test3() {/* TODO */ }
}
