variable "create_rabbitmq" {
  description = "Whether to create RabbitMQ resources"
  type        = bool
}

variable "rabbitmq_listener_username" {
  type = string
}

variable "rabbitmq_sender_username" {
  type = string
}