variable "ami_id" {
  description = "ID de l'AMI à utiliser"
}

variable "instance_type" {
  description = "Type d'instance"
}

variable "name_tag" {
  description = "Nom de l'instance"
}

variable "environment" {
  description = "Environnement (TEST ou PROD)"
}
