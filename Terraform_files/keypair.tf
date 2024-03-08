resource "aws_key_pair" "project-key" {
  key_name = "demokey"
  public_key = file("demokey.pem.pub")
}