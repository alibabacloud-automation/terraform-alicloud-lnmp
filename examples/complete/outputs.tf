###############
# ECS Instance
###############
output "this_instance_public_ip" {
  description = "The instance public ip."
  value       = module.lnmp.this_instance_public_ip
}

output "this_security_group_ids" {
  description = "The security group ids in which the instance."
  value       = module.lnmp.this_security_group_ids
}

output "this_vswitch_id" {
  description = "The vswitch id in which the instance."
  value       = module.lnmp.this_vswitch_id
}

output "this_instance_id" {
  description = "The instance id."
  value       = module.lnmp.this_instance_id
}
output "this_instance_name" {
  description = "The instance name."
  value       = module.lnmp.this_instance_name
}

output "this_private_ip" {
  description = "The instance private ip."
  value       = module.lnmp.this_private_ip
}

output "this_instance_tags" {
  description = "The tags for this instance."
  value       = module.lnmp.this_instance_tags
}

output "this_image_id" {
  description = "The image ID used by this instance."
  value       = module.lnmp.this_image_id
}

output "this_instance_type" {
  description = "The instance type."
  value       = module.lnmp.this_instance_type
}

output "nginx_url" {
  description = "The nginx url."
  value       = module.lnmp.nginx_url
}
