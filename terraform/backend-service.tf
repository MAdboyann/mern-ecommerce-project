resource "kubernetes_service" "backend" {
  metadata {
    name      = "backend-service"
    namespace = "mern-app"
  }

  spec {
    selector = {
      app = "backend-app"
    }

    port {
      port        = 8000
      target_port = 8000
    }

    type = "ClusterIP"
  }
}