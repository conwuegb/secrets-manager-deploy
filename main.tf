provider "aws" {
  region = var.region
}

resource "aws_secretsmanager_secret" "secret_keys" {
  for_each = var.secrets
  name     = each.key
}

resource "aws_secretsmanager_secret_version" "secret_values" {
  for_each      = var.secrets
  secret_id     = aws_secretsmanager_secret.secret_keys[each.key].id
  secret_string = jsonencode(each.value)
}