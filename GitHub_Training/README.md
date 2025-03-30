# Git and GitHub notes/cheatsheet

### what is Git?
- Version control software- allows you to track changes over time, in case you need to go back to a more stable working verion.
- open source - the source code is publicly available, anyone can contribute to the improvement of the software and theres transparency.

#### git config
- configiration and customisation

#### git config list
- list of all configuaration settings

#### pwd
- present working directory- shows you what your working directory is

#### mkdir
- to make a directory

#### cd
- change directory

#### ls
-list of files in directory

#### ls -al 
- more in depth file list with hidden files aswell such as .git files

#### git init
- create a new repository

#### git ignore
- create a file where you can specify what files you want to exclude from the version control- so they are not public e.g. all files with '.properties'

### Working directory ---> Staging Area ---> Local Repository

#### Working Directory ---> Staging Area
- git add - is the function 
- choose which files from the working directory you want to track versrions and it's like a basket for when you want to commit them to the repository.
  
#### Staging Area ---> Local Repository
- git commit -m "  " - Always leave a comment of what youre committing and what version so you have an idea of what it is later when you come back to it
- you can commit everything or certan files 

#### git commit -a 
- commit everything in one go.
  
#### git is opt in
- by default nothing is part of the repository you have to add then commit

#### git diff
- can see the difference between what's in the working directory and what's in the repository.
- Modifications are in green and the old text is in red.

#### git log 
- log of everything that's happened in the project

#### rm -rf 
- deleting anything but you have to use a path for specific files.

### git remote -v 
- to check the origin

### eval `ssh-agent -s` 
to add an identity to then add your private key

### git push origin main    
- to push to your online repo ihow to .e github

## rm -rf 
- to delete files in bash
- can also provide a path to what folder you want to delete.

### ssh -T git@github.com
- to check authenticity of host can be established 
- basically to check your keys work.

### cat <public-key-name>
- to see and copy your public ssh key in terminal 

### shh-keygen -t rsa -b 4096 -C <email>
- this is to generate a SSH key in terminal
- -t means type
- rsa is the encryption algorythm
- -b means the length of encryption in bytes in this case it's 4096 
- C ?

### git remote set-url origin <origin>
- to change the origin 
### git remote add origin <origin>
- to add origin





### What is GitHub?
- A remote repository to your files can be saved online in case of local repository failure.


- 