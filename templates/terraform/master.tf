# Google (GKE)
module "gke" {
  source                        = "./modules/gke"
  count                         = var.gke_cluster_count

  enable_gke                    = var.enable_gke
  gke_project                   = var.gke_project
  gke_region                    = var.gke_region
  gke_cluster_name              = var.gke_cluster_name
  gke_cluster_index             = "${count.index + 1}"
  enable_gke_regional_cluster   = false
  gke_node_pool_size            = var.gke_node_pool_size
  gke_node_type                 = var.gke_node_type
  enable_gke_hpa                = true

  owner                         = var.owner
  team                          = var.team
  purpose                       = var.purpose

}

# Amazon (EKS)
module "eks" {
  source                        = "./modules/eks"
  count                         = var.eks_cluster_count

  enable_eks                    = var.enable_eks
  aws_profile                   = var.aws_profile
  eks_region                    = var.eks_region
  eks_cluster_name              = var.eks_cluster_name
  eks_cluster_index             = "${count.index + 1}"
  eks_nodes                     = var.eks_nodes
  eks_min_nodes                 = var.eks_min_nodes
  eks_max_nodes                 = var.eks_max_nodes
  eks_node_type                 = var.eks_node_type

  owner                         = var.owner
  team                          = var.team
  purpose                       = var.purpose
}

# Microsoft Azure (AKS)
module "aks" {
  source                        = "./modules/aks"
  count                         = var.aks_cluster_count

  enable_aks                    = var.enable_aks
  aks_region                    = var.aks_region
  aks_cluster_name              = var.aks_cluster_name
  aks_cluster_index             = "${count.index + 1}"
  aks_nodes                     = var.aks_nodes
  aks_enable_nodes_auto_scaling = var.aks_enable_nodes_auto_scaling
  aks_min_nodes                 = var.aks_min_nodes
  aks_max_nodes                 = var.aks_max_nodes
  aks_node_type                 = var.aks_node_type
  aks_service_principal         = var.aks_service_principal
  aks_managed_identities        = var.aks_managed_identities

  owner                         = var.owner
  team                          = var.team
  purpose                       = var.purpose
}