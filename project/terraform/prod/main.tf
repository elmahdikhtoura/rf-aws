provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name        = "ProdVPC"
    Environment = "PROD"
  }
}

resource "aws_subnet" "prod_subnet" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name        = "ProdSubnet"
    Environment = "PROD"
  }
}
