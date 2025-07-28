terraform {
  backend "s3" {
    bucket         = "my-tf-state-jagan-1753723654"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

