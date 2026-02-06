resource "aws_autoscaling_group" "wordpress" {
  name                      = "wp-asg"
  min_size                  = 2
  desired_capacity          = 2
  max_size                  = 3
  vpc_zone_identifier       = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  launch_template {
    id      = aws_launch_template.wordpress.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "wordpress-asg"
    propagate_at_launch = true
  }
}
