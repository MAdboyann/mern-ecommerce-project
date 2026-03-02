resource "kubernetes_service" "frontend" {
  metadata {
    name      = "frontend-service"
    namespace = "mern-app"
  }

  spec {
    selector = {
      app = "frontend-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}