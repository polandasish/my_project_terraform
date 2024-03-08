resource "aws_iam_role_policy" "test_policy" {
  name = "project_policy"
  role = aws_iam_role.project_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
          "eks:*",
          "elasticloadbalancing:*",
          "ecr:*",
          "cloudwatch:*",
          "s3:*",
          "rds:*",
          "logs:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "project_role" {
  name = "project_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["ec2.amazonaws.com","eks.amazonaws.com"]
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2-host-profile" {
    role = aws_iam_role.project_role.id
    name = "role-for-eks"
    path = "/"
  
}