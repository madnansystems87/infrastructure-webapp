terraform {
  backend "s3" {
    bucket         = "eks-state-prodenv-terraform"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-lock"
  }
}