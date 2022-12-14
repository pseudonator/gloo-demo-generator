# ----------------------------------------------------------------------------------
# Common properties
# ----------------------------------------------------------------------------------

variable "owner" {
  description = "Name of the maintainer of the cluster"
  type        = string

  validation {
    condition     = can(length(var.owner) > 0)
    error_message = "Maintainer of the cluster must be provided."
  }
}

variable "team" {
  description = "Team that maintains the cluster"
  type        = string
  default     = "fe-presale"
}

variable "purpose" {
  description = "Purpose for the cluster"
  type        = string
  default     = "pre-sales"
}

# ----------------------------------------------------------------------------------
# Google Kubernetes Engine
# ----------------------------------------------------------------------------------

variable "enable_gke" {
  description = "Enable / Disable Google Kubernetes Engine (Default: `false`)"
  type        = bool
  default     = false
}

variable "gke_cluster_count" {
  description = "Number of GKE clusters (Default: `0`)"
  type        = number
  default     = 0
}

variable "gke_project" {
  description = "GCP Project ID for GKE"
  type        = string

  validation {
    condition     = can(length(var.gke_project) > 0)
    error_message = "GKE project ID of the cluster must be provided."
  }
}

variable "gke_region" {
  description = "GCP region for GKE (Default: `australia-southeast1`, Ref: https://cloud.google.com/compute/docs/regions-zones)"
  type        = string
  default     = "australia-southeast1"
}

variable "gke_cluster_name" {
  description = "GKE cluster name"
  type        = string

  validation {
    condition     = can(length(var.gke_cluster_name) > 0)
    error_message = "GKE cluster name must be provided."
  }
}

variable "gke_node_pool_size" {
  description = "GKE Kubernetes worker nodes (Default: `3`)"
  type        = number
  default     = 3
}

variable "gke_node_type" {
  description = "GKE node instance type (Default: `n1-standard-2`, Ref: https://cloud.google.com/compute/docs/general-purpose-machines)"
  type        = string
  default     = "n1-standard-2"
}

# ----------------------------------------------------------------------------------
# Amazon Elastic Kubernetes Service
# ----------------------------------------------------------------------------------

variable "enable_eks" {
  description = "Enable / Disable Amazon Elastic Kubernetes Service"
  type        = bool
  default     = false
}

variable "eks_cluster_count" {
  description = "Number of EKS clusters (Default: `0`)"
  type        = number
  default     = 0
}

variable "aws_profile" {
  description = "AWS CLI profile (Default: `default`)"
  type        = string
  default     = "default"
}

variable "eks_region" {
  description = "AWS region for EKS (Default: `ap-southeast-2`, Ref: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)"
  type        = string
  default     = "ap-southeast-2"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string

  validation {
    condition     = can(length(var.eks_cluster_name) > 0)
    error_message = "EKS cluster name must be provided."
  }
}

variable "eks_nodes" {
  description = "EKS Kubernetes worker nodes, desired ASG capacity (e.g. `2`)"
  type        = number
  default     = 2
}

variable "eks_min_nodes" {
  description = "EKS Kubernetes worker nodes, minimum ASG capacity (e.g. `1`)"
  type        = number
  default     = 1
}

variable "eks_max_nodes" {
  description = "EKS Kubernetes worker nodes, maximum ASG capacity (e.g. `3`)"
  type        = number
  default     = 3
}

variable "eks_node_type" {
  description = "AWS EC2 node instance type (Default: `t3.medium`, Ref: https://aws.amazon.com/ec2/instance-types)"
  type        = string
  default     = "t3.medium"
}

# ----------------------------------------------------------------------------------
# Microsoft Azure Kubernetes Service
# ----------------------------------------------------------------------------------

variable "enable_aks" {
  description = "Enable / Disable Microsoft Azure Kubernetes Service"
  type        = bool
  default     = false
}

variable "aks_cluster_count" {
  description = "Number of AKS clusters (Default: `0`)"
  type        = number
  default     = 0
}

variable "aks_region" {
  description = "AWS region for EKS (Default: `ap-southeast-2`, Ref: https://docs.microsoft.com/en-us/azure/aks/availability-zones)"
  type        = string
  default     = "Australia East"
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string

  validation {
    condition     = can(length(var.aks_cluster_name) > 0)
    error_message = "AKS cluster name must be provided."
  }
}

variable "aks_nodes" {
  description = "AKS Kubernetes worker nodes (e.g. `2`)"
  type        = number
  default     = 2
}

variable "aks_enable_nodes_auto_scaling" {
  description = "Enable autoscaling for AKS worker nodes based on minimum and maximum limits set below (Default: `false`)"
  type        = bool
  default     = false
}

variable "aks_min_nodes" {
  description = "AKS worker nodes minimum node count"
  type        = number
  default     = null
}

variable "aks_max_nodes" {
  description = "AKS worker nodes maximum node count"
  type        = number
  default     = null
}

variable "aks_node_type" {
  description = "Azure node pool instance type (Default: `Standard_D2_v2`, Ref: https://docs.microsoft.com/en-us/azure/cloud-services/cloud-services-sizes-specs)"
  type        = string
  default     = "Standard_D2_v2"
}

variable "aks_service_principal" {
  description = "Service principal to connect to AKS cluster"
  type        = object({
    object_id     = string
    client_id     = string
    client_secret = string
  })
}

variable "aks_managed_identities" {
  description = "List of managed identities where the AKS service principal should have access."
  type        = list(string)
  default     = []
}

# variable "az_client_id" {
#   description = "Azure Service Principal appId"
#   type        = string
#   default     = ""
# }

# variable "az_client_secret" {
#   description = "Azure Service Principal password"
#   type        = string
#   default     = ""
# }

# variable "az_tenant_id" {
#   description = "Azure Service Principal tenant"
#   type        = string
#   default     = ""
# }