resource "aws_vpc" "proj-vpc" {
  cidr_block = "10.3.0.0/16"
  tags = {
     Name = "project-vpc" 
  }
}

resource "aws_subnet" "subnet-pub-1" {
  cidr_block="10.3.1.0/24"
  availability_zone = var.availability_zone[0]
  vpc_id = aws_vpc.proj-vpc.id
  tags = {
    Name= "${var.project}-subnet1"
  }
}
resource "aws_subnet" "subnet-pub-2" {
    cidr_block = "10.3.2.0/24"
    availability_zone = var.availability_zone[2]
    vpc_id = aws_vpc.proj-vpc.id
    tags = {
      Name= "${var.project}-subnet2"
    }
  
}
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.proj-vpc.id
  tags = {
    Name = "${var.project}-igw"
  }
}

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.proj-vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  

  
}



resource "aws_route_table_association" "subnet-association" {
  subnet_id = aws_subnet.subnet-pub-1.id
  route_table_id = aws_route_table.my-rt.id
  
}

resource "aws_route_table_association" "subnet-association-2" {
    subnet_id = aws_subnet.subnet-pub-2.id
    route_table_id = aws_route_table.my-rt.id
  
}



