class MyClass {
    var ABC: int;
    constructor () { }
    method aMethod() modifies this {
        ABC := 1; 
        print ABC;  //1

        var ABC := 2;
        print ABC;  //2
        print this.ABC;  //1 

        { 
            print ABC;  //2
            print this.ABC;  //1 

            var ABC := 3;
            print ABC; //3 
            print this.ABC; //1
        }
        
        print ABC;  //2
        print this.ABC;  //1 
    }

}


method Main() {  
    var a := new MyClass();
    a.aMethod();
	OtherMethod();
} 

method OtherMethod() {}

