resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend-deployment"
    namespace = "mern-app"

    labels = {
      app = "frontend-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "frontend-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend-app"
        }
      }

      spec {
        container {
          name  = "frontend-cont"
          image = "manthan010/frontend:${var.image_tag}"

          port {
            container_port = 80
          }

          env {
            name  = "REACT_APP_API_URL"
            value = "http://backend-service:8000"
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }

            limits = {
              cpu    = "300m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}