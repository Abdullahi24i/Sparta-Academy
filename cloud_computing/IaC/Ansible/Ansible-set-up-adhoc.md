1. Create controller Instance 
2. create target node instance 
3. connect to controller instance
4. check if python is installed - ```python3 --version```
5. ```sudo DEBIAN_FRONTEND=noninteractive apt update -y```
6. ``` sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y``` 
7. Add Ansible to list/ repository so the VM knows where to find it ```sudo DEBIAN=FRONTEND_noninteractive apt-add-repository ppa:ansible/ansible -y```
8. install Ansible - ```sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y```
9. Has it actually installed Ansible - check version ```ansible --version```
10. go to ansible directory and check whats inside ```cd /etc/ansible```  then ```ls``` 
11. ```cd``` back to home directory 
12. ```ls -a``` - should see .ssh folder then, ``` cd .ssh``` to go into ssh folder
13. Make pem file in .ssh folder ```sudo nano [aws-key-name].pem``` use the same name as your aws key to make it easier for you.
14. Open new git bash window and copy aws key and paste into the .pem file in other git bash window then save.
15. Add read permissions to your .pem file ```sudo chmod 400 [aws-key-name].pem```
16. SSH into your target node, go to target node aws details page, connect and then cope ssh command and paste into git bash terminal ```sudo ssh -i "[aws-key-name].pem" ubuntu@[Instance IP].eu-west-1.compute.amazonaws.com```
17. You can check you are in the target machine by checking if you have ansible, which you shouldn't as you didn't install Ansible on the target node, only the controller. ``` ansible --version``` should say "Command 'ansible' not found, but can be installed with:..." 
18. Get out of .ssh and go back to ansible folder ```cd``` then  ```cd /etc/ansible```
19. ```sudo nano hosts``` to go into hosts file scroll all the down to the bottom and write ```[web]``` press enter to go onto next line and ```ec2-instance ansible_host=<target-node-ip> ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/.ssh/<aws-key-name>```. This is to allow ansible on controller VM to connect to the Target node VM. 
20. ```sudo ansible all -m ping``` to check the connection works it should say "ec2-instance | SUCCESS..." in a green message.
21. (OPTIONAL) ```ls``` then ```sudo nano ansible.cfg``` scroll all the down to the bottom and write ```[defaults]``` press enter to go onto next line and enter ```interpreter_python = auto_silent``` - to get rid of python interpreter pink message when doing the ping command. ```host_key_checking = False``` (OPTIONAL).
1.  ```ansible-inventory --help``` for ansible commands like ```ansible-inventory --graph``` and ```ansible-inventory --list``` which can be useful. 
2.  ```sudo ansible web -a "uname -a"``` "a"- arguments "web" to specify instance group as we did earlier with target node IP. and "uname -a" is the command that will be run on the instance in the [web] group. you can run many ad hoc commands in the speech marks.
3.  ```sudo ansible web -a "date"``` is another command i.e. checking the date.
4.  ```sudo ansible web -m ansible.builtin.command -a "uname -a"``` "ansible.builtin.command" is the specific module you want to use. 'ansible' in the 'builtin' library use the module 'command' if you dont specify a module it will automatically run command.
5.  ```sudo ansible web -m ansible.builtin.apt -a "update_cache=yes" --become``` "become" means become superuser. this command basically makes the VM install updates.
6.  ```sudo ansible web -m ansible.builtin.apt -a "upgrade=dist" --become``` for upgrade command. 

7.  ```sudo ansible web -m ansible.builtin.apt -a "name=nginx state=present update_cache=yes" --become``` -- to install nginx in [web] group
8.  ```sudo ansible web -i hosts -m copy   -a "src=/home/ubuntu/.ssh/[private-aws-key.pem] dest=/home/ubuntu/.ssh/[private-aws-key.pem] mode=0600 owner=ubuntu group=ubuntu"   --become``` - to copy private key to target node in ansible "web" = target group with target IPs and "host" is the file/directory the group is inside (inventory)
9.  ```sudo ansible web -a "ls ~/.ssh"``` to check the key on the target node from the controller node.  

