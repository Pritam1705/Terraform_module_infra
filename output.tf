output "attendance_security_group_id" {
  value = module.attendance_application.security_group_id
}

output "attendance_launch_template_id" {
  value = module.attendance_application.launch_template_id
}

output "attendance_target_group_arn" {
  value = module.attendance_application.target_group_arn
}

output "attendance_asg_name" {
  value = module.attendance_application.asg_name
}


output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = module.attendance_application.http_listener_arn
}




