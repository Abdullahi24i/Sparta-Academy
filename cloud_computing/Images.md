#### What are they?  
- An image is a pre-configured template that contains the necessary information to launch a virtual Machine it includes:
  - Operating System (e.g., Linux, Windows)
  - Software Packages (e.g. webservers, Apps, Databases)
  - Application configurations (e.g., pre-installed software (Nginx, Node.js))
  - Permissions and Security settings (e.g. who can read, write and who can access the application)
#### How do they work?
    1. Create or Select an AMI - either your own, AWS owned AMIs or third-party vendor AMIs on AWS Marketplace.
    2. Launch an EC2 Instance from an AMI - Once launched, the EC2 instance copies the AMI and boots up with the pre-configured settings.
    3. Modify and Save as a New AMI - optional but you can install additonal software or change configurations and save as a new AMI
#### Why are they helpful for a business? 
- Faster Deployment & Time Savings
  - Instant set up - what you need is already configured.
  - Automation - No need for manual installation or running scripts, reducing deployment time.
  - Consistent Environments - Ensures that every new instance is identical to avoid "it works for me" issues.
- Scalability & Elasticity
  - Handles Traffic Spikes with Autoscaling – Businesses can quickly scale their applications by launching multiple instances with the same configuration.
- Security & Compliance
  - Pre-configured Security Policies – Images can have firewall settings, encryption, and permissions applied in advance.
  - Reduced Human Error – Automating configuration eliminates manual security mistakes.
  - Compliance Standards – Helps meet industry regulations (e.g., HIPAA, GDPR, ISO) by ensuring all instances follow security guidelines.
- Cost Efficiency
  -  Optimised Resource Usage - Ensures that every instance is correctly set up to avoid performance inefficiencies and only the neccessary software is installed if a company wants to use lightweight images.
  -  Snapshot-Based Backups - Businesses can take snapshots of AMIs, reducing the need for expensive full backups.
- Disaster Recovery & Business Continuity
  - Quick Recovery – If a server fails, businesses can launch a new identical instance instantly.
  - Backup & Redundancy – AMIs can be used to restore systems quickly in case of cyberattacks or outages.
  - Multi-Region Availability – Businesses can create AMIs in different AWS regions to ensure availability worldwide.
#### Guide on how to make one 
1. Launch an EC2 Instance
   1. Go to the AWS Console then navigate to EC2 Dashboard.
   2. Click Launch Instance and select a base AMI (e.g., Amazon Linux, Ubuntu, Windows Server).
   3. Choose an Instance Type (e.g., t2.micro for free tier).
   4. Configure Networking & Security Groups as needed.
   5. Click Launch and connect to your instance via SSH.
2. Configure the Instance
   1. Install required software (Nginx, Node.js)
   2. Apply security configurations (firewall rules) and permissions.
   3. Configure environment variables and settings.
3. Stop the Instance
4. Create an AMI from the Instance
   1. Go to the EC2 Dashboard then select the instance.
   2. Click Actions → Image and templates → Create image.
   3. Configure: Image Name, Description - what it is and what its for, Reboot?- do want the instance to stay running?, Delete on termination.
   4. Click Create Image.
   5. Check that it's Available - in AMIs list it should change from "pending" to "available".
#### Guide on how to use one 
- Launch a New Instance from Your AMI 
  1. Go to AMIs then select your AMI.
  2. Click Launch Instance from Image
  3. Choose instance type, configure settings, and launch.
  4. Your new EC2 instance will start with the exact same setup as your original instance



   
