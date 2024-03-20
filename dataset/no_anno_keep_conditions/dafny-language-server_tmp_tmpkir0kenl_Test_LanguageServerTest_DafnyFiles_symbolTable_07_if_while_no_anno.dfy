method IAmTestNo7() {
   var a: bool := true;
   var b: nat := 2;

   //if
   if (false) {
	  print a;
     var a := 99;
	  print a;
   } else if (!true || (a && b==2)) {
      print a;
      var a := 99;
	  print a;
   } else {
      print a;
      var a := 99;
	  print a;
   }

   //while
   while  (b < 10)
   {
     b := b+1;
   }


}

method Main() {
IAmTestNo7();    
}
