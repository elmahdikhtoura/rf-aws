output "prod_instance_id" {
  value = module.ec2_prod.instance_id
}

output "prod_public_ip" {
  value = module.ec2_prod.public_ip
}
