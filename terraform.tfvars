# provider variables values
aws_region = "ap-south-1"

# vpc variables values

vpc_cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
vpc_name = "murali-vpc"

# public subnet variables values
public_cidr_block = "10.0.1.0/24"
public_subnet_name = "murali-public-subnet"

# private subnet variables values
private_cidr_block = "10.0.2.0/24"
private_subnet_name = "murali-private-subnet"

# internet gateway variables values
igw_name = "murali-igw"

# public route table variables values
public_rt_name = "murali-public-rt"
public_cidr_block_rt = "0.0.0.0/0"

# eip variables values
eip_name = "murali-eip"

# nat gateway variables values
nat_gw_name = "murali-nat-gw"

# pvt route table variables values
pvt_rt_name = "murali-private-rt"
pvt_cidr_block_rt = "0.0.0.0/0"

# security group variables values
sg_name = "murali-sg"

# public instance variables values
public_instance_name = "murali-public-instance"
public_instance_ami = "ami-02b8269d5e85954ef"
public_instance_type = "t3.micro"
key_name = "kp-1"
public_instance_associate_ip_add = true

# private instance variables values
private_instance_name = "murali-private-instance"  
private_instance_ami = "ami-02b8269d5e85954ef"
private_instance_type = "t3.micro"
pvt_instance_associate_ip_add = false   