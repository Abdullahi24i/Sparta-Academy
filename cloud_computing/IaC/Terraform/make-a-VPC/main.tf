provider "aws" {
  region = "eu-west-1"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tech503-Abdullahi-tf-vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech503-Abdullahi-tf-igw"
  }
}

# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "tech503-ai-tf-public-subnet"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "tech503-ai-tf-private-subnet"
  }
}

# Create Route Table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tech503-ai-tf-public-rt"
  }
}

# Associate public subnet with route table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security group for public instance (22, 80, 3000)
resource "aws_security_group" "public_sg" {
  name        = "tech503-ai-tf-public-subnet"
  description = "Allow SSH, HTTP, and port 3000"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
}

# Security group for private instance (22, 27017)
resource "aws_security_group" "private_sg" {
  name        = "tech503-ai-tf-private-subnet"
  description = "Allow SSH and MongoDB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                         = var.base_ubuntu_22_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  key_name                    = "tech503-Abdullahi-aws-key"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]

  tags = {
    Name = "tech503-abdullahi-app-tf"
  }
}

# Private EC2 Instance
resource "aws_instance" "private_instance" {
  ami                         = var.base_ubuntu_22_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false
  key_name                    = "tech503-Abdullahi-aws-key"
  vpc_security_group_ids      = [aws_security_group.private_sg.id]

  tags = {
    Name = "tech503-abdullahi-db-tf"
  }
}
