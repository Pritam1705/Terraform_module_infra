data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "attendance_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/application/attendance/terraform.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "salary_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/application/salary/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "employee_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/application/employee/terraform.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "asg_state" {
  backend = "s3"

  config = {
    bucket = "mysnaatak-p11-statefile-test1"
    key    = "env/dev/application/frontend/terraform.tfstate"
    region = "us-east-1"
  }
}

