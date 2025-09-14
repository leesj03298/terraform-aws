
locals {
  vpc_flow_logs = [
    # { ## Sample: Default VPC Flow Log to CloudWatch
    #   identifier               = "default"
    #   vpc_id                   = string
    #   cloudwatch_log_group_arn = optional(string)
    #   iam_role_arn             = optional(string)
    # },
    # { ## Sample: Default VPC Flow Log to S3
    #   identifier               = "default"
    #   vpc_id                   = string
    #   log_destination_type     = "s3"
    #   s3_bucket_arn            = optional(string)
    # }
  ]
}