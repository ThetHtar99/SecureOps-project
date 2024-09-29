output "vault_private_endpoint" {
    value  = hcp_vault_cluster.aws_hcp_vault_cluster.vault_private_endpoint_url
}

output "vault_namespace"  {
  value = hcp_vault_cluster.aws_hcp_vault_cluster.namespace
}

output "vault_version"{
  value = hcp_vault_cluster.aws_hcp_vault_cluster.vault_version
}