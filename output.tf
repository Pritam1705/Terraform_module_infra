output "salary_security_group_id" {
  value = module.salary_application.security_group_id
}

output "launch_template_id" {
  value = module.salary_application.launch_template_id
}

output "salary_target_group_arn" {
  value = module.salary_application.target_group_arn
}

output "salary_asg_name" {
  value = module.salary_application.asg_name
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = module.salary_application.http_listener_arn
}




