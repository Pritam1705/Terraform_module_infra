
data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "us-east-1"
  }
}

