method  addOne(i: int) returns (r:int) {
method  addOne(i: int) returns (r:int) {
    var field := 2;
    r := i + 1;
}

class MyClass {
class MyClass {

    var field: int;

    method  addOne(i: int) returns (r:int) {
    method  addOne(i: int) returns (r:int) {
       r := i + 1;
    }
    constructor () { }
    constructor () { }

}



class OtherClass {
class OtherClass {

    var field: int;

    constructor () { }
    constructor () { }

    method  addOne(i: int) returns (r:int) {
    method  addOne(i: int) returns (r:int) {
       r := i + 1;
    }

    method hotStuff() modifies this {
    method hotStuff() modifies this {
        var mc := new MyClass();
        field := mc.field;
        field := mc.addOne(2);
        field := this.addOne(2);
        field := addOne(2);
    }
}

