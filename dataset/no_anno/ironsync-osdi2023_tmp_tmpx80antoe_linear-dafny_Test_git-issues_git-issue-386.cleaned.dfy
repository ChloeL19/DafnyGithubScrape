// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Foo {
class Foo {
    // this is accepted
    constructor(ghost b: set<bool>) {}
    constructor(ghost b: set<bool>) {}
    constructor Mk() {}
    constructor Mk() {}
    method Initialize(ghost b: set<bool>) {}
    method Initialize(ghost b: set<bool>) {}
}

method TestConstructor() {
method TestConstructor() {
    ghost var b: set<bool> := {};
    var f := new Foo(b);
    // error: ghost variables are only allowed in specification contexts
}

method TestInitialize() {
method TestInitialize() {
    ghost var b: set<bool> := {};
    var f := new Foo.Mk();
    // works
    f.Initialize(b);
}


