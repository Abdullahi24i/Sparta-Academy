- `uname` = gives system info 
- `uname --help` = gives you a list of options for uname
- `history` = shows all commands run in this shell session
- `history -c` - clears history
- `cat/etc/shells` = list of all available shells 
- `ps -p $$` = will tell you what shell you're using 
- `whoami` 
- `*up key` = will allow you to go though 
- `!(No.)` = will run whatever number that command was in your history
- `ls -l` = to see permissions on files
- `ls -a`
- `--output` = where you want to output/ save 
- `wget` = for downloading files and data
- `curl` = allows you to transfer data

- `curl <link> --output file name`  = to add a file via link
- `wget <link> --output -o file name` =to add a file via link (download)

- `mv cat.jpg cat` = to turn cat.jpg to just cat 
- `rm cat.jpg` = delete cat.jpg
- `cp cat txt cat.jpg` = copy and name file cat jpg
- `mkdir` = make directory
- `rm -r` = to delete directory 
- `rm` = to delete file 
- `touch` = to create a blank file 
- `nano` = to open blank file 
- `head -(No)` = to see top No. lines
- `tail -(No)` = to see last No. of lines 
- `nl` = number the lines in text 
- `cat chicken-joke.txt | grep chicken` = to look for chicken in text 
- `sudo apt update -y` = go on internet and downloading newer packages/ newer verisons of things already installed and confirms we have accesss to the internet 
- `sudo apt install tree` = installed a tree package 
- `tree` = to see your tree of diretories and files
- `sudo apt upgrade -y` = will compare downloaded to what its using, then install the newer version - not safe and can break things so have to be careful 
- `mv file directory` = to move file into directory 
- `man` = to ge a manual and info i.e man -ls 
-sudo systemctl status nginx
- `=` to set a variable 
- `$HOME` = Environment variables are special variables that provide you with information about your login session
- `export variable = `  = is used to set/modify environment variables so `export HOME=home/Abdullahi`
  
##### How can we make an environment variable peristnent 
- make the variable in the bsh rc so `nano .bashrc` create env variable then save and exit 

##### what is a process?
- A process is a program loade into the ram and in execution by cpu and can be identified by its unique PID number
- single core of cpu can only run a process at a time, they just switch between them really quickly
  
##### how can we see running bash processes?
- `ps` = user processes 
- `ps -e` system processes
- `ps aux` = system process with a lot more info

##### What are child processes? 
- performing tasks in the background while the main process is still active.

##### How can you run a process in the background, rather than the foreground?
- by putting an & at the end of the command name used to start the process
##### How can you end a process?
- `#!/bin/bash` and `pkill -f process_name` 

##### Explain the Linux permission system to me
- permissions control who can access files and directories and what actions they can perform. cloud servers also use linux for this 
- owner, group, everyone else in that order so rwxrwxr-x means owner can rwx groups can rwx and everyone else can read and execute only
- d means directory 
- can use linux permissions calculator to work out permissions
- 

- `printenv` to see all env variables
- `sudo systemctl status nginx` to check the status of a nginx  
- `sudo systemctl` a way to interact with a packaglike like nginx so commands like start, restart etc 
- `sudo systemctl enable nginx` to make nginx start up on instance start  
- `jobs -l` = to see jobs/ process running 
- `kill -1 [pid]` to kill a process (most gentle way)
- `kill -15 [pid]` = to kill child processes first then parent process to avoid zombie processes
- `kill -9 [pid]` = most brutal way to kill a process, good for a process not responding, last resort, try to avoid on anything constantly writing like databases 
- `ls-la` = all files and folders 
- 
- `chmod` to modify permissons 
- `chown` to modify owner ie `chown root <file>` 

- If your terminal locks:
 - `q`
 - `Ctrl + z`
 - `Ctrl + x`

- `#!` = shabang- tells os what shell to suse 
- `#!/bin/bash` = shabang then the place and the shell

- `chmod +x basic_script.sh` = to give execute to everyone 

- `source` = used to run commands in a script file 
- scp -i tech503-Abdullahi-aws-key.pem nodejs20-sparta-test-app ec2-ubuntu@ec2-18-203-85-92.eu-west-1.compute.amazonaws.com:/home/ubuntu/

- scp example_directory/file1.txt REMOTE_USER_1@REMOTE_IP_ADDRESS_1:example_backup1

- scp -i path to key + path to file you want to transfer + public ipv4 dns : path to destination 

- `scp` secure copy 
- `rsync` establishes a link betwen local and remote servers so files can sync between 
- `sudo apt install unzip` to install unzip package 
- `sudo unzip nodejs20-sparta-test-app.zip` = example of unziping a file 

- | is used to combine two commands together 
- `nohup` = keep processes running even after exiting the shell or terminal
- `curl` = a command line tool that developers use to transfer data to and from a server
-  `sed` = find a string and replace with another string
-  