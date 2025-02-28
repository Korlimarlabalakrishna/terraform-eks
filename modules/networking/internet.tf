# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.chatmonday_vpc.id

  tags = {
    Name = "Chat_IGW"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Chat_NAT"
  }
}

