terraform {
  backend "s3" {
    bucket = "tfstate.mizzy"
    key    = "all.tfstate"
    region = "ap-northeast-1"
  }
}
