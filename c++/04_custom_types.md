# Custom types

**Type** is a particular implementation of a concept.

## Enum

Available also in C.

```c++
enum color {red, yellow, green};
enum color {red=0, yellow=1, green=2}; // equivalent
```

 Do not use magic numbers in the code because they're not bug-proof. Enum is a way to have different values with meaningful names. They're technically integers and I can, if I need it, define it with custom numbers.

```c++
color opt{red};
```

I cannot initialize a color with a number, I have to use the name given in the `enum` definition.

```c++
color(2)
```

Explicitly convert an integer to a color type.

## Switch

```c++
switch (c) {
    case red:
      std::cout << "option 1: red\n";
      break;
    case yellow:
      std::cout << "option 2: yellow\n";
      break;
    case green:
      std::cout << "option 3: green\n";
      break;
    default:
      std::cout << "unknown option\n";
      break;
 }
```

## Scoped enum

Introduced in C++11.

```c++
enum class color {red, yellow, green};
enum class color {red=0, yellow=1, green=2}; // equivalent

color opt{color::red};
```

Differently from before they don't implicitly convert to integers. They can be converted only with a static cast by brute force.

## Namespace

```c++
namespace namespace_name{
	// whatever defined here got a full name namespace_name::object
    int variable;
}
[...]
namespace_name::variable = 4;
```

Utility to group functions, variables, etc... related to something. It's useful to avoid name clashing with functions or variables. They can be nested:

```c++
choose_a_name::nested::hello1();
```

When I need to use them I can use the fully qualifying name or I can enter in the specific namespace before defining the function:

```c++
namespace choose_a_name {
  namespace nested {
    void hello2() {
      std::cout << "hello2 from nested\n"
                << "variable is " << variable << std::endl;
    }
  }  // namespace nested
}  // namespace choose_a_name
```

I can also import a `namespace` by using:

```c++
using namespace choose_a_name;
```

Use it only in single source files and not in header files to avoid name clashing. If you want to import single shortcut for some function in a namespace:

```c++
using std::cout;
```

## Struct

In C++ in classes you can put data and functions, in structure in C only data. The` struct` keyword in C++ has the same meaning of class. The only difference is the visibility of the class. In structures everything is public, instead in classes the standard visibility is private.

```c++
struct Point_s {
  double x;
  double y;
  void print();
};  // note ; at the end

void Point_s::print() {
  std::cout << "Structure. x = " << x << "; y = " << y << std::endl;
} // x and y name must be the same as the struct definition
```

The functions defined in a structure got a fully qualified name.

## Class

Same as structure but the standard visibility is private.

```c++
class Point_c {
  double x;
  double y;

 public:
  void print() {
    std::cout << "Class. x = " << x << "; y = " << y << std::endl;
  }  // note no ; at the end
};   // note ; at the end
```

If I try to access, for example to modify, a data or a function not public I obtain a compiler error:

```c++
Point_c pc;
pc.x =7.6;   // error
pc.print();  // I can access private data through public functions
```

I can have also pointer to a class or a structure:

```c++
Point_s* p = &ps;
p->x = 0.0;  // how to assign value through a pointer
p->print();
```

I can also have a reference to a class or structure, and `auto` works:

```c++
auto& pr = ps;
```

You can create array, std::array or std::vector of classes.

## Constructor and Destructor

Inside classes I have to use a destructor when a variable goes out of scope in order to avoid memory leaks.

`new` call the destructor when you use `delete` instead in C `malloc` doesn't call any destructor when you use `free`. Don't mix the two methods. You can have many constructors, but only one destructor.

```c++
struct Foo {
  int _i;
  double _d;
  std::string _s;

  Foo(const int i, const double d,
      const std::string& s);  // custom constructor

  Foo();  // default constructor

  ~Foo();  // destructor
};
```

The destructor is automatically called when the variable goes out of scope, never call the destructor explicitly.  The destructor works from bottom to top, the opposite of the constructor calls. In the example I have two way to define the Foo structure:

```c++
Foo::Foo(const int i, const double d, const std::string& s)
    : _i{i}, // assign values to class variables
      _d{d}, // you have to use the universal declaration
      _s{s}  // you have to maintain the same order of declaration
{ // class variables here are already constructed
  std::cout << "custom ctor\n";
}

Foo::Foo() {
  std::cout << "default ctor\n";
}

Foo::~Foo() {
  std::cout << "dtor\n";
}
```

Constructor doesn't have a returned type and they've another region in which is possible to define operations. In this region variables are not constructed yet and you can assign value from the function variables to the class variables. I should prefer this way of coding because it's faster.

When I want to define a structure using one of his constructor I have to put in the exact order the variables of the chosen constructor.

```c++
Foo f0{8, 2.2, "hello"};
```

Sometimes it works also `Foo f0(8, 2.2, "hello");`, but the other one is universal.

## Overload

```c++
std::ostream& operator<<(std::ostream& os, const Foo& f) {
  os << f._i << " " << f._d << " " << f._s << std::endl;
  return os;
}
```

Replace the operator `<<` in the `std` namespace with the defined function.

With pointers the operator overloading can be tricky:

```c++
(*pv)[0] = -99.999; // first dereference the pointer, then I can use the defined operators
pv->operator[](1) = 77777.3333;  // or I call the function by name
```



## Template class

```c++
template <typename num>
class Vector {
  num* elem;
  std::size_t _size;

 public:
  Vector(const std::size_t size) : elem{new num[size]}, _size{size} {}

  // automatically release the acquired memory
  ~Vector() { delete[] elem; }

  std::size_t size() const { return _size; }

  num& operator[](const std::size_t i) { return elem[i]; }

  const num& operator[](const std::size_t i) const { return elem[i]; }
};
```

This way of building the constructor is called RAII (Resource Acquisition Is Initialization) and it's a good strategy, together with the destructor, to avoid memory leaks.