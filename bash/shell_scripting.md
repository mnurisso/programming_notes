# Basic Shell Scripting Guide

Shell scripting allows for the automation of tasks in Unix-like operating systems. Below are fundamental concepts and constructs commonly used in shell scripts.

## Shebang

The shebang (`#!`) at the beginning of a script specifies the interpreter to execute the script.

```bash
#!/bin/bash
```

## Variables

Variables in shell scripts are defined without a type. They can store strings, integers, or arrays.
Assign values to variables without spaces around the = sign.

```bash
name="Alice"
age=30
numbers=(1 2 3 4 5)
```

To access the value of a variable, prefix the variable name with a `$`.

```bash
echo $name
echo ${numbers[2]}
```

## Comments

Comments in shell scripts start with a `#` and continue to the end of the line.

```bash
# This is a comment
echo "This is not a comment"
```

## If-else Statements

The `if` statement evaluates a condition and executes a block of code if the condition is true.

```bash
if [ condition ]; then
    # code block
elif [ condition ]; then
    # code block
else
    # code block
fi
```

## Loops

### For Loop

The `for` loop iterates over a list of items.

```bash
#!/bin/bash
for i in 1 2 3; do
    echo "Number: $i"
done
```

### While Loop

The `while` loop executes a block of code as long as a condition is true.

```bash
#!/bin/bash
count=1
while [ $count -le 3 ]; do
    echo "Count: $count"
    ((count++))
done
```

## Functions

Functions allow you to group code for reuse.

```bash
#!/bin/bash
greet() {
    echo "Hello, $1!"
}

greet "Alice"
```

## Input and Output

### Reading User Input

The `read` command reads input from the user and assigns it to a variable.

```bash
#!/bin/bash
echo "Enter your name:"
read name
echo "Hello, $name!"
```

### Output Redirection

The `>` operator redirects output to a file, overwriting its contents.

```bash
echo "Hello, World!" > output.txt
```

## Script Arguments

Access script arguments using `$1`, `$2`, and so on.

```bash
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"
```

These arguments can be passed when running the script.

```bash
./script.sh arg1 arg2
```

## Exit Status

The exit status of the last command executed is stored in the special variable `$?`.

```bash
#!/bin/bash
ls /path/to/file
echo "Exit status: $?"
```

This value is `0` if the command was successful, and non-zero if there was an error.
This can be also used to exit a script with a specific status.

```bash
#!/bin/bash
if [ condition ]; then
    exit 0
else
    exit 1
fi
```

This guide provides an overview of essential shell scripting elements to help you automate tasks effectively.

**Sources:**

- [Shell Scripting Tutorial – TutorialsPoint](https://www.tutorialspoint.com/unix/shell_scripting.htm)
- [Bash Scripting Tutorial – freeCodeCamp](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/)
- [Introduction to Linux Shell and Shell Scripting – GeeksforGeeks](https://www.geeksforgeeks.org/introduction-linux-shell-shell-scripting/)