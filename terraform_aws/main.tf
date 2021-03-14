provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test-env.id
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.test-env.id
  cidr_block = "10.0.8.0/24"
  availability_zone = var.availability_zone
  }

resource "aws_route_table" "rt_test_env" {
  vpc_id = aws_vpc.test-env.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.rt_test_env.id
}
resource "aws_security_group" "sg_22" {
    name = "sg_22"
    vpc_id = aws_vpc.test-env.id
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
  }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
 }
}
resource "aws_instance" "dev-ops-demo" {
  ami = "ami-0459be4bd9a69a5fb"
  instance_type = "t2.micro"
  
  
  security_groups = [aws_security_group.sg_22.id]

  subnet_id = aws_subnet.subnet-1.id
  key_name         = "ssh-key"
  
}
resource "aws_eip" "ip-test-env" {
  instance = aws_instance.dev-ops-demo.id
  vpc      = true
}
resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.public_key


}
