resource "aws_vpc" "main" {
  cidr_block       = "10.10.0.0/16"
    tags = {
    Name = "master-prod-vpc"
  }
}

#############################################
#Public Subnets
#############################################


resource "aws_subnet" "public_subnet_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_01
  availability_zone = var.az_1a
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-01-ap-southeast-1a"
  }
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_02
  availability_zone = var.az_1b
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-01-ap-southeast-1b"
  }
}

resource "aws_subnet" "public_subnet_03" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_03
  availability_zone = var.az_1c
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-01-ap-southeast-1c"
  }
}

