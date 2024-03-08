data "aws_ami" "ubuntu-ami" {

    most_recent = true 
    filter {
      name = "name"
      values = ["ubuntu/images/*/ubuntu-*-*-amd64-server-*"]
    }
    owners = ["099720109477"]
  
}

data "aws_ami" "amazon-linux" {
    most_recent = true 
    filter {
      name= "name"
      values = ["al2023-ami-2023.3.*.0-kernel-6.1-x86_64"]
    }
    owners = ["137112412989"]
  
}