resource "aws_security_group" "ecs" {

  name = "ecs-security-group"

  description = "Allow traffic to ECS containers"

  vpc_id = var.vpc_id


  ingress {

    from_port = var.container_port

    to_port = var.container_port

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  tags = {

    Name = "ecs-security-group"

  }

}

resource "aws_security_group" "alb" {

  name = "alb-security-group"

  description = "Allow internet traffic to ALB"

  vpc_id = var.vpc_id


  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  tags = {

    Name = "alb-security-group"

  }

}