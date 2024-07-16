variable "region" {
  description = "The AWS region where secrets will be created."
  type        = string
  default     = "us-east-1"
}


variable "secrets" {
  description = "A map of secrets to be created in AWS Secrets Manager. Each key is the secret name, and the value is a map of key-value pairs."
  type        = map(map(string))
  sensitive   = true
}
