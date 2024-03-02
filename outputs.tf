#outputs.tf
output "security_group_id" {
  value       = aws_security_group.rds_pedido_sg.id
}
output "db_instance_endpoint" {
  value       = aws_db_instance.pedido.endpoint
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.pedido.address
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.pedido.port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.pedido.username
  sensitive   = true
}

output "rds_password" {
  description = "RDS instance root senha"
  value       = aws_db_instance.pedido.password
  sensitive   = true
}