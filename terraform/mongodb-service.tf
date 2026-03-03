resource "kubernetes_service" "mongodb" {
  metadata {
    name      = "mongodb-svc"
    namespace = kubernetes_namespace.mern.metadata[0].name
  }

  spec {
    cluster_ip = "None"

    selector = {
      app = "mongodb-app"
    }

    port {
      port        = 27017
      target_port = 27017
    }
  }
}