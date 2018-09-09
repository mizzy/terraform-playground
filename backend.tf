terraform {
  backend "s3" {
    bucket = "tfstate.mizzy"
    key    = "flat.tfstate"
    region = "ap-northeast-1"
  }
}
