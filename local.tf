# security group

locals {
  sg_name = "${var.environment}-${var.database_name}-sg"
}



# security group

locals {
  instance_name = "${var.environment}-${var.database_name}-server"
}



