terraform {
  backend "s3" {
    bucket  = "mysnaatak-p11-statefile-test1"
    key     = "env/dev/application/frontend/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
