locals {
  itype = {
    dev = "t3.micro"
    test = "c7i-flex.large"
    prod = "m71-flex.large"
    }
  }




resource "aws_instance" "devops" {
tags = {
name = "${terraform.workspace}-Server"

}
ami = var.ami_id
instance_type = local.itype[terraform.workspace]
key_name =  var.kops
count = var.icount
availability_zone = "us-east-2a"
root_block_device {
volume_size = var.ivol
}
}
