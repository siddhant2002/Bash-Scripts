output "instance_ip_address1" {
  description = "Public Ip of the instance"
  value       = module.Employee1.instance_public_ip
}

output "instance_ip_address2" {
  description = "Private Ip of the instance"
  value       = module.Employee2.instance_private_ip
}

output "instance_ip_address3" {
  description = "Public Ip of the instance"
  value       = module.Employee3.instance_public_ip
}
output "instance_ip_address4" {
  description = "Private Ip of the instance"
  value       = module.Employee4.instance_private_ip
}

output "instance_ip_address5" {
  description = "Public Ip of the instance"
  value       = module.Employee5.instance_public_ip
}
