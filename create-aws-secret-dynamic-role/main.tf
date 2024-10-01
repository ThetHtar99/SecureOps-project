# resource "vault_aws_secret_backend" "aws" {
#   access_key = aws_iam_user.vault_root.id
#   secret_key = aws_iam_access_key.vault_root.secret
#   region = "ap-southeast-1"
#   path = "aws-master" # customise path
#   default_lease_ttl_seconds = 900
#   max_lease_ttl_seconds = 2000
# }


# resource "vault_aws_secret_backend_role" "role" {
#   backend = vault_aws_secret_backend.aws.path
#   name    = "admin-role"
#   credential_type = "iam_user"

#   policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]

# }

# data "vault_aws_access_credentials" "creds" {
#   backend = vault_aws_secret_backend.aws.path
#   role    = vault_aws_secret_backend_role.role.name
# }


resource "vault_aws_secret_backend" "aws" {
  access_key = aws_iam_access_key.vault_root.id
  secret_key = aws_iam_access_key.vault_root.secret
  region = "ap-southeast-1"
  path = "aws-master"
  default_lease_ttl_seconds = 900
  max_lease_ttl_seconds = 2000
}
resource "vault_aws_secret_backend_role" "role" {
  backend = vault_aws_secret_backend.aws.path
  name    = "admin-role"
  credential_type = "iam_user"
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  
}
data "vault_aws_access_credentials" "creds" {
  backend = vault_aws_secret_backend.aws.path
  role    = vault_aws_secret_backend_role.role.name
}