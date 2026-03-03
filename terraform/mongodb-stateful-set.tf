resource "kubernetes_stateful_set" "mongodb" {
  metadata {
    name      = "mongodb-state"
    namespace = kubernetes_namespace.mern.metadata[0].name
  }

  spec {
    service_name = kubernetes_service.mongodb.metadata[0].name
    replicas     = 1

    selector {
      match_labels = {
        app = "mongodb-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb-app"
        }
      }

      spec {
        container {
          name  = "mongodb-cont"
          image = "mongo:7"

          port {
            container_port = 27017
          }

          volume_mount {
            name       = "mongo-pvc"
            mount_path = "/mnt/data/mongo"
          }
        }
      }
    }

    volume_claim_template {
      metadata {
        name = "mongo-pvc"
      }

      spec {
        access_modes = ["ReadWriteOnce"]

        resources {
          requests = {
            storage = "1Gi"
          }
        }
      }
    }
  }
}