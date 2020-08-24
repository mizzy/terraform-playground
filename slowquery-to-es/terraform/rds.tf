resource "aws_rds_cluster" "slowquery_source" {
  cluster_identifier              = "slowquery-source"
  master_username                 = "root"
  master_password                 = "password"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.slowquery_source_dbcluster_aurora56.name
  enabled_cloudwatch_logs_exports = [
    "slowquery",
  ]
  apply_immediately   = true
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "slowquery_source" {
  identifier          = "slowquery-source"
  cluster_identifier  = aws_rds_cluster.slowquery_source.id
  instance_class      = "db.t2.small"
  publicly_accessible = true
  apply_immediately   = true
}

output "RDS_ENDPOINT" {
  value = aws_rds_cluster_instance.slowquery_source.endpoint
}
