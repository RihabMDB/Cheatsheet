
# C++ cheatsheet


There are currently two strategies for structuring multiple pages in one repository.


##  Data Type

- String
  - check if element exist in the string : if (**s.find**(c) != std::string::npos)
  - empty() => Returns true if nothing is in the string, false otherwise.
  - length() Returns the number of chars in the string. Same as size().
  - at(int pos) => Returns the char at position pos. Same functionality as using [pos] notation.
  - c_str() => Returns a char array representing the string with a null terminator at the end.
  - compare(string s) => Compares the string to s, returns 0 if the string and s are equal.
  - compare(int start,int numChars, string s) => Compares numChars chars starting at position start to string s.
  - erase(int start) => Erases all chars to the right of the starting position start.
  - erase(int start, int numChars) : Erases numChars number of chars beginning at position start.
  - append(string s, int start, int numChars) = Appends numChars chars from s to the string, beginning at slot start in s.
  - resize(int size) => Resizes the string so it can hold additional characters.
  - substr(int start, int numChars) => Return a substring starting at slot start with numChars chars.
  - find(string s=) Returns the position of the first occurrence of s (starting at position 0 or start) or string::npos if the string is not found.
  - find(string s, int start)
  - rfind(string s)
  - rfind(string s, int start) => Reverse find starts searching at back of string.
  - find_first_of(string s) => Returns the first (or last) occurrence of any char in s or string::npos if none of the chars could be found.
  - find_first_of(string s, int start) => The parameter start can be used to start the search at that position.
  - find_last_of(string s)
  - find_last_of(string s, int start)
  - find_first_not_of(string s) Returns first (or last) occurrence of any char not in s or string::npos if at least one of the chars in s could be found in every position of the string.
  - find_last_not_of(string s)
  - replace(int start, int numChars, string s) => Replaces numChars chars starting at position start with s.
  - insert(int start, string s) => Inserts s at position start in the string.
  - swap(string s) Swaps string s with the string. Exp : string a = “one”, b = “two”; a.swap(b); // a = “two”, b = “one”
         
- unordred_set
  - insert(value) => inserts an element to the unordered set 
  - count(value) => returns 1 if the specified value exists and 0 if it doesn't 
  - find(value) => returns the iterator to the element with the specified value 
  - size() => returns the number of unique elements 
  - empty() => returns true if the unordered set is empty 
  - erase(value) => removes elements with the specified value 
  - clear() => removes all elements 
        
  - loop : for(auto &c: set)

- Unordred Map :
        
        `unordered_map<string, int> umap;`
        
        - find(key) If the given key exists in unordered_map it returns an iterator to that element otherwise it returns the end of the map iterator.
- Map
        
        The map is an ordered sequence of unique keys
        
- Vector
  - syntax : vector<type> name {val1 , val2..};`
  - Vector is a sequential container to store elements and not index based.
  - vecOfNumbers.insert (vecOfNumbers.begin(), value); :  Add element at beginning of vector
  - .size() : Returns the number of elements present.
  - .push_back() to add an element to the “end” of a vector
  - .pop_back() to remove an element from the “end” of a vector
  - begin(): Returns an iterator to the first element.
  - end()
  - Returns an iterator to the theoretical element after the last element
  - empty() : Returns true if the vector is empty, false otherwise.
  - at() : Return the element at a particular position.
  - assign() : Assign a new value to the vector elements. syntax : v.assign(pos, val);
  - push_back() : Adds an element to the back of the vector.
  - insert() Insert an element at the specified position. syntax : v.insert(position, val)
  - erase() : Delete the elements at a specified position or range.
  - clear() : Removes all elements.
  - count(v.begin(), v.end(), elt) : count the occurence of elt in a list
  
## Conditional statement
- if
        
       
        if (x == 7) { trait} 
        else { trait}
        
- switch
        
        switch (x) {
        case 1: temp = 1;
                     break;
        default:
                   temp = 3;
                   break;
        }
        
- Conditional Expression
        
        ```cpp
        ( condition ) ? expressionIfTrue : expressionIfFalse;
        ```
        
- while
        
        while ( condition ) {
        //body
        }
        
- do while
        
        do {
            //body
        } while (condition);
        
        
- loop
        
        for (expression for initialization ; expression for testing ; expression for updating) {
                        //body
        }
  
        
## Function
- main :
        
        > int main(int argc, char * const argv[])
        > 
        
        ⇒ allow input from the command line
        
        Exp : ./hello.exe 11
        
        argc = 2 
        
        argv = { hello.exe , “11”}
        
- Passing Parameters
        - pass by value : value of the variable is passed, not the variable itself. : fn(int arg1)
            
            a copy of the data is made and passed to the function.
            
            void interchange(int arg1, int arg2)
            
            intercharnge (n1, n2)
            
        - pass by reference fn(int& arg2) : the *address* of the object itself is passed to the function ⇒ direct access to the variable address
            
            void interchange(int& arg1, int& arg2)
            
            intercharnge (n1, n2)



## Pointer
    
is a variable that stores the memory address of an object.
    
- The **memory address**, which is the value of the pointer itself.
- The **data type** of the variable pointed to
- **&** It is used to get the address of a variable
- Example 
    ```cpp
    int* p = nullptr; // declare pointer and initialize it
    // so that it doesn't store a random address
    int i = 5;
    p = &i; // assign pointer to address of object
    int j = *p; // dereference p to retrieve the value at its address
    ```
    
- **owning pointer** (or a copy of it) must be used to explicitly free the heap-allocated object when it's no longer needed.
- Memory allocated using **new** must be freed by using **delete**
- Const pointer
    ```cpp
    <type of pointer> *const <name of pointer>;
    int *const ptr;
    ```
    
- Pointer to Constant
    ```cpp
    const <type of pointer>* <name of pointer> 
    const int* ptr;
    ```
    
- Constant Pointer to a Constant  
    ```cpp
    const <type of pointer>* const <name of the pointer>;
    const int* const ptr;
    ```
    
- Pointer to Pointer  
    ```cpp
    int **p; // p is a reference to another pointer
    ```
  - Exp :
    ```cpp
    int *p;
    int **p;
    *p = &a ;
    **q = &p;
    *q = &b // here *q means p so p = &b
    ```
    
- Pointer to a function
    ```cpp
    functiontype (pointer to function)(datatype);
    void (*fp)(); //fp is a pointer to a function taking zero arguments and that returns void
    
    fp = &fname;  /*to initialize a function pointer we Next, you have to write the printBoard function. In it, you have to do the following:
                    Pass the appropriate parameters to it
                    Initialize the board to store the value 1 at every index in the board.
                    Display your resulting board.give it the address of the function foobar */
     
       /* Now we call fp that contains the address of the function fname()*/
       fp();
    ```
- Pointer to String :
  - *( s + i ) = s[i] = i[s]
  - *( s ) = s[0]
  - *( s ) + i = print the ASCII + i 

## Memory Managment
- Dynamix Memory Allocation
    - new VS malloc :
        -  Reallocation of memory not handled by new while malloc() can
        - calls constructor	| does not calls constructors
        - It is an operator	| It is a function
        - Returns exact data type	| Returns void *
        - on failure, Throws bad_alloc exception  | 	On failure, returns NULL
        - size is calculated by compiler |	size is calculated manually
        - 
  - delete VS free()
  - delete 
      - It is an operator.
      - It de-allocates the memory dynamically.
      - It should only be used for deallocating the memory allocated either using the new operator or for a NULL pointer.
      - This operator calls the destructor before it destroys the allocated memory.
      - It is comparatively solwer because it invokes the destructor for the object being deleted before deallocating the memory.
  - free()
      - It is a library function.
      - It destroys the memory at runtime.
      - It should only be used for deallocating the memory allocated either using malloc(), calloc(), realloc() or for a NULL pointer.
      - This function only frees the memory from the heap. It does not call the destructor.
      - It is faster than delete operator.
 
## Array
    - An array is a collection of similar data types under the same name.
    - dataType arrayName[arraySize];
    - arr[0] we are referring to the location of the first element.
    
## POO
- Class
        
        ```cpp
        class DayOfYear {
        public:
        DayOfYear(int new_month, int new_day); //declaring constructor
        void output(); //member function
        int month;
        int day;
        };
        ```
        
        Getters and Setters 
        
        ```cpp
        void set(int new_month, int new_day);
        int get_month( );
        ```
        
        ```
        //defining constructor
        DayOfYear::DayOfYear(int new_month, int new_day){ //class name and constructor name are same
          month = new_month;
          day = new_day;
        }
        ```
        
- Inheritance
        
        
        class Student{ //base class
        //body
        };
        
        
        class UnderGrad : public Student{  //derived class
        //body
        };
        

# Threading
Multithreading means two or more threads running concurrently where each thread is handling a different task
- inlude pthread.h
- pthread_create(&thread, thread_attr, &fnc, params_to_fnc);() : creates a new thread
- pthread_join(thread) : ask parent thread to wait the child thread (to ensure that a thread has been terminated)
- pthread_detach() : child thread run independently from parent thread (cannot wait for other threads). 
- pthread_move() : copie thread in another object. exp : t2 = move(t1) !!! it's not able to do : t2 = t1 => compilation error
- pthread_joinable(): check whether a thread can be joined
- pthread_exit(): terminate any thread. exp : exit(EXIT_SUCCESS)
- get_id() : return the thread id ( put it before join() ) exp : t1.get_id() OR thread::id t1_id = t1.get_id();
- ## Sharing data 
    - ### Mutex :
      A Mutex is a lock that we set before using a shared resource and release after using it.
      When the lock is set, no other thread can access the locked region of code.
      - pthread_mutex_t lock;
      - pthread_mutex_lock(&lock);
      - pthread_mutex_unlock(&lock);
      - pthread_mutex_destroy(&lock);

        
    - ### Future 


# Resources
- [http://whatismarkdown.com/](http://whatismarkdown.com/)
- [Markdown: A MacSparky Field Guide](http://macsparky.com/markdown/)
