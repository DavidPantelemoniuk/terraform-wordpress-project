variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "sg_ids" { type = list(string) }
variable "key_name" {}
variable "user_data_file" {}
