output "azure_resource_group_id" {
  description = "The ID of the Azure Resource Group."
  value       = azurerm_resource_group.rg.id
}

output "aws_s3_bucket_name" {
  description = "The name of the AWS S3 Bucket."
  value       = aws_s3_bucket.bucket.id
}

output "aws_s3_bucket_arn" {
  description = "The ARN of the AWS S3 Bucket."
  value       = aws_s3_bucket.bucket.arn
}
