## Auto keyword

```c++
auto b = true;
```

Automatically deduce which type of variable to assign. There is some suffix to suggest to the auto keyword which type use.

```c++
auto u1 = 0u  // unsigned
auto u2 = 0lu // long unsigned
```

When you use auto keyword **don't** use the declaration with curly brackets.

If I want to know the type assigned by the auto keyword I can force a compiler error to see what type has been assigned to a specific variable.

```c++
template <class T>
void Debug(T);
```

By not defining the function the compiler will show me an error with the type specified.

From **C++14** you can also use auto as keyword for type returned from functions.

```c++
#if __cplusplus > 201103L // preprocessor level
```

Macro to check if the version is newer than C++11.

## Const keyword

Const is useful to check if a variable is changing but also to improve performances.

```c++
const int* pc{&a}; // cannot change a value
int* const cp{&a}; // cannot change the value of the pointer itself
const int* const cpc{&a}; // everything is constant
```

Read from right to left to understand what is constant. The last is the a good candidate for **sentinel** approach, for example to check if I'm reading or writing a part of an array that is not supposed to be used in my code.

```c++
char const a{};
const char b{};
```

are the same, const refers to what there is on the left unless nothing is there.

## Special pointers

```c++
int* ap[7]; 	// array pointers to integer values 
void* pv{pi} 	// no pointer arithmetics, I don't know the size
```

If I want to use a void pointer I need to use a cast:

```c++
int* pi2{static_cast<int*>(pv)};	// not possible with only C
double* a = (double *) malloc (...) // C-style cast 
```

The **static cast** is a cast done at compiler time. In general a **cast** is a generic conversion between types.

### Null pointers

```c++
pi = nullptr; 	// points to nothing
pi2 = 0; 		// C-style, confusion between null pointers and integer
```

Do not mix NULL and null pointers.

A pointer is true when is not a null pointer.

```c++
if(pi) // false if pi = nullptr;
```

### Pointer to function

```c++
int (*fp)(const char*); // types taken and returned are called signature
fp = func1;
fp = &func2; // the two syntax are the same
// where
int func1(const char* a);
```

Pointer named fp to function taking const char as argument.

```c++
auto xx = func3; 	// automatically define the correct signature
decltype(&func3) x = func3;	// create variable x to whatever is the pointer to 								// func3
```

## Command line arguments

```c++
int main(int argc, char* argv[])
```

Allow to run the executable with arguments in the command line

```bash
./executable,x argument1 argument2
```

The second one is an array of char, the first one in the example is an argument counter.

They're always both needed when you want to use command line arguments.

## Matrices

A matrix is stored in a long array.

```c++
int ma[6][5]; // stored in an array of lenght 30 
```

If you want to pass it to a function the number of columns should be known already in the prototype.

```c++
void print_ma(int m[][5], int dim1);
```

The only solution is to pass the pointer and the number of rows and columns:

```c++
void print_ma(int* p, int row, int col);
```

If you want to allocate memory for a matrix:

```c++
int* d_ma = new int[6 * 5]{};
```

## Std Arrays

From C++11

```c++
std::array<int, 4> a{1, 2, 3, 4};
std::array<int, 4> b{a}; 			// copy a element-wise
```

```c++
for (auto x : a) // automatic loop over element in a, don't need to specify the 				 // size
```

```c++
for (auto x : a) // print elements on a
  std::cout << x << " ";
std::cout << std::endl;
```

If in a loop I want to modify the array elements:

```c++
for (auto& x : a)
	x *= 10;
```

```c++
a.size()	// array size
for (auto i = 0u; i < a.size(); ++i)
```

Bound check:

```c++
a.at(90);  // bound checking at run-time
```

## Std vector

Needed if I don't know the size at compiler time or if the stack is not enough to contain the array that I need.

```c++
#include <vector>
```

Declaration:

```c++
std::vector<int> v0{1, 2, 4}; 	// define every vector element
std::vector<int> v1(4, 4);		// define vector of length 4, every element is 4
```

std::vector stores an array on the **heap**.

```c++
v1 = v0; // you can copy element-wise
```

After the copy the length will be adapted to the new required one.

The vector can be expanded dynamically:

```c++
for (auto x : {7, 8, 9})
	v1.push_back(x);
```

Subscripting operator still work:

```c++
v1[0] = 2;
```

Also std::vector can be passed by reference:

```c++
void print_vector(const std::vector<T>& v, const std::string& s);
```

