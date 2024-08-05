provider "docker" {}

# Define a Docker network
resource "docker_network" "app_network" {
  name = "app-network"
}

# Define a Docker volume for MongoDB data
resource "docker_volume" "mongo_data" {
  name = "mongo_data"
}

# MongoDB container resource
resource "docker_container" "mongodb" {
  image = "mongo:latest"
  name  = "mongodb"

  networks_advanced {
    name = docker_network.app_network.name
  }

  volumes {
    volume_name   = docker_volume.mongo_data.name
    container_path = "/data/db"
  }

  ports {
    internal = 27017
    external = 27017
  }
}

# Backend container resource
resource "docker_container" "backend" {
  image = "mbu9ua/yolo-backend:1.0.0"
  name  = "yolo-backend"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 5000
    external = 5000
  }

  depends_on = [
    docker_container.mongodb
  ]
}

# Client container resource
resource "docker_container" "client" {
  image = "mbu9ua/yolo-client:1"
  name  = "yolo-client"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 3000
    external = 3000
  }

  depends_on = [
    docker_container.backend
  ]
}

output "mongodb_ip" {
  description = "The IP address of the MongoDB container"
  value       = docker_container.mongodb.ip_address
}

output "backend_ip" {
  description = "The IP address of the Backend container"
  value       = docker_container.backend.ip_address
}

output "client_ip" {
  description = "The IP address of the Client container"
  value       = docker_container.client.ip_address
}
