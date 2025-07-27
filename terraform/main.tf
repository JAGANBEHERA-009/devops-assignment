resource "aws_instance" "myec2"{
ami="ami-042b4708b1d05f512"
instance_type=var.instance_type
}
