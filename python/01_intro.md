# Python Intro

## Jupyter notebook

It's a tool to create readable documents embedding code, images, comments and formulas.

To open the jupyter notebook interface:

```bash
jupyter notebook
```

You can also open a lab interface for easy debugging in which you can have multiple pages, terminals opened at the same time.

```bash
jupyter-lab
```

To run a cell you need to use `shift+enter`.

### Magic Commands

It has some **magic** command that enable to run different kind of code:

- `%` at the beginning of inline commands
- `%%`at the beginning of multi-line commands

```
%lsmagic
```

to list the magic commands.

If you want to run a `bash` command:

```
%%bash
bash command here
```

To run inline shell commands you can use `!`:

```
!ls | grep ipy
```

### Python compiler

Compile and execute the code on a virtual machine. It survives any execution error, even syntax ones and if a cell is not working you have the problem only in that specific part of the code. An **expression** is a code that returns an object. The cell will automatically print the result on screen and assign the result to the variable `_`.

```
%reset
```

to reset the previously assigned variables.

## Intro

Python works like a sort of virtual machine, there is an interpreter, python itself, that convert the source code into language. In c++ you have to work with stack, heap, while instead in python you don't have to worry about that.

Python can be run from terminal, but the code is deleted when you exit from the program. The easy way is to write a `name.py` file and make it executable with `chmod u+x name.py`.

## Surviving kit

### Print

```python
print("hello world")
```

To know the type of a variable:

```python
print(type("hello"))
```

in python everything is a class, there are not built-in types like in C++.

### Help

Can be used to have documentation about a class in an interactive session.

### Dir

Without any argument it returns all the defined variables plus some other variable of particular methods.

`dir(1)` will return all the defined variables related to the integer. In the integer example we have all the member functions of the integer class. A lot of them are invoked only by an interface, e.g. `__abs__` is called by the interface `abs()`.

### Dynamically typed language

In python variables are simply label and you have to read from left to right. Writing `a=3` in python will create an object with the value `3` with a label referring to its name `a`. If I have already a label python will assign the label to the new object without checking if the object is of the same type of the previous one.

`a is b` will check the identity number with the `id()`.
`a == b` will check the equality referring to the value.

If I'm assigning the same id to two variables they will change together if I act on one of the two. In the example the b printed will contain also the number appended in a.

```python
a = [1,2,3]
b = a
print(a is b)
a.append(5)
print(b)
```



## List 

They're a container **mutable**, resizable, stored objects and they can contain object of different types.

```python
a = [1,2,3]
a = [] 		#define an empty list
a.append(4)
print(a)
```

They can be constructed with the `list` command:

```python
range_list = list(range(10))
string_list = list('hello') #will create array with single letters
```

Range allows you to create a list from any object that can be iterated.

### Slicing

```python
list[start:stop:step]
```

if omitted `start = 0` and `step = 1`, instead if stop is omitted it will work up to the last element included. You can refer to the last element using `-1`.

### Lenght

```python
len(list_name)
```

### Sort and Sorted

```python
sorted(l) #return a new object
sort(l)   #modify the existing object
```

### Delete

 - `del list[idx]` remove element with offset `idx`. `del` is a Python statement
 - `list.pop[idx]` remove element with offset `idx` and return it
 - `list.remove(val)` remove element whose value is val 

## Tuples

Tuples are **immutables**, so that I cannot add, remove or change objects once they're created, but I can slice them. They're faster than lists.

```python
empty_tuple = ()		#empty one
t = tuple(range(10))	#from a range
```

### Tuple Packing and Unpacking

You can build a tuple from existing variables:

```python
a = 'first'
b = 'second'
t = a,b			#it's the tuple definition
f,s = t 		#unpacking the tuple, I can use f,s

t = ('important', 'nothing', 'very important', 'forget it')
imp,_,vip,_ = t #the one with _ are ignored
```

## Dictionaries

 - **unordered** set of pairs `key:value`
 - elements are accessed by `key` and not by offset (like lists and tuples)
 - `key` must be **hashable** (aka immutable) (e.g., boolean, integer, float, tuple, string, **not list**)
 - are mutable, so you can add, delete and change their `key:value` elements
 - highly optimized

```python
empty_dict = {} # or empty_dict = dict()

age_dict = {"Alberto":32,
            "Antonella":21,
            "Stefano": 42,
            "Family": [4,5,32,37]}
```

They can be constructed from list of tuples, 2-element list tuples (the first will be the key, the second the value) and from dictionaries comprehension.

```python
names = ["Alberto", "Antonella", "Stefano", "Family"]
ages = [32,21,42,[4,5,32,37]]
age_dict = {k:v for k,v in zip(names,ages)}
```

An element of the dictionary can be accessed by key and not by some index:

```python
age_dict['Alberto'] += 1
```

A new key can be added with the `[ ]` operator:

```python
age_dict["New key"] = 55
```

And they can be deleted with the `del` statement

```python
del age_dict["Alberto"]
```

## Set

- like `dict`s but without values (they are **unordered**)
- used to know if something exists (is present) **avoiding repetitions**
- optimised for mathematical set operations (union, intersect)

```python
empty_set = set() # no other symbols can be used for an empty set
even_numbers = {0,2,4,6,8,10} # {} can be used if it is not empty
```

### Union

```python
all_numbers = odd_numbers.union(even_numbers)
all_numbers = odd_numbers | even_numbers
```

### Intersection

```python
empty = odd_numbers.intersection(even_numbers)
empty = odd_numbers & even_numbers
```

### Difference

```python
set1-set2 #order matters
```

## Functions

* default argument values can be passed, even unordered, using keyword arguments (named arguments)
* keyword arguments are passed as a dictionary {key:value,...}
* not keyword arguments are called positional arguments
* positional arguments should be starred if after a keyword argument
   * *expression must evaluate an iterable (the asterisk)

```python
def foo(*positional, **keywords):
    print("Positional:", positional, end='\t')
    print("Keywords:", keywords)
    
foo('1st', '2nd', '3rd') 				#positional
foo(par1='1st', par2='2nd', par3='3rd') #keyword
```

​     

