# Configurer le fournisseur AWS
provider "aws" {
  region = "eu-west-3"
}

# Récupérer l'AMI le plus récent pour Amazon Linux 2
data "aws_ssm_parameter" "latest_amazon_linux_2" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Créer une instance EC2
resource "aws_instance" "example" {
  ami           = data.aws_ssm_parameter.latest_amazon_linux_2.value
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
}

# Créer un groupe de sécurité pour l'instance EC2
resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow inbound traffic on port 22"

  ingress {
    from_port   = 22
    to_port     = 22
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

# Créer un VPC (si nécessaire)
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Créer un sous-réseau (si nécessaire)
resource "aws_subnet" "example" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.example.id
  availability_zone = "eu-west-3a"
}

# Associer l'instance EC2 au sous-réseau
resource "aws_instance" "example_with_subnet" {
  ami           = data.aws_ssm_parameter.latest_amazon_linux_2.value
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
  subnet_id = aws_subnet.example.id
}
