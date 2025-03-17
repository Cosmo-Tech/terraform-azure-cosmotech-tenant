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
  description = "The Project stage"
  type        = string
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
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
