---

# YOLO Web Application Deployment Explanation

## Choice of the Base Image on Which to Build Each Container

### Client Container:
- **Base Image:** `node:14-alpine3.16`
- **Reasoning:** This image is a lightweight version of Node.js, ideal for building and running a React application. The Alpine variant ensures a smaller image size, reducing the attack surface and improving build speed.

### Backend Container:
- **Base Image:** `node:14-alpine3.16`
- **Reasoning:** This image provides a lightweight and efficient environment for running a Node.js backend application, making it suitable for production environments.

### MongoDB Container:
- **Base Image:** `mongo:latest`
- **Reasoning:** This is the official MongoDB image, ensuring compatibility and reliability. It includes all necessary dependencies to run MongoDB out of the box.

## Dockerfile Directives Used in the Creation and Running of Each Container

### Client Dockerfile:
- **Build Stage:** Utilizes `node:14-alpine3.16` to install dependencies and build the application.
- **Production Stage:** Utilizes `node:16-alpine3.16` to create a production-ready environment containing only the necessary build artifacts.

### Backend Dockerfile:
- **Directives:** The Dockerfile sets the working directory, installs dependencies, copies the application code, and exposes port 5000 for the Node.js application.

## Docker-Compose Networking (Application Port Allocation and a Bridge Network Implementation)

### Docker-Compose Networking:
- A bridge network named `app-network` is created to enable communication between the client, backend, and MongoDB containers. This network isolates the application from other Docker networks, enhancing security.

## Docker-Compose Volume Definition and Usage

### Volume Definition:
- A named volume `mongo_data` is created to persist MongoDB data, ensuring that the data remains intact even if the MongoDB container is stopped or removed.

## Git Workflow Used to Achieve the Task

### Branches:
- **`master`:** The main branch for deployment.
- **`Stage two`:** A feature branch used for implementing and testing Terraform.

### Commits:
- Regular commits with descriptive messages to track progress and changes.
- Ensured at least 10 meaningful commits throughout the project development.

### Status:
- The client and backend images were built successfully.
- The application runs with Docker Compose, though the GitHub Actions workflow encountered an error due to incorrect Docker Hub authentication.

### Debugging Measures:
- Verified the Docker Hub access token and ensured it is correctly stored in GitHub Secrets.
- Reviewed and corrected the `docker/login-action` step in the GitHub Actions workflow.

### Image Tagging:
- Used git commit count as tags for Docker images.
- Example tags: `yolo-client:1`, `yolo-client:2`

![client_img](images/client_img.png)
![backend_img](images/backend_img.png)

## Ansible Playbook Explanation

### Overview
This Ansible playbook automates the deployment of the YOLO application, utilizing multiple roles that manage various aspects of the deployment process. 

### Variables:
- **`docker_version`:** Specifies the Docker version to install.
- **`app_repo`:** URL of the application repository.
- **`app_dir`:** Directory to clone the application into.

### Roles:
1. **`clone_git`:** Clones the application repository from the specified Git source.
2. **`dependencies`:** Installs all necessary system packages and dependencies.
3. **`docker-compose`:** Manages the installation and configuration of Docker Compose.
4. **`docker`:** Installs and starts Docker on the target servers.
5. **`mongodb`:** Deploys and configures the MongoDB container.
6. **`deploy`:** Handles the deployment of the backend and client containers, building images and running containers as required.

### Playbook Execution Order:
1. **Install Necessary Packages:** Prepares the environment by installing required system packages.
2. **Install and Start Docker:** Sets up Docker on the target servers.
3. **Clone the Application Repository:** Uses Git to clone the project repository into the specified directory.
4. **Build and Run the Web Application Container:** Utilizes Docker to build and run the client and backend containers.
5. **Run the MongoDB Container:** Deploys MongoDB using the official Docker image, ensuring data persistence through volumes.

### Tags:
- `install_packages`
- `install_docker`
- `start_docker`
- `clone_repo`
- `run_web_container`
- `run_mongo_container`

 