variable "project_name" {
  type = string
}
variable "customer_name" {
  type = string
}
variable "customertag" {
  type = string
}
variable "project_stage" {
  type = string
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
  type = string
}
variable "tags" {
  description = "Standard tags to apply to all resources"
  type        = map(string)
}
