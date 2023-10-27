terraform {
  backend "s3" {
    bucket = "monkcicd-terraform-eks"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}