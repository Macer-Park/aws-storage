resource "aws_vpc" "MyVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "CH5-VPC"
  }
}

resource "aws_internet_gateway" "MyIGW" {
  tags = {
    Name = "CH5-IGW"
  }
}

resource "aws_internet_gateway_attachment" "MyIGWAttachment" {
  internet_gateway_id = aws_internet_gateway.MyIGW.id
  vpc_id              = aws_vpc.MyVPC.id
}

resource "aws_route_table" "MyPublicRT" {
  vpc_id = aws_vpc.MyVPC.id
  tags = {
    Name = "CH5-Public-RT"
  }
}

resource "aws_route" "MyDefaultPublicRoute" {
  route_table_id         = aws_route_table.MyPublicRT.id
  destination_cidr_block = var.default_route
  gateway_id             = aws_internet_gateway.MyIGW.id

  depends_on = [aws_internet_gateway_attachment.MyIGWAttachment]
}

resource "aws_subnet" "MyPublicSN1" {
  vpc_id            = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone[0]
  cidr_block        = var.public_subnet_1_cidr

  tags = {
    Name = "CH5-Public-Subnet1"
  }
}

resource "aws_subnet" "MyPublicSN2" {
  vpc_id            = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone[1]
  cidr_block        = var.public_subnet_2_cidr

  tags = {
    Name = "CH5-Public-Subnet2"
  }
}

resource "aws_route_table_association" "MyPublicRouteTableAssociation" {
  route_table_id = aws_route_table.MyPublicRT.id
  subnet_id      = aws_subnet.MyPublicSN1.id
}

resource "aws_route_table_association" "MyPublicRouteTableAssociation2" {
  route_table_id = aws_route_table.MyPublicRT.id
  subnet_id      = aws_subnet.MyPublicSN2.id
}