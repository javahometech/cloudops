# Create PublicSubnet-1

resource "aws_subnet" "PUBLIC_SUBNET_1" {
  vpc_id     = "${aws_vpc.CLOUD_OPS_VPC.id}"
  cidr_block = "${var.PUBLIC_SUBNET_1}"
  availability_zone = "${var.AVAILABILITY_ZONES[0]}"
  tags {
    Name = "PublicSubnet-1"
  }
}

# Create PublicSubnet-2

resource "aws_subnet" "PUBLIC_SUBNET_2" {
  vpc_id     = "${aws_vpc.CLOUD_OPS_VPC.id}"
  cidr_block = "${var.PUBLIC_SUBNET_2}"
  availability_zone = "${var.AVAILABILITY_ZONES[1]}"
  tags {
    Name = "PublicSubnet-2"
  }
}

# Create a route table forpublic subnets

resource "aws_route_table" "PUBLIC_SUBNETS_ROUTE_TABLE"{
  vpc_id = "${aws_vpc.CLOUD_OPS_VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.CLOUD_OPS_IGW.id}"
  }
  tags{
    Name = "PublicSubnetRouteTable"
  }
}
# Associate public_subnet_1 with public route table

resource "aws_route_table_association" "PUBICSUBNET_1_ASSOCIATION" {
  subnet_id      = "${aws_subnet.PUBLIC_SUBNET_1.id}"
  route_table_id = "${aws_route_table.PUBLIC_SUBNETS_ROUTE_TABLE.id}"
}

# Associate public_subnet_2 with public route table

resource "aws_route_table_association" "PUBICSUBNET_2_ASSOCIATION" {
  subnet_id      = "${aws_subnet.PUBLIC_SUBNET_2.id}"
  route_table_id = "${aws_route_table.PUBLIC_SUBNETS_ROUTE_TABLE.id}"
}
