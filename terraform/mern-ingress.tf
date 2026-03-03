resource "kubernetes_ingress_v1" "mern" {
  metadata {
    name      = "mern-ingress"
    namespace = "mern-app"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {

        path {
          path      = "/auth"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/users"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/products"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/orders"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/cart"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/brands"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/categories"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/address"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/reviews"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

        path {
          path      = "/wishlist"
          path_type = "Prefix"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }

 
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "frontend-service"
              port { number = 80 }
            }
          }
        }

      }
    }
  }
}