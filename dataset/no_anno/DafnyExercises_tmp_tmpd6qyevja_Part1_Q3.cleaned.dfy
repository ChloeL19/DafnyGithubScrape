method Main() {
method Main() {
    var s := ["no","one","two","three","four","five","six","seven","eight","nine","ten"];
    var v := ["No","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"];
    var j := 10;
    while (j > 0) {
        a(v[j],s[j-1],j);
        j := j-1; 
    }
}
method a(a:string,b:string,j:int) returns () {
method a(a:string,b:string,j:int) returns () {
    //s(8);
    var m := s(j);
    var n := s(j-1);
    var l := a+" green bottle"+m+" hanging on a wall.\n";
    print l;
    print l;
    print "And if one green bottle should accidently fall,\n";
    print ("There'll be "+b+" green bottle"+n+", hanging on a wall.\n");
}
method s(j:int) returns(r:string){
method s(j:int) returns(r:string){
    r:="";
    if(j!=1){
        r:="s";
    }
}

