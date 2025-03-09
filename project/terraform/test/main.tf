provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "TestVPC"
    Environment = "TEST"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name        = "TestSubnet"
    Environment = "TEST"
  }
}
