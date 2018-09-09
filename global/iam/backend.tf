terraform {
  backend "s3" {
    bucket = "tfstate.mizzy"
    key    = "global/iam.tfstate"
    region = "ap-northeast-1"
  }
}
