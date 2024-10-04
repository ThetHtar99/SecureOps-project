provider "aws" {
  # region     = "us-west-2"
  access_key = data.vault_aws_access_credentials.creds.access_key #reference from data.tf
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}


resource "aws_vpc" "main" {
  cidr_block       = "10.10.0.0/16"
    tags = {
    Name = "master-prod-vpc"
  }
}

#############################################
#Public Subnets
#############################################

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association"  "public" {
  count = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route" "public" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.public_igw.id
}

resource "aws_internet_gateway" "public_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_igw"
  }
}


#############################################
#Private Subnets
#############################################

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  # map_public_ip_on_launch = true - private

  tags = {
    Name = "private-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association"  "private" {
  count = length(var.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route" "private" {
  route_table_id            = aws_route_table.private_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id #gateway_id = aws_route_table.private_igw.id
}

resource "aws_eip" "nat_eip" {
    domain   = "vpc"
    depends_on = [ aws_internet_gateway.public_igw ]
}
#EIP may require IGW to exist prior to association. Use depends_on to set an explicit dependency on the IGW.

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.public_igw]
}



#############################################
#DB subnet
#############################################

resource "aws_subnet" "db_subnets" {
  count = length(var.db_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnets[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  # map_public_ip_on_launch = true - private

  tags = {
    Name = "db-subnet-0${count.index+1}-${data.aws_availability_zones.azs.names[count.index]}"
  }
}


resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association"  "db" {
  count = length(var.db_subnets)
  subnet_id      = aws_subnet.db_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
