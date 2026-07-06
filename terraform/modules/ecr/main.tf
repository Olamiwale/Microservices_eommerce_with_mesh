resource "aws_ecr_repository" "services" {
    for_each = toset([
        "product-service",
        "cart-service",
        "order-service",
        "payment-service",
        "user-service",
        "inventory-service",
        "shipping-service",
        "notification-service"
    ])

    name                 = each.value
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        Environment = var.environment
        Project     = "e-commerce"
    }
}

resource "aws_ecr_lifecycle_policy" "services" {
    for_each = aws_ecr_repository.services
    repository = each.value.name

    policy = jsonencode({
        rules = [
            {
                rulePriority = 1
                description  = "Expire untagged images older than 30 days"
                selection    = {
                    tagStatus    = "untagged"
                    countType    = "sinceImagePushed"
                    countUnit    = "days"
                    countNumber  = 30
                }
                action       = {
                    type = "expire"
                }
            }
        ]
    })
}