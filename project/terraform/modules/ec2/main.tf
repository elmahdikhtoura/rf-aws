resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = var.name_tag
    Environment = var.environment
  }
}
