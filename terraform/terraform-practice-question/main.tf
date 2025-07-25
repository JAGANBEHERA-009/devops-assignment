resource "aws_instance" "ec2_instance"{
ami="ami-042b4708b1d05f512"
instance_type=var.instance_type
tags={
name="1st_ec2"
}
}
