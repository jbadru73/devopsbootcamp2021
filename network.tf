resource "aws_vpc" "demo_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PersonalVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                          = aws_vpc.demo_vpc.id
  cidr_block                      = "10.0.0.0/24"
  availability_zone               = "eu-west-1a"
  map_customer_owned_ip_on_launch = "true"
  tags = {
    Name = "Pubsubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                          = aws_vpc.demo_vpc.id
  cidr_block                      = "10.0.1.0/24"
  availability_zone               = "eu-west-1b"
  map_customer_owned_ip_on_launch = "true"
  tags = {
    Name = "Pubsubnet2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "Prisubnet1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "Prisubnet2"
  }
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "PersonalIGateway"
  }
}

resource "aws_route_table" "demo_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "Personal_RT"
  }
}