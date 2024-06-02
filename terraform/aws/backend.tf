terraform {
  backend "s3" {
    bucket = "s3-dev-aws-test-state-file"
    key    = "dev.s3test.state"
    region = "ap-southeast-2"
  }
}
