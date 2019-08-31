# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}


resource "aws_autoscaling_group" "web-asg" {
  availability_zones   = ["eu-central-1b","eu-central-1c","eu-central-1a"]
  name                 = "terraform-example-asg"
  max_size             = "${var.asg_max}"
  min_size             = "${var.asg_min}"
  desired_capacity     = "${var.asg_desired}"
  force_delete         = true
  launch_configuration = "${aws_launch_configuration.web-lc.name}"
#  load_balancers       = ["${aws_elb.web-elb.name}"]
  vpc_zone_identifier  = ["${var.subnet_id}"]

  #vpc_zone_identifier = ["${split(",", var.availability_zones)}"]
  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = "true"
  }
}

resource "aws_launch_configuration" "web-lc" {
  name          = "terraform-example-lc"
  image_id      = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = true

  # Security group
  security_groups = ["${aws_security_group.default.id}"]
  user_data       = "${file("userdata.sh")}"

}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
  name        = "terraform_example_sg"
  description = "Used in the terraform"
  vpc_id      = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
