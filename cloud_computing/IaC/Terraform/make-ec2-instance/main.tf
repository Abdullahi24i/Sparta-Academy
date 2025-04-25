# where to make infrastructure (what cloud provider?)
provider "aws" {
  # which region we want to use?
  region = "eu-west-1"

  # when we do terraform init, it will download all required dependencies for the provider stated
}
# navigate to this folder in git bash terminal to perform 'terraform init' command 
# after that you should see 'Terraform has been successfully initialized!' 

#which service/resource?
resource "aws_instance" "app_instance" {

  # which AMI to use?
  ami = var.base_ubuntu_22_ami_id
  
  # ami for ubuntu 22.04 on AWS 

  # what type of instance to use?

  instance_type = "t2.micro"

  # do we need a public IP?

  associate_public_ip_address = true

  # name the resource (in AWS)

  # Add your existing key pair for SSH access
  key_name               = "tech503-Abdullahi-aws-key"

  

  tags = {
    Name = "tech503-abdullahi-terraform-instance"
  }

}
# Define a security group for the instance
resource "aws_security_group" "tech503_abdullahi_app_sg_tf" {
  name        = "tech503-abdullahi-app-sg-tf"
  description = "Allow SSH (22), HTTP (80), and Custom Port (3000)"
  

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom Port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech503-abdullahi-app-sg"
  }
}

# go to gitbash and use command 'terraform fmt' to check the syntax and make it to standard

# 'terraform plan' to communicate with aws to see if it can do what you have asked it to do
# it will ask you 'Do you want to perform these actions?' and type yes 

# next step is to use 'terraform apply'  to actually create the resources 

# once you've seen to your ec2 instance is created, use 'terraform destroy' to get rid of all resources


