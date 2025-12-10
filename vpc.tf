# create a vpc

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_name
  }
}

# create public subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_block

  tags = {
    Name = var.public_subnet_name
  }
}

# create pvt subnet

resource "aws_subnet" "pvt" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr_block

  tags = {
    Name = var.private_subnet_name
  }
}

# create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

# create public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_cidr_block_rt
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# associate public subnet with public route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# create eip
resource "aws_eip" "lb" {
  tags = {
    Name = var.eip_name
  }
}

# create nat gateway

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = var.igw_name
  }
}

# create pvt route table
resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.pvt_cidr_block_rt
    gateway_id = aws_nat_gateway.example.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# associate public subnet with pvt route table

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pvt.id
  route_table_id = aws_route_table.pvt_rt.id
}

# create security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = var.sg_name
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

# create public instance

resource "aws_instance" "public_instance" {
  ami           = var.public_instance_ami
  instance_type = var.public_instance_type
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  subnet_id = aws_subnet.public.id
  key_name = var.key_name
  associate_public_ip_address = var.public_instance_associate_ip_add


  tags = {
    Name = var.public_instance_name
  }
}

# create pvt instance

resource "aws_instance" "pvt_instance" {
  ami           = var.private_instance_ami
  instance_type = var.private_instance_type
  subnet_id = aws_subnet.pvt.id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  key_name = var.key_name
  associate_public_ip_address = var.pvt_instance_associate_ip_add


  tags = {
    Name = var.private_instance_name
  }
}