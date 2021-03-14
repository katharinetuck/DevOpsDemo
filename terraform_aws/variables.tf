variable "region" {
    default = "us-east-1"

}
variable "ami-id" {
    default = "ami-0d5d1a3aa3516231f"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "availability_zone" {
    default = "us-east-1a"
}
variable "public_key" {
    default = "us-east-1a"
    type = string
    default = "ssh-rsa FOO"

}

