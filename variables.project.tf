variable "project_name" {
  description = "The project name"
}

variable "customer_name" {
  description = "The customer name"
}

variable "customertag" {
  type = string
}

variable "project_stage" {
  description = "The platform stage"
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Demo",
      "Prod"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod."
  }
}

variable "cost_center" {
  description = "The value associated to a resource (tag)"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}
