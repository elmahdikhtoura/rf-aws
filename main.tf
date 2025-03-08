provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0903464b35c09d0ea"
  instance_type = "t2.micro"
}
