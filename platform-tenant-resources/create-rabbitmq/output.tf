output "out_rabbitmq_release_name" {
  value = helm_release.rabbitmq.metadata.0.name
}

output "out_rabbitmq_username" {
  value = var.rabbitmq_username
  sensitive = true
}

output "out_rabbitmq_password" {
  value = random_password.rabbitmq_password.result
  sensitive = true
}
