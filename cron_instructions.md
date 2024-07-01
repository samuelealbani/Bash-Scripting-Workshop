## Cron on MacOS

Cron is a time-based job scheduling system in Unix-like operating systems. It enables users to schedule jobs (commands or scripts) to run automatically at specified times or intervals. Cron uses a configuration file known as a crontab to store the schedule of tasks. Each task scheduled by cron is called a cron job. Users can edit their crontab to add, modify, or remove tasks according to their needs. Cron is widely used for automating system maintenance, administration tasks, and any repetitive jobs that need to run at fixed times or intervals.

### Editing your cronjobs

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

### Printing the list of your cronjobs

To print the list of your cronjobs:
```bash 
crontab -l
```

### System Permissions

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

### Install processing-java

To run Processing sketches from the command line, install the `processing-java` command line tool.

1. Check if processing-java command line tool is installed by typing `processing-java` in the terminal. If it returns `processing-java: command not found` proceed to step #2

2. Open the Processing IDE, go to Tools, and click on `Install “processing-java”`.


## Cron Usage Example

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
