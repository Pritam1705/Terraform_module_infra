output "security_group_id" {
  value = aws_security_group.security_group.id

}

output "db_server_id" {
  value = aws_instance.database_server.id
}
