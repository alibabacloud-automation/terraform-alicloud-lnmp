data "alicloud_zones" "default" {
}

data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_images" "default" {
  name_regex = "centos_7"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  instance_charge_type = var.instance_charge_type
}

# Create a new vpc using terraform module
module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

# Create a new security group using terraform module
module "security_group" {
  source              = "alibaba/security-group/alicloud"
  vpc_id              = module.vpc.this_vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
}

module "lnmp" {
  source = "../.."

  # ECS instance
  number_of_instances = 1
  use_num_suffix      = true

  instance_name     = var.instance_name
  instance_password = var.instance_password
  image_id          = data.alicloud_images.default.images.0.id
  instance_type     = data.alicloud_instance_types.default.instance_types.0.id

  instance_charge_type = var.instance_charge_type
  system_disk_category = "cloud_efficiency"
  system_disk_size     = var.system_disk_size

  security_group_ids = [module.security_group.this_security_group_id]
  vswitch_id         = module.vpc.this_vswitch_ids[0]
  private_ip         = var.private_ip

  internet_charge_type        = var.internet_charge_type
  associate_public_ip_address = true
  internet_max_bandwidth_out  = var.internet_max_bandwidth_out

  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  deletion_protection = "false"
  force_delete        = var.force_delete
  tags                = var.tags
  data_disks = [{
    name        = "data_disks_name"
    size        = 20
    category    = "cloud_efficiency"
    description = "tf-lnmp-description"
    encrypted   = true
  }]
  volume_tags = var.volume_tags

  db_name          = "YourdbName"
  db_user          = "YourAccountName"
  db_password      = "123456"
  db_root_password = "123456"
}