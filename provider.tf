# provider details
provider "aws" {
    version = "~> 2.0"

    # region selection
    region = var.my_region

    # shared file authentication
    shared_credentials_file = "./config/aws-credentials"
}
