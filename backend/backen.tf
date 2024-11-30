# backend.tf

provider "aws" {
  region = "us-east-1"
  profile = "wna-test"
}
# Crear el bucket de S3 para el estado remoto
resource "aws_s3_bucket" "terraform_state" {
  bucket = "fs-wna.test"  # Elige un nombre único
}

# Crear la tabla DynamoDB para el bloqueo de estado
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}