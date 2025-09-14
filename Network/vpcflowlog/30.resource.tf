

# VPC Flow Log - CloudWatch
resource "aws_flow_log" "cloudwatch" {
  for_each                 = { for flowlog in local.vpc_flow_logs : lookup(flowlog, "identifier", "dummy") => flowlog if flowlog.log_destination_type == "cloud-watch-logs" }
  vpc_id                   = each.value.vpc_id
  traffic_type             = lookup(each.value, "traffic_type", "ALL")
  max_aggregation_interval = lookup(each.value, "max_aggregation_interval", 600)
  log_format               = lookup(each.value, "log_format", "${timestamp} ${version} ${srcaddr} ${dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${action} ${log_status}")
  ## Destination: CloudWatch Logs
  log_destination = each.value.cloudwatch_log_group_arn
  iam_role_arn    = each.value.iam_role_arn
}

resource "aws_flow_log" "s3" {
  for_each                 = { for flowlog in local.vpc_flow_logs : lookup(flowlog, "identifier", "dummy") => flowlog if flowlog.log_destination_type == "s3" }
  vpc_id                   = each.value.vpc_id
  traffic_type             = lookup(each.value, "traffic_type", "ALL")
  max_aggregation_interval = lookup(each.value, "max_aggregation_interval", 600)
  log_format               = lookup(each.value, "log_format", "${timestamp} ${version} ${srcaddr} ${dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${action} ${log_status}")
  ## Destination: S3
  log_destination_type = "s3"
  log_destination      = each.value.s3_bucket_arn
}
