# C++ Standard (Template) Library

## Concurrency 

Concurrency library is the one for multi-threading, with a unique interface since C++11. Having two function independent you can use:

```c++
# include <thread>
int main () {
	// f and g are independent
	std :: thread t { f }; /* is an object the thread */
	g () ; /* this is running in the main thread */
	t . join () ;
}
```

`async` postpone the execution of the function `f` to when is really needed in the code.

```c++
# include < future >
int main () {
	// f and g are independent
	auto from_f = std :: async ( f ) ;
	auto from_g = g () ;
	...
	complicated ( from_g , from_f . get () ) ;
}
```

## Containers 

A container holds a sequence of objects:

- **sequence** containers: sequence of elements
- **associative** containers: based on a key

Can also be:

- **ordered**
- **unordered**

### Associative

- K is a key

- V is a value

- C is the type of comparison

- A **allocator** type for uninitialised memory
  Using `malloc` you don't call the constructor, while instead `new` call the constructor for the object that you're allocating memory for.
  
  ```c++
  /* placement new */
  new(p) T{};
  
  /* will return a pointer, no ctor involved */
  auto p = static_cast<T*> malloc(7*sizeof(T));
  
  /* call the destructor */
  p->~T();
  
  /* deallocate without dtor */
  free(p);
  ```
  
  

- Built-in Array

- Vector, has a pointer and a free space in the end

- Forward list is a single linked list

- List is a double linked list

- Map is a binary tree (red black tree), every node has a left and right pointers

  ```c++
  std :: map < std :: string , int > words ;
  
  /* map elements are stored in a pair, first K, second V */
  words.first;
  words.second;
  ```

  ex: map with the words and how many times they appear.

- Unordered map: has an hash table: array of pointers, there is an hash function returning the index in the hash table.

I have different containers for performance reasons. For example to access an element of an array as a constant time cost, in a map is O(log(n)).

## Iterators

Provide a way to access the elements of an aggregate object sequentially
without exposing its underlying representation. It's a generalisation of pointers.

```c++
while (first != last)
```

Iterators:

- Input
- Forward
- Bidirectional
- Random-access

## Algorithms

They work accepting operators. They operate on sequences accepting a pair of iterators as input and having a single iterator as output:

```c++
std::copy (v1 .begin(), v1. end(), v2. begin());
```

They can accept also functions or function objects to specify selection criteria or similar stuff.

If there was a failure in the algorithm the last element is returned, so that the user can check if the algorithm had success.

## Function objects

They are empty classes that can accept comparison criteria.

```c++
std::sort (v1. begin() ,v1 .end(), std::greater <double>{});
```

