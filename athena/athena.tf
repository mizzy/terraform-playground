resource "aws_s3_bucket" "mizzy_athena_test" {
  bucket = "mizzy-athena-test"
}

resource "aws_s3_bucket" "mizzy_athena_test_result" {
  bucket = "mizzy-athena-test-result"
}

resource "aws_athena_database" "sendgrid_monitor" {
  name   = "sendgrid_monitor"
  bucket = aws_s3_bucket.mizzy_athena_test_result.id
}


resource "aws_athena_named_query" "sendgrid_monitor" {
  name     = "create-events-table"
  database = aws_athena_database.sendgrid_monitor.name
  query    = <<EOF
CREATE EXTERNAL TABLE IF NOT EXISTS events (
         email string,
         timestamp int,
         sg_message_id string,
         event string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://${aws_s3_bucket.mizzy_athena_test.id}/';
EOF
}
