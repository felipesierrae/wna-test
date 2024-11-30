resource "aws_security_group" "compute_sg" {
  name        = "compute_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "compute_lt" {
  name_prefix   = "compute-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.compute_sg.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to WNA" > /var/www/html/index.html
              EOF
  )

  # security_group_names = [aws_security_group.compute_sg.name]
}

resource "aws_autoscaling_group" "asg" {
  name_prefix = "test-"
  desired_capacity     = var.min_size
  min_size             = var.min_size
  max_size             = var.max_size
  # availability_zones = ["us-east-1a", "us-east-1b"]
  vpc_zone_identifier  = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.compute_lt.id
    version = "$Latest"
  }

  health_check_type          = "EC2"
  health_check_grace_period = 300
  force_delete               = true
  wait_for_capacity_timeout   = "0"
}
