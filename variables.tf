variable "ami" {
  type        = string
  default     = "ami-0f9c61b5be765efb9"
  description = "ID de l'AMI"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Type d'instance"
}
