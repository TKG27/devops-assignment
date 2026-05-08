output "cluster_name" {
  description = "EKS Cluster Name"

  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS Control Plane"

  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security Group ID attached to cluster"

  value = module.eks.cluster_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM Role used by EKS Cluster"

  value = module.eks.cluster_iam_role_name
}

output "node_group_iam_role_name" {
  description = "IAM Role used by Node Group"

  value = module.eks.eks_managed_node_groups["default"].iam_role_name
}

output "region" {
  value = var.region
}
