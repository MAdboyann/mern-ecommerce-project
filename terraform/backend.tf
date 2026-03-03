terraform {
  backend "s3" {
    bucket         = "mern-terraform-state-753675398885"
    key            = "mern-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}