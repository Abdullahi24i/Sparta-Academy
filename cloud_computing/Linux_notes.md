-`uname` = gives system info 
-`uname --help` = gives you a list of options for uname
-`history` = shows all commands run in this shell session
-`history -c` - clears history
-`cat/etc/shells` = list of all available shells 
-`ps -p $$` = will tell you what shell you're using 
-`whoami` 
-`*up key` = will allow you to go though 
-`!(No.)` = will run whatever number that command was in your history
-`ls -l` 
-`ls -a`
-`--output` = where you want to output/ save 
-`wget` = for downloading files and data
-`curl` = allows you to transfer data

-`curl <link> --output file name`  = to add a file via link
-`wget <link> --output -o file name` =to add a file via link (download)

-`mv cat.jpg cat` = to turn cat.jpg to just cat 
-`rm cat.jpg` = delete cat.jpg
-`cp cat txt cat.jpg` = copy and name file cat jpg
-`mkdir` = make directory
-`rm -r` = to delete directory 
-`rm` = to delete file 
-`touch` = to create a blank file 
-`nano` = to open blank file 
-`head -(No)` = to see top No. lines
-`tail -(No)` = to see last No. of lines 
-`nl` = number the lines in text 
- `cat chicken-joke.txt | grep chicken` = to look for chicken in text 
-`sudo apt update -y` = go on internet and downloading newer packages/ newer verisons of things already installed and confirms we have accesss to the internet 
-`sudo apt install tree` = installed a tree package 
-`tree` = to see your tree of diretories and files
-`sudo apt upgrade -y` = will compare downloaded to what its using, then install the newer version - not safe and can break things so have to be careful 
-`mv file directory` = to move file into directory 
-`man` = to ge a manual and info i.e man -ls 
-sudo systemctl status nginx
-`=` to set a variable 
-`$HOME` = Environment variables are special variables that provide you with information about your login session
-`export variable = `  = is used to set/modify environment variables so `export HOME=home/Abdullahi*

##### How can we make an environment variable peristnent 
- something to do with putting the command in a text editor

##### what is a process?
- A process is a program in execution and can be identified by its unique PID number
  
##### how can we see running bash processes?
- pgrep

##### What are child processes?
-performing tasks in the background while the main process is still active.

##### How can you run a process in the background, rather than the foreground?
- by putting an & at the end of the command name used to start the process
##### How can you end a process?
- `#!/bin/bash` and `pkill -f process_name` 

##### Explain the Linux permission system to me
- permissions control who can access files and directories and what actions they can perform. cloud servers also use linux for this 