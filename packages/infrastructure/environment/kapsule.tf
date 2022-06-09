resource "scaleway_k8s_cluster" "k8s-cluster-hr4impact" {
  name        = "k8s-cluster-${var.env}-hr4impact"
  description = "K8S Cluster Hr4impact ${var.env}"
  version     = "1.23.6"
  cni         = "calico"
  autoscaler_config {
    disable_scale_down              = false
    scale_down_delay_after_add      = "5m"
    estimator                       = "binpacking"
    expander                        = "random"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
    expendable_pods_priority_cutoff = -5
  }
}

resource "scaleway_k8s_pool" "k8s-pool-hr4impact" {
  cluster_id  = scaleway_k8s_cluster.k8s-cluster-hr4impact.id
  name        = "kapsule-pool-${var.env}-hr4impact"
  node_type   = "DEV1-M"
  size        = 1
  autoscaling = true
  autohealing = true
  min_size    = 1
  max_size    = 5
}

output "cluster_url" {
  value = scaleway_k8s_cluster.k8s-cluster-hr4impact.apiserver_url
}

resource "local_file" "kubeconfig" {
  content  = scaleway_k8s_cluster.k8s-cluster-hr4impact.kubeconfig[0].config_file
  filename = "${path.module}/kubeconfig"
}


resource "null_resource" "kubeconfig" {
  depends_on = [scaleway_k8s_pool.k8s-pool-hr4impact] # at least one pool here
  triggers = {
    host                   = scaleway_k8s_cluster.k8s-cluster-hr4impact.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.k8s-cluster-hr4impact.kubeconfig[0].token
    cluster_ca_certificate = scaleway_k8s_cluster.k8s-cluster-hr4impact.kubeconfig[0].cluster_ca_certificate
  }
}
