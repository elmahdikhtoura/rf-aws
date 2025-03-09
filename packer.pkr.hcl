packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.4"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "example" {
  region           = "eu-west-3"
  source_ami       = "ami-0f9c61b5be765efb9"
  instance_type    = "t2.micro"
  ssh_username     = "ec2-user"
  ami_name         = "example-ami-{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.example"]
}
