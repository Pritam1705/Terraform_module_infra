output "employee_security_group_id" {
  value = module.employee_application.security_group_id
}

output "employee_template_id" {
  value = module.employee_application.launch_template_id
}

output "employee_target_group_arn" {
  value = module.employee_application.target_group_arn
}

output "employee_asg_name" {
  value = module.employee_application.asg_name
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = module.employee_application.http_listener_arn
}




