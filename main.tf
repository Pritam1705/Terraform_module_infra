###############################################
# AWS Load Balancer Listener Rule
###############################################

resource "aws_lb_listener_rule" "lb_listener_rule" {
  listener_arn  = data.terraform_remote_state.asg_state.outputs.http_listener_arn
  priority      = var.listener_rule_priority

  condition {
    path_pattern {
      values = var.path_patterns
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

# security group
resource "aws_security_group" "security_group" {
  vpc_id      = data.terraform_remote_state.network_skeleton_state.outputs.vpc_id

  dynamic "ingress" {
    for_each = var.enable_attendance_access ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.postgresSQL_port
      to_port     = var.postgresSQL_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.attendance_state.outputs.attendance_security_group_id]
      description      = "Allow traffic from attendance on port 8080"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_salary_access ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.scylla_port
      to_port     = var.scylla_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.salary_state.outputs.salary_security_group_id]
      description      = "Allow traffic from salary on port 8080"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_employee_access ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.scylla_port
      to_port     = var.scylla_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.employee_state.outputs.employee_security_group_id]
      description      = "Allow traffic from employee on port 8080"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_employee_access_for_redis ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.redis_port
      to_port     = var.redis_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.employee_state.outputs.employee_security_group_id]
      description      = "Allow traffic from employee on port 8080"
    }
  }


  dynamic "ingress" {
    for_each = var.enable_salary_access_for_redis ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.redis_port
      to_port     = var.redis_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.salary_state.outputs.salary_security_group_id]
      description      = "Allow traffic from salary on port 8080"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_attendance_access_for_redis ? [1] : [] # Conditional logic for database access rule
    content {
      from_port   = var.redis_port
      to_port     = var.redis_port
      protocol    = var.tcp_protocol
      security_groups = [data.terraform_remote_state.attendance_state.outputs.attendance_security_group_id]
      description      = "Allow traffic from attendance on port 8080"
    }
  }

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.sg_name
    Environment = var.environment
  }
}


# compute

resource "aws_instance" "database_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.private_key_name
  subnet_id              = data.terraform_remote_state.network_skeleton_state.outputs.database_subnet_id
  security_groups        = [aws_security_group.security_group.id]

  ebs_block_device {
    device_name           = var.device_name 
    volume_size           = var.ebs_volume_size        
    volume_type           = var.ebs_volume_type    
    delete_on_termination = var.delete_on_termination       
  }

    tags = {
    Name = local.instance_name
    Environment = var.environment
  }

}
