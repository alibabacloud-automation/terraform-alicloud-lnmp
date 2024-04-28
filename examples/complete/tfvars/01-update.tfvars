instance_name              = "update-tf-test-lnmp"
instance_password          = "YourPassword123!update"
instance_charge_type       = "PrePaid"
private_ip                 = "172.16.0.11"
internet_charge_type       = "PayByBandwidth"
internet_max_bandwidth_out = "20"
deletion_protection        = false
force_delete               = true
tags = {
  Name = "update-tf-lnmp"
}
volume_tags = {
  Name = "update-tf-lnmp"
}