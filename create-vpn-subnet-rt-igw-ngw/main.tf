resource "aws_vpc" "main" {
  cidr_block       = "10.10.0.0/16"
    tags = {
    Name = "master-prod-vpc"
  }
}

#############################################
#Public Subnets
#############################################

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-0${[count.index]}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}