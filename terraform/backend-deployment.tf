resource "kubernetes_deployment" "backend" {
  metadata {
    name      = "backend-deployment"
    namespace = "mern-app"
    labels = {
      app = "backend-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "backend-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend-app"
        }
      }

      spec {
        container {
          name  = "backend-container"
          image = "manthan010/backend:${var.image_tag}"

          port {
            container_port = 8000
          }

          env_from {
            config_map_ref {
              name = "backend-config"
            }
          }

          resources {
            limits = {
              cpu    = "300m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}