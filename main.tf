provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0390f13b3ce6449f8"
  instance_type = "t2.micro"
}
