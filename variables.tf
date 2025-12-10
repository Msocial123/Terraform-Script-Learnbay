# provider region
variable "aws_region" {
  description = "AWS region"
  type        = string
}

# vpc variables

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type        = string
}

variable "instance_tenancy" {
  description = "vpc instance tenancy"
    type        = string
}

variable "vpc_name" {
  description = "vpc name"
    type        = string
}

# public subnet variables

variable "public_cidr_block" {
  description = "public cidr block"
  type = string
}

variable "public_subnet_name" {
  description = "public subnet name"
  type = string
}

# private subnet variables
variable "private_cidr_block" {
  description = "private cidr block"
  type = string
}

variable "private_subnet_name" {
  description = "private subnet name"
  type = string
}

# internet gateway variables
variable "igw_name" {
  description = "internet gateway name"
  type = string
}

# public route table variables
variable "public_rt_name" {
  description = "public route table name"
  type = string
}

variable "public_cidr_block_rt" {
  description = "public rt cidr block"
    type = string
}

# eip variables
variable "eip_name" {
  description = "eip name"
  type = string
}

# nat gateway variables
variable "nat_gw_name" {
  description = "nat gateway name"
    type = string   
}

# pvt route table variables
variable "pvt_rt_name" {
  description = "private route table name"
  type = string
}

variable "pvt_cidr_block_rt" {
  description = "private rt cidr block"
    type = string   
}

# security group variables
variable "sg_name" {
  description = "security group name"
  type = string
}

# public instance variables
variable "public_instance_name" {
  description = "instance name"
  type = string
}

variable "public_instance_ami" {
  description = "instance ami"
  type = string
}

variable "public_instance_type" {
  description = "instance type"
  type = string
}

variable "key_name" {
  description = "key pair name"
  type = string
}

variable "public_instance_associate_ip_add" {
  description = "public vm ip add"
  type = bool
}

# pvt instance variables
variable "private_instance_name" {
  description = "private instance name"
  type = string
}

variable "private_instance_ami" {
  description = "private instance ami"
  type = string
}

variable "private_instance_type" {
  description = "private instance type"
  type = string
}

variable "pvt_instance_associate_ip_add" {
  description = "pvt vm ip add"
  type = bool
}

