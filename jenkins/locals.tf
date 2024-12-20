# Define the common tags for all resources
locals {
  common_tags = {
    Team    = "DevOps"
    Env     = "Prod"
    Purpose = "Class"
  }
}