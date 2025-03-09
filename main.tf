provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0eaf62527f5bb8940" # Remplacez par une AMI valide dans votre région.
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
