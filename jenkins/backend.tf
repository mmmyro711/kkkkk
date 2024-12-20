terraform {
  backend "s3" {
    bucket = "terraform-session-jan-backend-myroslav" # backend s3 bucket name
    key    = "class/jan24/jenkins/network.tfstate"    # backend path and file name
    region = "us-east-1"
  }
}