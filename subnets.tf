resource "aws_subnet" "public-eu-central-1a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-eu-central-1a"
  }
}

resource "aws_subnet" "private-eu-central-1a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    "Name" = "private-eu-central-1a"
  }
}

resource "aws_subnet" "public-eu-central-1b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.31.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-eu-central-1b"
  }
}

resource "aws_subnet" "private-eu-central-1b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.62.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    "Name" = "private-eu-central-1b"
  }
}