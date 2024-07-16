provider "aws" {
  region = var.region
}

resource "aws_secretsmanager_secret" "secret_keys" {
  for_each = var.secrets_map
  name     = each.key
}

resource "aws_secretsmanager_secret_version" "secret_values" {
  for_each      = var.secrets_map
  secret_id     = aws_secretsmanager_secret.secret_keys[each.key].id
  secret_string = jsonencode(each.value)
}

output "secrets" {
  description = "A map of secrets created in AWS Secrets Manager with their ARNs."
  value       = { for k, v in aws_secretsmanager_secret.secret_keys : k => v.arn }
}
