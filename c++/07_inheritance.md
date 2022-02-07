# Object oriented programming

- `Is a`: with a `public` inheritance

  ```c++
  struct Dog : public Animal{
      //class stuff
  }
  ```

  In this example Dog is an Animal. Dog can only access the `public` elements of Animal, Animal is the **parent** or **super** class, Dog is the **children** or **derived** class.

- `Has a`: define a class and inside another object you use it

- `Use a`: with a `private` or `protected` keywords.

You have to think about the interface, for example if you want to implement a program to handle with people in a activity you can think about a class Person, with derived classes for each Job, but then you're not able to change the nature of one of them if they change Job, so maybe it's better a class Activity that is implemented with `has a`.

### Protected

`protected` from outside is like `private`, but **children** classes have access to `protected` data. Using `private` or `protected` is an implementation detail that the end-user doesn't see.

### Constructor for derived classes

You have always to call the constructor for the parent class first, because it's the first one appearing in the class definition.

## Polymorphism

```c++
// run-time (dynamic) polymorphism
void print_animal(const Animal& a) noexcept {
  std::cout << "through ref\n";
  a.info();
  a.speak();
}

// compile-time (static) polymorphism
template <class T>
void print_animal_template(const T& a) noexcept {
  std::cout << "through template\n";
  a.info();
  a.speak();
}
```

In the first case I can use it whit any Animal class and also every **children** classes, but you have to pass the variable by **pointer** or by **reference**, not by value.

## Virtual

Function that should be implemented by the children have to use the keyword `virtual` in the parent class:

```c++
struct Animal {
  unsigned int age;
  double weight;

  Animal(const unsigned int a, const double w) : age{a}, weight{w} {
    AP_ERROR(!(weight < 0)) << "invalid weight!\n";
  }

  Animal() : Animal{0, 0} {}  // delegating constructor

  virtual void speak() const = 0;  // pure virtual function ==> abstract class
  virtual void info() const noexcept {
    std::cout << "age:\t" << age << '\n' << "weight:\t" << weight << '\n';
  }

  virtual ~Animal() {}  // why? see file 03_virtual_destructor.cc
};
```

In the example Animal is an abstract class, with at least one pure virtual function (speak in this case). If you inherit from the Animal class and you forget to create a speak function you obtain a compiler error, so it's a way to specify what is needed in any children class that you want to build.

In this way the polymorphism works as expected for children classes. The code will do a **dynamic binding** of the Animal speak() function, allowing a correct run-time polymorphism. 

If a function is called many many times in your code you don't want to have it virtual because it will add a lot of jumps in the memory and this is computationally expensive.

Since C++11 in your children class you have to override the virtual class by using:

```c++
void info() const noexcept override {
	// function code
}
```

## Virtual destructor

If you know that a class will be inherited make the destructor virtual, you will have penalty for calling a destructor, but you will avoid memory leaks, because destructing a pointer to the base class without a virtual destructor doesn't destroy derived classes that can exist, implying memory leaks.

- Semiregular
- Regular: ==, != defined
- Totally ordered -> >,<,>=,<= defined

## Code organization

- headers in a folder
- .cc files in a src folder
- main in the main folder
- doxygen for documentation
- Makefile to compile all the files needed properly