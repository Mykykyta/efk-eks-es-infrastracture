module "eks" {
  source                                             = "terraform-aws-modules/eks/aws"
  cluster_name                                       = var.cluster_name
  cluster_version                                    = "1.19"
  subnets                                            = module.vpc.private_subnets
  cluster_endpoint_private_access                    = true
  vpc_id                                             = module.vpc.vpc_id
  cluster_create_security_group                      = true
  worker_create_cluster_primary_security_group_rules = true
  worker_create_security_group                       = true
  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                 = "worker-group-1"
      instance_type        = "t3.large"
      asg_desired_capacity = 1
    },
  ]

}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {}
