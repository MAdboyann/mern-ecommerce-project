provider "aws" {
  region = "us-east-1"
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
