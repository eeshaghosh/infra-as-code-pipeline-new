terraform {
  backend "s3" {
    bucket         = "infra-as-code-pipeline-terraform-state-358103606042"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}