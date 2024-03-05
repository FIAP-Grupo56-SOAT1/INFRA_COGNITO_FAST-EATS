terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }

  backend "s3" {
    bucket = "bucket-fiap56-to-remote-state"
    key    = "aws-cognito-fiap56/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "default_vpc" {
}

# Provide references to your default subnets
resource "aws_default_subnet" "default_subnet_a" {
  # Use your own region here but reference to subnet 1a
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "default_subnet_b" {
  # Use your own region here but reference to subnet 1b
  availability_zone = "us-east-1b"
}

#resource "aws_default_subnet" "default_subnet_c" {
#  # Use your own region here but reference to subnet 1b
#  availability_zone = "us-east-1c"
#}

// Resources
resource "aws_cognito_user_pool" "user_pool" {
    name = "user-pool-feasteasts"

      username_attributes = ["email"]
        auto_verified_attributes = ["email"]
          password_policy {
                minimum_length = 6
          }

            verification_message_template {
                  default_email_option = "CONFIRM_WITH_CODE"
                      email_subject = "Account Confirmation"
                          email_message = "Your confirmation code is {####}"
            }

              schema {
                    attribute_data_type      = "String"
                        developer_only_attribute = false
                            mutable                  = true
                                name                     = "email"
                                    required                 = true

                                        string_attribute_constraints {
                                                min_length = 1
                                                      max_length = 256
                                        }
              }
}

resource "aws_cognito_user_pool_client" "client" {
    name = "cognito-client-feateats"

      user_pool_id = aws_cognito_user_pool.user_pool.id
        generate_secret = false
          refresh_token_validity = 90
            prevent_user_existence_errors = "ENABLED"
              explicit_auth_flows = [
                    "ALLOW_REFRESH_TOKEN_AUTH",
                        "ALLOW_USER_PASSWORD_AUTH",
                            "ALLOW_ADMIN_USER_PASSWORD_AUTH"
              ]
                
}

resource "aws_cognito_user_pool_domain" "cognito-domain" {
    domain       = "feasteats"
      user_pool_id = "${aws_cognito_user_pool.user_pool.id}"
}
}
              ]
}
                                        }
              }
            }
          }
}

