# Bash Scripting Workshop for System Automation
by Samuele Albani
***




#### Table of Contents

1. [Introduction](#introduction)
2. [Bash Fundamentals](#bash-fundamentals)
3. [Crontab on MacOS](#cron-on-macos)

---

## Introduction

 In this workshop, we will explore using the Bash command language to gain enhanced control and automation of your system machines and software. Starting with an introduction to Bash fundamentals, we’ll learn how to navigate and work with our system from the terminal. By the end of the session, we’ll apply these skills by developing scripts to automate a computer for a hypothetical exhibition, including timed control of installations. No prior knowledge is required.

#### Requirements

You will need your laptop for the session. Bash scripts run natively on Linux and Mac, so Mac and Linux users will have a command line application already.  While Windows users can use (or will need to install) [Git for Window](https://git-scm.com/downloads), [Cygwin](https://www.cygwin.com/install.html), or [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/) .

It’s also recommended to have [Processing](https://processing.org/download) and [VSCode](https://code.visualstudio.com/download) installed.

#### Workshop Material:
- Introduction: [bash fundamentals](#bash-fundamentals)
- Advanced: [crontab on mac example](#cron-on-macos)
- [Example Processing sketch](https://github.com/samuelealbani/Bash-Scripting-Workshop/tree/main/visual)

#### Online Resources:
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [Shell Syntax](https://www.gnu.org/software/bash/manual/bash.html#Shell-Syntax)
- [Shell Scripts](https://www.gnu.org/software/bash/manual/bash.html#Shell-Scripts)
- [crontab on Linux/MacOS](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html)
- [Task Scheduler on Windows](https://learn.microsoft.com/en-gb/windows/win32/taskschd/schtasks?redirectedfrom=MSDN)

---

## Bash Fundamentals

This document provides an overview of key concepts in Bash scripting, aimed at helping beginners understand the basics of working with the shell, using built-in commands, understanding shell syntax, and creating shell scripts.

### What is a Shell?

Bash is both a command language and a shell, or a command-line interpreter that provides a user interface for accessing an operating system's services. It allows users to execute commands, scripts, and programs, and to manage files and processes. Bash operates in two modes: interactive (typing single commands in the shell) and non-interactive (executing scripts, or text files containing a sequence of Bash commands).

### Built-in Commands

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

### Shell Syntax

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

### Shell Scripts

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

---

## Cron on MacOS

Cron is a time-based job scheduling system in Unix-like operating systems. It enables users to schedule jobs (commands or scripts) to run automatically at specified times or intervals. Cron uses a configuration file known as a crontab to store the schedule of tasks. Each task scheduled by cron is called a cron job. Users can edit their crontab to add, modify, or remove tasks according to their needs. Cron is widely used for automating system maintenance, administration tasks, and any repetitive jobs that need to run at fixed times or intervals.

#### Editing your cronjobs

To edit you cronjobs:
```bash 
EDITOR=nano crontab -e
```

```bash 
# ┌───────────── minute (0–59)
# │ ┌───────────── hour (0–23)
# │ │ ┌───────────── day of the month (1–31)
# │ │ │ ┌───────────── month (1–12)
# │ │ │ │ ┌───────────── day of the week (0–6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
``` 

- \* (asterisk) - represents all possible values for a field.
- \, (comma) - specifies a list of values.
- \- (dash) - specifies a range of values.
- \/ (slash) - specifies a step value.

#### Printing the list of your cronjobs

To print the list of your cronjobs:
```bash 
crontab -l
```

#### System Permissions

In order to allow cron to launch Terminal processes in background:

Navigate to Security & Privacy > Privacy > Full Disk Access apps/execs.
1. Enable Terminal.
2. Enable cron.

P.S.
To enable cron:
- click the + button
- hit ⌘⇧G
- enter /usr/sbin
- double click the cron file.

#### Install processing-java

To run Processing sketches from the command line, install the `processing-java` command line tool.

1. Check if processing-java command line tool is installed by typing `processing-java` in the terminal. If it returns `processing-java: command not found` proceed to step #2

2. Open the Processing IDE, go to Tools, and click on `Install “processing-java”`.

---

### Cron Usage Example

Since `cron` runs processes in the background, launching applications that require a graphical interface (like a visual sketch in Processing) can be challenging.

To handle this, create two bash scripts:

* `switch_on.sh`, for launching the Processing sketch:
``` bash
#!/bin/bash
/usr/local/bin/processing-java --sketch=/path/to/your/sketch/folder --force --run 2>> /path/to/your/desktop/error_log.txt 
```

* `switch_off.sh`, for killing the same process:

``` bash
#!/bin/bash
pkill -f 'java.*processing'
```

Then, create an AppleScript using the `Script Editor` called `runApplication.scpt` to open a Terminal window and execute the `switch_on.sh` script:

``` AppleScript
tell application "Terminal"
	do script "bash /path/to/your/bash/switch_on.sh"
	activate
end tell
```

Finally, edit your crontab (adjust the time paramenters as needed): 
```
19 18 * * * osascript /path/to/runApplication.scpt  
20 18 * * * bash /path/to/switch_off.sh
```

