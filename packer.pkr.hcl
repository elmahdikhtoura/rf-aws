packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "example" {
  region           = "eu-west-3"
  source_ami       = "ami-0eaf62527f5bb8940"
  instance_type    = "t2.micro"
  ssh_username     = "ec2-user"
  ami_name         = "example-ami-{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
    user          = "ec2-user"
  }
}
