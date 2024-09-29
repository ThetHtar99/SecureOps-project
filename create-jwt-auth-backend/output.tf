output "admin_role" {
  value = vault_jwt_auth_backend_role.example.role_name
  description = "Admin Role Name"
  
}

output "admin_bound_claim" {
  value = vault_jwt_auth_backend_role.example.bound_claims
  description = "Bound Claim Name"
  
}

