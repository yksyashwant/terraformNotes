resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" # Specify the desired CIDR block for your VPC

  tags = {
    Name = "MyVPC"
  }
}
#A public subnet is a subnet that is associated with a route table that has a route to an Internet gateway. 
# This connects the VPC to the Internet and to other AWS services.
resource "aws_subnet" "public_subnet" {
  count             = 2
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Public-Subnet-${count.index}"
  }
}
#A private subnet is a subnet that is associated with a route table that doesn’t have a route to an internet gateway. 
resource "aws_subnet" "private_subnet" {
  count             = 2
  cidr_block        = "10.0.${count.index + 2}.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Private-Subnet-${count.index}"
  }
}
#Why Public Subnet 
#The resources in the public subnet can send outbound traffic directly to the Internet and vice versa. 
#For example web server needs to be accessed by users from the internet.   
#Why Private Subnet 
#Resources like database may require connection to internet for updates/patches but should not be accepting request from the internet. 
#In such cases a private subnet is to be used.

#Internet gateway — A gateway that you attach to your VPC to enable communication between resources in your VPC and the internet.
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name="my_igw"
  }
}

#Route table — A set of rules, called routes, that are used to determine where network traffic is directed.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_nat_gateway" "my_nat_gateway" {
  count         = 2
  allocation_id = aws_eip.nat_ip[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id
}

resource "aws_eip" "nat_ip" {
  count = 2
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0" # For IPv4
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway[0].id
}



resource "aws_route_table_association" "private_subnet_association" {
  count          = 2
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_security_group" "my_sg" {
  name_prefix = "my-sg-"
  vpc_id      = aws_vpc.my_vpc.id

  // Define your security group rules here
  // For example:
  // ingress {
  //   from_port   = 80
  //   to_port     = 80
  //   protocol    = "tcp"
  //   cidr_blocks = ["0.0.0.0/0"]
  // }
}

resource "aws_network_acl" "my_nacls" {
  vpc_id = aws_vpc.my_vpc.id

  subnet_ids = [
    aws_subnet.public_subnet[0].id,
    aws_subnet.public_subnet[1].id,
    aws_subnet.private_subnet[0].id,
    aws_subnet.private_subnet[1].id
  ]

  // Define your NACL rules here
  // For example:
  // ingress {
  //   rule_number   = 100
  //   protocol      = "tcp"
  //   action        = "allow"
  //   cidr_block    = "0.0.0.0/0"
  //   from_port     = 80
  //   to_port       = 80
  // }
  // egress {
  //   rule_number   = 100
  //   protocol      = "tcp"
  //   action        = "allow"
  //   cidr_block    = "0.0.0.0/0"
  //   from_port     = 80
  //   to_port       = 80
  // }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
