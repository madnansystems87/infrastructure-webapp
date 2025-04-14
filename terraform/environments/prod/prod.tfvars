node_role_arn      = "arn:aws:iam::195361087056:role/EKSNodeRole"
master_role_arn    = "arn:aws:iam::195361087056:role/EKSMasterRole"
key_name           = "keypair-eks-cluster"

users = [
  {
    user_arn = "arn:aws:iam::195361087056:user/madnan"
    username = "madnan"
    groups   = ["system:masters"]
  },
  {
    user_arn = "arn:aws:iam::195361087056:user/eks-user1"
    username = "eks-user1"
    groups   = ["system:masters"]
  }
]

cluster_name       = "my-tf-eks-cluster"
cluster_version    = "1.32"
node_group_name    = "eks-node-group"
environment        = "prod"
vpc_name           = "eks-vpc"
bastion_name       = "prod-bastion"
kubeconfig_path    = "~/.kube/config"
region             = "us-east-1"
cluster_alias      = "eks-cluster"
aws_access_role    = "arn:aws:iam::195361087056:role/github-actions-oidc-role"
