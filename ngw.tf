resource "aws_eip" "my-app-eip" {
  domain = "vpc"

  tags = {
    Name = "my-app"
  }
}

resource "aws_nat_gateway" "my-app-nat-gateway" {
  allocation_id = aws_eip.my-app-eip.id
  subnet_id     = aws_subnet.public-eu-central-1a.id

  tags = {
    Name = "my-app"
  }

  depends_on = [aws_internet_gateway.igw]
}
