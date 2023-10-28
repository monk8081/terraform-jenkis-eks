terraform {
  backend "s3" {
    bucket = "monkcicd-terraform-eks"
    key    = "jenkins/terraform.fstate"
    region = "us-east-1"
  }
}
