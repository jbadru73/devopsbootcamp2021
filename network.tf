resource "aws_vpc" "demo_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PersonalVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Pubsubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Pubsubnet2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Prisubnet1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Prisubnet2"
  }
}