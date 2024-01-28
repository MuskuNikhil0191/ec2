variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ec2_ami" {
  type    = string
  default = "ami-0dfcb1ef8550277af"
}
variable "ec2_instance_name" {
  type    = string
  default = "demo-ec2"
}
variable "ec2_azs" {
  type        = string
  description = "Availability Zones"
  default     = "us-east-1a"
}
variable "subnet1__id" {
  type    = string
  default = "subnet_id"
}
variable "subnet2__id" {
  type    = string
  default = "subnet_id"
}
variable "sg__id" {
  type    = string
  default = "sg_id"
}
variable "lt_name" {
  type = string
}
variable "asg_azs" {
  type = list(string)
}
variable "asg_name" {
  type = string
}
variable "lb__tg__id" {
  type = string
}
