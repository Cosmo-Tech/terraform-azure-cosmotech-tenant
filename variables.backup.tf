variable "backup_create" {
  type = bool
}

variable "backup_repeating_time_intervals" {
  type    = list(string)
  default = ["R/2021-05-19T06:33:16+00:00/PT24H"]
}