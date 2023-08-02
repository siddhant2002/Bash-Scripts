terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

provider "aws" {
  region = "ap-south-1"  # Replace this with your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "chopala123"  # Replace this with a unique bucket name of your choice

  # Additional optional configurations:
  force_destroy = true  # Setting this to true allows Terraform to destroy the bucket on delete

  # Uncomment the following block to enable versioning for the bucket
  # versioning {
  #   enabled = true
  # }
}

resource "aws_subnet" "tiki" {
  vpc_id     = aws_vpc.tiki.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Tiki"
  }
}


resource "aws_vpc" "tiki" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tiki"
  }
}


resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.tiki.id
  cidr_block = "172.2.0.0/16"
}

resource "aws_subnet" "in_secondary_cidr" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = "172.2.0.0/24"
}
