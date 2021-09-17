Terraform Module for building LNMP(Linux+Nginx+MySQL+PHP) envrionment on Alibaba Cloud.  
terraform-alicloud-lnmp
----------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-lnmp/blob/master/README-CN.md)

Terraform module which creates lnmp(Linux+Nginx+MySQL+PHP) based on ecs on Alibaba Cloud. 

These types of resources are supported:

* [ECS Instance](https://www.terraform.io/docs/providers/alicloud/r/instance.html)

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

```hcl
module "lnmp"  {
  source  = "terraform-alicloud-modules/lnmp/alicloud"
  region                     = "cn-beijing"                
  profile                    = "Your-TF-Profile"
  
  instance_name              = "myLNMP"
  instance_password          = "YourPassword123"
  instance_type              = "ecs.c5.large"
  system_disk_category       = "cloud_efficiency"
  security_group_ids         = ["sg-12345678"]
  vswitch_id                 = "vsw-fhuqiexxxxxxxxxxxx"
  internet_max_bandwidth_out = 50

  db_name          = "YourdbName"
  db_user          = "YourAccountName"
  db_password      = "YourdbPassword"
  db_root_password = "YourPassword"
}
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-lnmp/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

