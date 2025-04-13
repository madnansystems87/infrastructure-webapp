terraform {
  backend "s3" {
    bucket         = "terraform-state-eks-productionenv"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-lock"
  }
}