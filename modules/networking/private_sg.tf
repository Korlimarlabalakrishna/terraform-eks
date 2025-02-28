resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.chatmonday_vpc.id

  # Allow SSH only from Bastion (Public Subnet)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id] # Allow SSH only from Public-SG
  }

  # Allow traffic from the public subnet (e.g., web server to DB)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id] # Allow DB connections from Public-SG
  }

  # Allow outbound traffic to NAT Gateway for internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private-SG"
  }
}

