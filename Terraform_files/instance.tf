resource "aws_instance" "project-ec2" {
    instance_type = var.instance-type[1]
    ami = data.aws_ami.amazon-linux.id
    subnet_id = aws_subnet.subnet-pub-1.id
    key_name = aws_key_pair.project-key.key_name 
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.my-sgw.id]
    availability_zone = var.availability_zone[0]
    user_data = file("script.sh")
    iam_instance_profile = aws_iam_instance_profile.ec2-host-profile.id
    root_block_device {
      volume_size = 20
      volume_type = "gp2"
      delete_on_termination = true  
    }
    tags = {
      Name= "${var.project}-ec2-instance"
    }

  
}