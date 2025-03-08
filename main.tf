provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
