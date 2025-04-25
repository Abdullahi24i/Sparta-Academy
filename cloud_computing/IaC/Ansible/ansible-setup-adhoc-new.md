# 🔧 Ansible Setup: Controller & Target Node on AWS

## 🖥️ 1. Set Up Controller & Target Node
1. **Create Controller Instance** (AWS EC2).
2. **Create Target Node Instance** (AWS EC2).

---

## 🔗 2. Connect to Controller Instance
```bash
ssh -i "[your-aws-key].pem" ubuntu@[controller-ip].compute.amazonaws.com
```

---

## 🐍 3. Check & Prepare Environment
### ✅ Check Python is installed
```bash
python3 --version
# needed for ansible!
```

### 🆙 Update & Upgrade Packages
```bash
sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
```

---

## 🤖 4. Install Ansible on Controller
### Add Ansible Repository
```bash
sudo DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:ansible/ansible -y
```

### Install Ansible
```bash
sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y
```

### Confirm Installation
```bash
ansible --version
```

---

## 📁 5. SSH Key Setup
### Navigate to `.ssh` Folder
```bash
cd ~
ls -a #check .ssh folder is there
cd .ssh 
```

### Create PEM File
```bash
sudo nano [aws-key-name].pem
#use the same name as your aws key to make it easier for you.
```

> 📋 Paste your AWS private key here and save.

### Set Permissions
```bash
sudo chmod 400 [aws-key-name].pem
# Add read permissions to your .pem file
```

---

## 📡 6. Connect to Target Node
### From Controller:
```bash
sudo ssh -i "~/.ssh/[aws-key-name].pem" ubuntu@[target-node-ip].compute.amazonaws.com
```

### Confirm No Ansible Installed:
```bash
#You can check you are in the target machine by checking if you have ansible, which you shouldn't as you didn't install Ansible on the target node, only the controller.
ansible --version
# Should say: Command 'ansible' not found...
```
### Exit Target node
---

## 📂 7. Configure Ansible Inventory
### Go to Ansible Directory in Controller node
```bash
cd /etc/ansible
ls
```

### Edit Hosts File
```bash
sudo nano hosts
```
Add the following:
```ini
[web]
ec2-instance ansible_host=<target-node-ip> ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/.ssh/<aws-key-name>
#'ec2-instance' = name of the host, 'ansible_user' = user ansible logs in as,  
```

---

## 🛠️ 8. Test Connection with Ping
```bash
sudo ansible all -m ping
# Should return: ec2-instance | SUCCESS ...
```

---

## ⚙️ 9. (Optional) Suppress Python Warning
```bash
sudo nano ansible.cfg
```
Add at the bottom:
```ini
[defaults]
interpreter_python = auto_silent
```

---

## 📋 10. Useful Ansible Inventory Commands
```bash
ansible-inventory --help
ansible-inventory --graph
ansible-inventory --list
```

---

## 🚀 11. Run Ad-Hoc Ansible Commands

### Basic Commands
```bash
sudo ansible web -a "uname -a"
sudo ansible web -a "date"
```

### Using Modules
```bash
# Use specific module
sudo ansible web -m ansible.builtin.command -a "uname -a"

# Update apt cache
sudo ansible web -m ansible.builtin.apt -a "update_cache=yes" --become

# Perform system upgrade
sudo ansible web -m ansible.builtin.apt -a "upgrade=dist" --become
```
