resource "kubernetes_namespace" "traefik_system" {
  metadata {
    annotations = {
      name = "traefik-system"
    }

    name = "traefik-system"
  }
}

resource "helm_release" "ingress-traefik" {
  name       = "ingress-traefik"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  namespace  = "traefik-system"
  values = [
    "${file("./traefik-values.yaml")}"
  ]
}