output "secrets" {
  description = "A map of secrets created in AWS Secrets Manager with their ARNs."
  value       = { for k, v in aws_secretsmanager_secret.secret_keys : k => v.arn }
}
