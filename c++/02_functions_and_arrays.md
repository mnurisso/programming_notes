## Arrays

Contiguous portion of memory, where each cell has the same type of the others.

```c++
int a[4]; 	// integer array of length 4
a[2] = 9; 	// set 3rd element to 9
```

In C and C++ the index starts from 0.

```c++
for (std::size_t k{0}; k < 4; ++k)	//std::size_t type
    std::cout << "ai[" << k << "] = " << ai[k] << '\n';
```

We use `std::size_t` to avoid overflow or similar errors. It helps to document what you're doing. In this case `std::size_t` is an alias for `long long unsigned int`.

The syntax to define elements of an array is:

```c++
double ad[7]{1.1, 2.2, 3.3};  // the rest is set to 0
```

An array is implicitly converted to a pointer to its first element:

```c++
*ad = 9.9;	// set the first element to 9.9
```

Arrays are passed to function trough the pointer method so that their values can be modified by functions.

```c++
void surprise(double a[], const std::size_t n)
```

### Dynamic arrays

Usually the array size must be known when you define the array.

```c++
int* da{new int[n]};  // allocated on the HEAP, or free-store
```

It allocates an array of this size without the need to know the length at compiler time.

```c++
delete[] da;
```

The portion of  memory should be deleted manually at the end of the scope. Another good motivation of using heap is that usually the stack is a very small part of the memory and so it's easy to incur in stack overflow.

This objects living in the heap have no name, they're simply a pointer to the portion of memory.

## Valgrind

Allow to check if your code has some part of the heap memory that it's not deallocated at the end of the job.

```bash
valgrind ./a.out
```