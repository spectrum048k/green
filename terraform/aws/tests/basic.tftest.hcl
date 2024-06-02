# run "setup" {
#   command = apply
#   module {
#     source = "./tests/setup"
#   }
# }

run "test_resource_creation" {
  command = plan

  assert {
    condition = startswith(aws_s3_bucket.s3_bucket.bucket, "s3-")
    error_message = "CodeCommit repository name ${var.bucket_name} did not start with the expected value of s3-****’."
  }
}