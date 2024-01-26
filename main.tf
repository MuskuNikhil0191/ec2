resource "aws_instance" "demo-ec2" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  availability_zone = var.ec2_azs
  subnet_id         = var.subnet__id
  security_groups   = [var.sg__id]
  tags = {
    "Name" = var.ec2_instance_name
  }

}
