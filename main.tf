provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0f9c61b5be765efb9"
  instance_type = "t2.micro"
}
