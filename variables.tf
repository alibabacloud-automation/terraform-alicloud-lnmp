
##################
# ECS instance
##################
variable "number_of_instances" {
  description = "The number of instances to be created."
  type        = number
  default     = 1
}

variable "use_num_suffix" {
  description = "Always append numerical suffix(like 001, 002 and so on) to instance name and host name, even if number_of_instances is 1"
  type        = bool
  default     = false
}

variable "instance_name" {
  description = "The name of ECS Instance."
  type        = string
  default     = ""
}

variable "instance_password" {
  description = "The password of instance."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The image id used to launch one ecs instance. If not specified, it will be obtained through the data source of Centos 7."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The instance type used to launch instance."
  type        = string
  default     = "ecs.c5.large"
}

variable "instance_charge_type" {
  description = "The charge type of instance. Choices are 'PostPaid' and 'PrePaid'."
  type        = string
  default     = "PostPaid"
}

variable "system_disk_category" {
  description = "The system disk category used to launch instance."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_size" {
  description = "The system disk size used to launch instance.Default to '40'."
  type        = number
  default     = 40
}

variable "security_group_ids" {
  description = "A list of security group ids to associate with Instance."
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch instance in VPC."
  type        = string
  default     = ""
}

variable "private_ip" {
  description = "Configure Instance private IP address."
  type        = string
  default     = ""
}

variable "internet_charge_type" {
  description = "The internet charge type of ECS instance. Choices are 'PayByTraffic' and 'PayByBandwidth'."
  type        = string
  default     = "PayByTraffic"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public ip address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "internet_max_bandwidth_out" {
  description = "The maximum internet out bandwidth of instance."
  type        = number
  default     = 10
}

variable "resource_group_id" {
  description = "The Id of resource group which the instance belongs."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Whether enable the deletion protection or not. 'true': Enable deletion protection. 'false': Disable deletion protection."
  type        = bool
  default     = false
}

variable "force_delete" {
  description = "If it is true, the 'PrePaid' instance will be change to 'PostPaid' and then deleted forcibly. However, because of changing instance charge type has CPU core count quota limitation, so strongly recommand that 'Don't modify instance charge type frequentlly in one month'."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the Instance."
  type        = map(string)
  default     = {}
}

variable "data_disks" {
  description = "Additional data disks to attach to the scaled instance."
  type        = list(map(string))
  default     = []
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = {}
}

#db
variable "db_name" {
  description = "The mysql db name."
  type        = string
  default     = ""
}

variable "db_user" {
  description = "The mysql db user name."
  type        = string
  default     = ""
}

variable "db_password" {
  description = "The mysql db password."
  type        = string
  default     = ""
}

variable "db_root_password" {
  description = "The mysql db password."
  type        = string
  default     = ""
}