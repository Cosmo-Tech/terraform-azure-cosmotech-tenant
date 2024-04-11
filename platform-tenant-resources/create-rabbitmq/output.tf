output "out_rabbitmq_release_name" {
  value = helm_release.rabbitmq.metadata.0.name
}

output "out_rabbitmq_admin_username" {
  value     = var.rabbitmq_admin_username
  sensitive = true
}

output "out_rabbitmq_admin_password" {
  value     = random_password.rabbitmq_admin_password.result
  sensitive = true
}

output "out_rabbitmq_sender_username" {
  value     = var.rabbitmq_sender_username
  sensitive = true
}

output "out_rabbitmq_sender_password" {
  value     = random_password.rabbitmq_sender_password.result
  sensitive = true
}
