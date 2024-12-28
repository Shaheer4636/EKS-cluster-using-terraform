provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

# Fetch default VPC and Subnet for EC2
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow SSH and HTTP access"
  vpc_id      = data.aws_vpc.default.id

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami                    = "ami-01816d07b1128cd2d" # Replace with your preferred AMI ID
  instance_type          = "t2.micro"
  subnet_id             = data.aws_subnets.public.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "your-key-pair" # Replace with your key pair name

  tags = {
    Name = "t2-micro-instance"
  }
}
