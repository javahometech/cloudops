# Create a route table for private subnets

resource "aws_route_table" "PRIVATE_SUBNETS_ROUTE_TABLE"{
  vpc_id = "${aws_vpc.CLOUD_OPS_VPC.id}"
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   instance_id = "${aws_instance.cloud_ops_nat.id}"
  # }
  tags{
    Name = "PrivateSubnetRouteTable"
  }
}

# Create Private Subnet

resource "aws_subnet" "PRIVATE_SUBNET_1" {
  vpc_id     = "${aws_vpc.CLOUD_OPS_VPC.id}"
  cidr_block = "${var.PRIVATE_SUBNET_1}"
  availability_zone = "${var.AVAILABILITY_ZONES[1]}"
  tags {
    Name = "PublicSubnet-2"
  }
}


# Associate private_subnet_1 with public route table

resource "aws_route_table_association" "PRIVATE_SUBNET_1_ASSOCIATION" {
  subnet_id      = "${aws_subnet.PRIVATE_SUBNET_1.id}"
  route_table_id = "${aws_route_table.PRIVATE_SUBNETS_ROUTE_TABLE.id}"
}
