# Kubernetes cluster name
output "k8s_cluster_name" {
  value = "${local.cluster_name}"
}

# Kubernetes master version
output "k8s_master_version" {
  value = "${local.current_k8s_version}"
}

# Kubeconfig path
output "kubeconfig_path" {
  value = abspath("${path.module}/output/kubeconfig-gke-${var.gke_cluster_index}")
}