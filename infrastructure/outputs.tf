output "asg_name" {
  value = "${aws_autoscaling_group.web-asg.id}"
}
