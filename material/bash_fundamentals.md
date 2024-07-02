# Bash Fundamentals

This document provides an overview of key concepts in Bash scripting, aimed at helping beginners understand the basics of working with the shell, using built-in commands, understanding shell syntax, and creating shell scripts.

## What is a Shell?

Bash is both a command language and a shell, or a command-line interpreter that provides a user interface for accessing an operating system's services. It allows users to execute commands, scripts, and programs, and to manage files and processes. Bash operates in two modes: interactive (typing single commands in the shell) and non-interactive (executing scripts, or text files containing a sequence of Bash commands).

## Built-in Commands

Bash includes several built-in commands that are essential for daily operations:

- `date`: Displays or sets the system date and time.
- `pwd`: Prints the current working directory.
- `ls`: Lists directory contents.
- `ls -l`: Lists directory contents in long format, showing detailed information.
- `echo`: Displays a line of text.
- `cd`: Changes the current directory.
- `touch`: Creates a new file if it does not exist, or updates the file's access and modification times.
- `mv`: Moves or renames files and directories.
- `man command`: Access the manual page for a command (press `q` to exit).

## Shell Syntax

Understanding shell syntax is crucial for writing effective scripts:

- **Quotes**: Used to handle spaces and special characters in strings. Single quotes (`'`) preserve the literal value of each character, while double quotes (`"`) allow for variable expansion and command substitution.
  ``` bash
  echo 'Hello, World!'
  ```
- **Dollar Sign (`$`)**: Used to access variable values or to execute command substitution.
  - **Variables**: Store data that is assigned to a name and can be reused and manipulated. Defined without a `$` but accessed with a `$` prefix.
    ``` bash
    value=23
    echo $value
    ```
  - **Arithmetic Expansion**:llows arithmetic operations using `$((expression))`
    ```bash
    val1=10
    val2=2
    sum=$((val1+val2))
    echo "sum is $sum"
    ```
  - **Command Substitution**: Captures the output of a command using `$(command)`
    ```bash
    files_in_current_dir=$(ls)
    echo $files_in_current_dir
    ```



- **For Loops**: Iterates over a list of values, range, or in C-style.
    ``` bash
    # iterate through lists
    for name in Gina Mandy Hannah
    do
        echo $name
    done

    # iterate ranges
    for i in {1..4}
    do
        echo $i
    done

    # C-Style
    for ((i=0; i<5; i++))
    do
        echo $i
    done
    ```

- **If Conditional**: Executes commands based on conditional logic.
    ``` bash
    val1=20
    val2=45
    if [ $val1 -eq $val2 ]
    then
        echo "$val1 = $val2"
    elif [ $val1 -gt $val2 ]
    then
        echo "$val1 > $val2"
    else
        echo "$val1 < $val2" # -lt
    fi
    ```

- **Positional Parameters**: Special variables (`$1`, `$2`, etc.) that hold the arguments passed to the script. `$#` gives you the count of positional parameters, while `"$@"` is an array-like construct that holds all the positional parameters.
    ``` bash
    if [ $# -gt 0 ]
    then
        echo "you passed $# parameter(s): $@."
        echo "$1 is the first parameter"
        for par in $@
        do
            mkdir $par
        done
    fi
    ```
- **User Input**: use `read name_variable` to assign the user's input to a variable:
  ``` bash
  echo -n "Enter your favourite food: "
  read user_favourite
  echo "$user_favourite? Bleahhh" # ;)
  ```

## Shell Scripts

Shell scripts are files containing a series of commands that the shell can execute.

You can practice executing the provided script [example](https://github.com/samuelealbani/Bash-Scripting-Workshop/blob/main/script.sh).

- **Shebang (`#!`)**: The first line in a script, indicating the script's interpreter. You can find the path with `which bash`.
    ``` bash
    #!/bin/bash
    ```
- **Execution**: Scripts can be executed by passing them directly to the shell
    ``` bash
    bash path/to/the/script.sh
    ```
    or by making them executable and running them as programs:
    ``` bash
    chmod u+x path/to/the/script.sh # make it executable
    path/to/the/script.sh # execute it
    ```
- **Delay**: Use `sleep` to pause execution for a specified time.
    ``` bash
    sleep 10 # number of seconds
    ```
