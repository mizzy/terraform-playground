terraform {
  backend "s3" {
    bucket = "tfstate.mizzy"
    key    = "b.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "a" {
  backend = "s3"
  config {
    bucket = "tfstate.mizzy"
    key    = "all.tfstate"
    region = "ap-northeast-1"
  }
}
