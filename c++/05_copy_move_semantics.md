# Copy and Move semantic

Move semantic has been introduced in C++11. Defining a **struct** or **class** without specifying constructor, copy ctor, move ctor, copy assignment, move assignment will let the compiler write them for you automatically.

## Aggregate initialization 

Without constructor I can initialize a struct putting the variable in the same order as how they're defined in the struct (or class). They're big differences of behavior between different version of C++.

```c++
S s1{1, 2.3, "alberto"};
```

Default constructor:

```c++
S s2;
```

In this case bult-in type are randomly initialized, instead custom types (like` std::string`), are initialized using the standard constructor of their class. If a value is assigned inside (**in-class initialization** `int a = 5;`) the class, this is given to the variable with both methods.

Or I can also call {} for each member `S s3 { {}, {}, {} };`:

```c++
S s3{}; 
```

In this case everything is initialized with the default constructor or for built-in type set up to 0.

## Loop over a container 

In order to use the syntax:

```c++
for (const auto x : v1)
// the same as:
auto it = v1.begin();
auto stop = v1.end();
for(; it != stop; ++it){
    const auto x = *it;
}
```

for a container you need to have defined in your class two function `begin()` and `end()` defining how to find the begin and the end of the container.

## Default copy constructor

The default copy constructor does a **copy by value**. This can be problematic when we're working with classes with containers, because changing an element copied by value will change the element also in the original container copied and vice versa.

## Explicit keyword

If I want to avoid implicit conversion in the constructor when I call it with wrong arguments I can put the explicit keyword:

```c++
explicit Vector(const std::size_t length)
```

## Smart Pointers

`unique_ptr` means that I'm the only one that own an array.

```c++
#include <memory>

std::unique_ptr<T[]> elem;
```

This for example doesn't allow to define a default copy ctor because you're calling a deleted function.

## Move

Useful when you need to move variables because it's more efficient wrt to copy the value in a new variable.

## Arg value reference

```c++
void insert(value_type&& v, const Insertion_method m);
v.insert(std::vector<int>(7),push_back);
```

The `&&` is used when you're trying to call a function with an argument that is supposed to be destroyed at the end of the statement (called **r-value**, instead is called **l-value**). You should use the move semantic to use efficiently this method.