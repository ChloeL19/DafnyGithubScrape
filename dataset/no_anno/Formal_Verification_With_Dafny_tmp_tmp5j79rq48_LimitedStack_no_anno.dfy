// A LIFO queue (aka a stack) with limited capacity.
class LimitedStack{
 
      var capacity : int; // capacity, max number of elements allowed on the stack.
      var arr : array<int>; // contents of stack.
      var top : int; // The index of the top of the stack, or -1 if the stack is empty

      // This predicate express a class invariant: All objects of this calls should satisfy this.
      predicate Valid()
      reads this;
      {
        arr != null && capacity > 0 && capacity == arr.Length &&  top >= -1 && top < capacity 
      }

      predicate Empty()
      reads this`top;
      {
            top == -1
      }

      predicate Full()
      reads this`top, this`capacity;
      {
        top == (capacity - 1)
      }
  
      method Init(c : int)
      {
        capacity := c;
        arr := new int[c];
        top := -1;
      }


      
      method isEmpty() returns (res : bool)
      {
        if(top == -1)
        { return true; }
        else {
              return false;
        }
      }



      // Returns the top element of the stack, without removing it.
      method Peek() returns (elem : int) 
      {
            return arr[top]; 
      }



      // Pushed an element to the top of a (non full) stack. 
      method Push(elem : int)
      {
            top := top + 1;
            arr[top] := elem;
      }

      // Pops the top element off the stack.

      method Pop() returns (elem : int)
      {
            elem := arr[top];
            top := top - 1;
            return elem;
      }

 
      method Shift()
      {
        var i : int := 0;
        while (i < capacity - 1 )
        {
          arr[i] := arr[i + 1];
          i := i + 1;
        }
        top := top - 1;
      }

 
      //Push onto full stack, oldest element is discarded.
      method Push2(elem : int)
      {
            if(top == capacity - 1){
                  Shift();
                  top := top + 1;
                  arr[top] := elem;
            }
            else{
                  top := top + 1;
                  arr[top] := elem;
            }
      }
 

 

// When you are finished,  all the below assertions should be provable. 
// Feel free to add extra ones as well.
      method Main(){
           var s := new LimitedStack;
           s.Init(3);

           s.Push(27);
           var e := s.Pop();
           s.Push(5);

           s.Push(32);
           s.Push(9);
           var e2 := s.Pop();
           
           s.Push(e2);
           s.Push2(99);

           var e3 := s.Peek();
       }

}

