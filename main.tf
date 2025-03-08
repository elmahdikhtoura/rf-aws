provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "windows-server" {
  ami           = "ami-00de2738e4acd2428" # Remplacez par l'AMI ID valide pour Windows Server
  instance_type = "t2.medium"
  vpc_security_group_ids = [aws_security_group.windows-sg.id]
}

resource "aws_security_group" "windows-sg" {
  name        = "windows-sg"
  description = "Allow inbound traffic on port 3389"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
