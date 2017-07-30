# resource "aws_instance" "CLOUD_OPS_NAT" {
#   ami           = "${var.NAT_AMI_ID}"
#   instance_type = "t1.micro"
#   source_dest_check = false
#   subnet_id = ${aws_subnet.PUBLIC_SUBNET_1.id}
#   associate_public_ip_address = true
#   tags {
#     Name = "NATServer"
#   }
# }
