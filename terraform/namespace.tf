resource "kubernetes_namespace" "mern" {
  metadata {
    name = "mern-app"
  }
}
