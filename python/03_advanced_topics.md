# Advanced Topics



## Decorators

A decorator is a function that take as argument another function to be decorated. It defines an inner function that has to take the same arguments of the decorated one.

```python
def decorate1(func):
    def inner():
        print("apply decorate1")
        func() #non local variable
    return inner

def hello():
    print("hello, world!")

hello = decorate1(hello)
hello()
```

or you can apply the decoration using:

```python
@decorate1
def hello():
    print("hello, world!")
```

If you have more decorators the first one written in the code is the one more external:

```python
@decorate1
@decorate2
def hello12():
    print("hello, world!")
hello12() 
#same as hello12 = decorate1(decorate2(hello12))
```

I can have functions to decorate that take arguments, in this case I can simply use `decorated(*args,**kw)` in order to have the generic arguments taken (remember that they can be also empty lists of arguments).

### Parametrized decorator

It's a decorator that can accept arguments:

```python
@functools.lru_cache() #we're using standard argument
```

This one create a dictionary with as key arguments with which you called the decorated version and as value the function returned value, in order to avoid to do the same computation with the same arguments.

```python
def parametrized_time_this(check=True):
    def decorator(func):
        def decorated(*arg,**kw):
            #stuff happening
        return func
    return decorated
return decorator

@parametrized_time_this(False) #use custom argument
```

If no argument is invoked the standard one will be used.

### Decorator as function objects

A decorator can also be a class. The usage is then the same. It can be also parametrized but the parameter is inside the `__init__` constructor.

## Property

There are situations in which you'd like to have read only variables.

```python
class Point():
    def __init__(self, x,y):
        self._x = x
        self._y = y
        
    @property
    def x(self):
        return self._x

    @property
    def y(self):
        return self._y
```

this is the way to set a variable to a constant value.

```python
@var_name.setter
```

allows you to perform an automatic check every time that you want to modify `var_name` (protected by `@property` decorator), for example giving an error if the modified variable is not anymore in a physical range. You can find these information using `help(property)`.

It's common practice to put a double underscore in front of a variable that you want to keep private.

```python
self.__month
```

Python will change automatically the name in:

```python
self._ClassName__month
```

so technically the variable it's still public, but only with a different name.

## Error Handling

### Handling Exceptions

```python
try:
	#stuff
except(ErrorNames) as err:
    #stuff
#... other excepts
finally: 
    # should be at the end of try statement
    # useful to make sure all resources are released
    # even if an exception occurs
    # even if no exception was caught
```

### Assert

It's a condition to verify validity of a statement. In case an error is generated you can `raise` an error.

## Inheritance

```python
class Dog(Animal)
```

The class name in the parentheses is inheritated from the new one defined.

```python
super().method(args)
```

will call the method `method()` from the parent class.

If you want to know what is it the `super()` in case of multiple inheritances you can use the method resolution order:

```python
print (E.__mro__)
```

If you need to check the type use `isinstance` and `issubclass` instead of the `type(x) == type(y)` operation.

### Abstract classes

Require `import abc`.

It can be used by defining

```python
class Animal(abc.ABC): # Python > 3.4
        def __init__(self,age,name):
        self.age = age
        self.name = name
    @abc.abstractmethod #abc decoration
    def speak(self): pass
```

and then can be used to inherit:

```python
class Dog(Animal):
    def speak(self):
        print("Bau")
```

## Generators

### Iterables and iterators

It's a class that has to have methods `__iter__` and `__next__` defined.
When an iterator is over is over. Calling again a loop will have no effect. You have to repeat every time the object definition. If you have `__getitem__` method you don't need the `__next__` one.

### Generators

`yield` keyword to save the value, using a generator, for the next usage.

`range(n)` is an example of generator. They're not storing the numbers that are used, only the single value used in the specific moment. They can be invoked using `()` parentheses:

```python
for i in (n for n in range(10) if n%2 == 0):
    print(i)
```

## Context Manager

```python
with open("new_file.txt",'w') as f: #'r' to read
    for i in range(10):
        print(i,file=f)
```

This is an example of context manager. Variables don't go out of scope exiting the context manager. `with` is the keyword to enter in a context manager.

At the beginning `__enter__` is executed. When the indentation stops `__exit__` is called.

## Unit-testing

- `unittest`
- `if __name__ == '__main__':`
- `__all__`