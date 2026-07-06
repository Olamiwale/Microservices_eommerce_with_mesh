#ALB Security Group

resource "aws_security_group" "alb" {
    name       = "${var.environment}-alb-sg"
    description = "Security group for ALB"
    vpc_id     = var.vpc_id

    ingress {
        description = "HTTPS from internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP from internet"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-alb-sg"
        Environment = var.environment
    }
}


#App Security Group - only allow traffic from ALB Security Group

resource "aws_security_group" "app" {
    name       = "${var.environment}-app-sg"
    description = "EKS Node Group Security Group"
    vpc_id     = var.vpc_id

    ingress {
        description = "Traffic from ALB"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        security_groups = [aws_security_group.alb.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-app-sg"
        Environment = var.environment
    }
}

# RDS Security Group - only allow traffic from App Security Group

resource "aws_security_group" "rds" {
    name       = "${var.environment}-rds-sg"
    description = "RDS Security Group"
    vpc_id     = var.vpc_id

    ingress {
        description = "PostgreSQL from app only"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        security_groups = [aws_security_group.app.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-rds-sg"
        Environment = var.environment
    }
}


#Elasticache Security Group - only allow traffic from App Security Group
resource "aws_security_group" "elasticache" {
    name       = "${var.environment}-elasticache-sg"
    description = "Elasticache Security Group"
    vpc_id     = var.vpc_id

    ingress {
        description = "Redis from app only"
        from_port   = 6379
        to_port     = 6379
        protocol    = "tcp"
        security_groups = [aws_security_group.app.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-elasticache-sg"
        Environment = var.environment
    }
}
