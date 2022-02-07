# Variables and Functions

## Modules

Modules are simply .py files with some python code.

```python
import my_module
my_module.foo()
my_module.bar()
```

to import a .py file from the same folder. I have to use the filename to call functions from the file.

If I want to import just something from a module, like only a function:

```python
from my_module import foo
foo()
```

in this case I don't need to call the filename.

If I want to import a module with an alias name:

```python
import my_module as mm
mm.foo()
```

If I want to import a full module but I don't want alias or the filename:

```python
from my_module import *
foo()
```

More modules located in non-standard paths can be added through the `PYTHONPATH` environmental variable.

## Packages

They contains at least one module. You cannot import a full package but you have to import sub-modules.

A `__pycache__` with a compiled version of the module is created the first time for optimisation.

```python
import my_package.foo_module # import submodule
import my_package.bar_module
my_package.foo_module.foo()
my_package.bar_module.bar()
```

If you want to import everything from a package:

```python
from my_package import *
foo_module.foo()
bar_module.bar()
```

## Functions

Functions are first-class objects. They can be assigned to a variable:

```python
def hello():
    print("hello")
    
a = hello
a()
```

The arguments name in functions can be passed as keywords so that you don't have to remember the order (they're stored in a dictionary, instead the positional one are stored in a tuple):

```python
def abc(a,b,c):
    for i in ('a','b','c'):
        print(i,"got",eval(i))

abc(b = 'to_b', c = 'to_c', a = 'to_a')
```

If you want to force the user to use only keywords arguments:

```python
def abc_keyword_only(*,a,b,c):
```

#### Documentation (and huge comments)

```python
def foo():
    '''
    string documenting foo(). 
    accessible via help(foo)
    '''
    pass #needed to define an empty function
```

Can be accessed using `help(foo)`

## Global and local variables

Defining normally a variable like `b=9` create a global variable that can be accessed also inside functions. If you define a variable inside a function this is considered a local variable so if you try to use before the definition the global version you will get an error. If you want to use the global one you have to use the keyword `global`: `global b # <----`

## Free Variables

```python
def maker():
    so_far=[]
    def avg(new_value):
        so_far.append(new_value)
        return sum(so_far)/len(so_far)
    return avg 
```

Free variables are defined the first time, when maker is invoked, but the sticky note on avg and on so_far is created.

The keyword `nonlocal` is used to specify when you want to use a variable inside a function as a free variable. In the example list are always mutable so there is no ambiguity, if you try to do the same with a float value and without the keyword you will get an error.

## Closure 

A closure is a function that retains the bindings of the free variables that exist when the function is defined, so that they can be used later when the function is invoked and the **defining scope** is no longer available.

## Copy Deepcopy

Python try always to do the cheapest operation possible.

`o = l` give the same adress to the variables. Even with the `copy` module python is copying the pointer because it's the cheapest operations.

With ` deepcopy` you're finally able to create the independt objects.

## Bugs

If you want to put something that can be empty use the `None` keyword to avoid to use by mistake the same object in different situations.

## Class

```python
class Point():
    def __init__(self, x, y): #constructor
        self.x = x
        self.y = y
        
    def method_with_no_arg(self): # if you remove self --> error
        print("no args!")
    
    def update(self, x, y): # do I really need this?
        self.x = x
        self.y = y
    
    def print(self): # is this pythonic?
        print(self.x, self.y)
        
    def equal(self, other): # is this pythonic?
        return (self.x, self.y) == (other.x, other.y)
```

You have always to put as first argument `self`.

Members of a class are defined inside the constructor (x,y in the example).

Everything is public in python classes.

```python
class Point(): #more pythonic
    '''Documention of class Point'''
    def __init__(self, x,y):
        self.x = x
        self.y = y
            
    def __str__(self):
        #return str((self.x,self.y))
        return 'Point: {0}, {1}'.format(self.x, self.y)
    
    def __eq__(self, other):
        #return self.x == other.x and self.y == other.y
        return (self.x,self.y) == (other.x, other.y)
    
    def __abs__(self):
        '''return absolute value'''
        import math
        return math.hypot(self.x,self.y)
```

