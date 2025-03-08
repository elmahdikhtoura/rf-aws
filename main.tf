provider "aws" {
  region = "eu-west-3"
}

# Récupérer l'AMI le plus récent pour Windows Server
data "aws_ami" "windows-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

# Créer un groupe de sécurité pour l'instance
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

# Créer une instance Windows Server
resource "aws_instance" "windows-server" {
  ami           = data.aws_ami.windows-ami.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [aws_security_group.windows-sg.id]
  key_name               = "votre_clef_ssh" # Remplacez par votre clé SSH
}
