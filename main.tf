resource "aws_instance" "demo-ec2" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  availability_zone = var.ec2_azs
  subnet_id         = var.subnet1__id
  security_groups   = [var.sg__id]
  # associate_public_ip_address = true
  tags = {
    "Name" = var.ec2_instance_name
  }
  user_data = filebase64("${path.module}/ec2-user-data.sh")
}

resource "aws_launch_template" "demo-launch-template" {
  name          = var.lt_name
  image_id      = var.ec2_ami
  instance_type = var.ec2_instance_type

  monitoring {
    enabled = true
  }

  network_interfaces {
    security_groups             = [var.sg__id]
    associate_public_ip_address = true
    subnet_id                   = var.subnet1__id
  }

  # placement {
  #   availability_zone = var.ec2_azs
  # }

  # vpc_security_group_ids = [var.sg__id]

  user_data = filebase64("${path.module}/ec2-user-data.sh")
}

resource "aws_autoscaling_group" "demo-asg" {
  name = var.asg_name
  # availability_zones = var.asg_azs
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [var.subnet1__id]
  launch_template {
    id      = aws_launch_template.demo-launch-template.id
    version = aws_launch_template.demo-launch-template.latest_version
  }
}

resource "aws_autoscaling_attachment" "demo-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.demo-asg.id
  lb_target_group_arn    = var.lb__tg__id
}
