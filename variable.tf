####################################
# listener_rule_priority
####################################

variable "listener_rule_priority" {
  type = number
  default = 2
}

variable "path_patterns" {
  type        = list(string)
  default = [ "/doc" ]
}

variable "target_group_arn" {
  type = string
}





# security group

variable "ssh_port" {
  type = string
  default = "22"
}

variable "tcp_protocol" {
  type = string
  default = "tcp"
}

variable "postgresSQL_port" {
  type = string
  description = "postgresSQL ports"
}

variable "scylla_port" {
  type = string
  description = "salary port"
}

variable "sg_tag" {
  description = "security group name "
  type        = map(string)
  default = {
    name        = "default-sg"
    environment = "dev"
  }
}

variable "enable_attendance_access" {
  type = bool
  default = true
}

variable "enable_salary_access" {
  type = bool
  default = true
}

variable "enable_employee_access" {
  type = bool
  default = true
}

variable "environment" {
  description = "Environment name (e.g., dev, QA, prod)"
  type        = string
  default     = "dev"
}

variable "database_name" {
  type = string
  description = "database_name"
  default = "scyllaDB"
}



# database server

variable "ami_id" {
  type = string
  description = "ami id"
}

variable "instance_type" {
  description = "The instance type . Allowed values are t2.medium and t2.large."
  type        = string

  validation {
    condition     = contains(["t2.micro", "t2.large"], var.instance_type)
    error_message = "Invalid instance type. Allowed values are t2.medium or t2.large."
  }
}


variable "private_key_name" {
  type = string
}

variable "device_name" {
  type = string
  default = "/dev/sda1"
}

variable "ebs_volume_size" {
  type = string
  default = "20"
}

variable "ebs_volume_type" {
  type = string
  default = "gp2"
}

variable "delete_on_termination" {
  type = bool
  default = true
}

variable "server_tag" {
  description = "sever group name "
  type        = map(string)
  default = {
    name        = "default-server"
    environment = "dev"
  }
}


variable "enable_employee_access_for_redis" {
  type = bool
  default = true
}

variable "enable_salary_access_for_redis" {
  type = bool
  default = true
}

variable "enable_attendance_access_for_redis" {
  type = bool
  default = true
}


variable "redis_port" {
  type = number
  default = 6379
}

