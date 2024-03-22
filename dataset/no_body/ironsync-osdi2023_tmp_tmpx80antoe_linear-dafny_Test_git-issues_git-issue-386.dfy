// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Foo {
    // this is accepted
    constructor(ghost b: set<bool>) {}
    constructor Mk() {}
    method Initialize(ghost b: set<bool>) {/* TODO */ }
}

method TestConstructor() {/* TODO */ }

method TestInitialize() {/* TODO */ }


