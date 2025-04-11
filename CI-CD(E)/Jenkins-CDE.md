## **Step 1: Create a New Jenkins Job**

1. Go to **Jenkins Dashboard > New Item**.
2. Choose **Copy from** and give it a name.
3. select the Project you want to copy from
4. Click **OK**.

## Configurations have been copied from selected job.

1. Change description of job.

### **2. change buid branch back to main**
  1. Scroll to 'Branches to build' and change 'Branch Specifier' from '*/ dev' to '*/main' 

    ![alt text](../Pictures/Jenkins/jenkins-cde-change-branch-main.png)

### **3. Build Triggers**
- un-Check **Poll SCM** or **GitHub webhook trigger** for automated execution.
  
  ![alt text](../Pictures/Jenkins/jenkins-cde-no-github-trigger.png)

  
### **4. Log into AWS**
1. Create an EC2 instance
   1. Create from App AMI
   2. Leave security groups amd Network configurations 
   3. 

  ### **5. Add SSH agent **
1. check SSH agent in build environment.
2. check 'Specific credentials'
3. Add private ssh key and give it a description

    ![alt text](../Pictures/Jenkins/jenkins-cde-add-ssh-agent.png)
  
  
  ### **6. Build Steps and post build actions**
1. get rid of any build steps and post build actions from previous job to start fresh.



### **4. Build Steps**

1. Select 'Execute shell' in the build steps drop down tab.
2. Add shell commands to Allow jenkins to connect to your EC2 instance 
   1. add instance IP address/DNS 
   2. add app directory so jenkins know where to go 
   3. add commands to execute in app folder.

    ![alt text](../Pictures/Jenkins/jenkins-cde-add-executeshell.png)

   4. click save 

### **8. Post Build Steps connect to merge job**

1. Go to Previous Merge job 
2. Select configurations tab
3. Scroll down to post build steps 
4. select 'build other projects'
5. select CDE as the downstream project in 'Projects to build' tab
6. click save.

    [alt text](../Pictures/Jenkins/jenkins-add-cde-to-job2.png)


## ** 9: Make changes to code then use git push to trigger Job 1**





