variable vpc_id {
  description = "VPC where you want to build resources."
}

variable "region" {
  default="eu-west-1"
  description = "AWS datacentre region. The default one is Ireland."
}

variable "availability_zone" {
  default = "eu-west-1a"
  description = "Availability zone within the selected region."
}

variable "profile" {
  default = "default"
  description = "If you are using multiple accounts on your machine. You can specify some of the profiles you have defined in ~/.aws/credentials"
}

variable "private_key_path" {
  description = "Path to private key used for connecting to created EC2 resources."
}

variable "keypair_name" {
  description = "Name of keypair in AWS, this will be used to secure created EC2 instances."
}

variable "ubuntu_ami" {
  default = "ami-07ee42ba0209b6d77" // Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
  description = "Base image, expected to be Ubuntu Server 16.04 LTS. Beware if you change region, you have to update AMI because they differ across regions."
}

variable "ec2_size" {
  default = "t2.large"
  description = "Size of created EC2 instance. t3a.medium will cost you $25/month if you keep it running 24/7."
}

variable "ec2_tag" {
  default = "Indyscan"
  description = "Given name for the created EC2 instance."
}

variable "custom_security_group_ids" {
  type    = list(string)
  default = []
}
