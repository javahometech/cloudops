# Creating a VPC
resource "aws_vpc" "CLOUD_OPS_VPC" {
  cidr_block = "${var.CLOUDOPS_VPC_CIDR}"

  tags {
    Name = "CloudOpsVPC"
  }
}

# Create internet gateway & attach it to cloud ops vpc

resource "aws_internet_gateway" "CLOUD_OPS_IGW" {

  vpc_id = "${aws_vpc.CLOUD_OPS_VPC.id}"

  tags {
    Name = "CloudOpsIGW"
  }
}
