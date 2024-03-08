resource "aws_security_group" "my-sgw" {
    vpc_id = aws_vpc.proj-vpc.id
    name = "${var.project}-sgw"
    dynamic "ingress" {
        for_each = local.ingress_ports
        content {
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = ingress.value.protocol
        cidr_blocks = ["0.0.0.0/0"]
        }
        
      
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
  
}