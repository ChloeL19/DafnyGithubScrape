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
      modifies this;
      requires c > 0
      ensures Valid() && Empty() && c == capacity
      ensures fresh(arr); // ensures arr is a newly created object.
      // Additional post-condition to be given here!
      {/* TODO */ }


      
      method isEmpty() returns (res : bool)
      ensures res == Empty()
      {/* TODO */ }



      // Returns the top element of the stack, without removing it.
      method Peek() returns (elem : int) 
      requires Valid() && !Empty()
      ensures elem == arr[top]
      {/* TODO */ }



      // Pushed an element to the top of a (non full) stack. 
      method Push(elem : int)
      modifies this`top, this.arr 
      requires Valid()
      requires !Full() 
      ensures Valid() && top == old(top) + 1 && arr[top] == elem
      ensures !old(Empty()) ==> forall i : int :: 0 <= i <= old(top)  ==> arr[i] == old(arr[i]);
      {/* TODO */ }

      // Pops the top element off the stack.

      method Pop() returns (elem : int)
      modifies   this`top
      requires Valid() && !Empty()  
      ensures Valid()  && top == old(top) - 1 
      ensures elem == arr[old(top)] 
      {/* TODO */ }

 
      method Shift()
      requires Valid() && !Empty();
      ensures Valid();
      ensures forall i : int :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1]);
      ensures top == old(top) - 1;
      modifies this.arr, this`top;
      {/* TODO */ }

 
      //Push onto full stack, oldest element is discarded.
      method Push2(elem : int)
      modifies this.arr, this`top
      requires Valid()
      ensures Valid() && !Empty() 
      ensures arr[top] == elem
      ensures old(!Full()) ==> top == old(top) + 1 && old(Full()) ==> top == old(top)
      ensures ((old(Full()) ==> arr[capacity - 1] == elem)  && (old(!Full()) ==> (top == old(top) + 1 && arr[top] == elem) ))
      ensures old(Full()) ==> forall i : int :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1]);
      {/* TODO */ }
 

 

// When you are finished,  all the below assertions should be provable. 
// Feel free to add extra ones as well.
      method Main(){/* TODO */ }

}

