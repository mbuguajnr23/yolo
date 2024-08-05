
# YOLO Web Application

## Requirements

Before you start, ensure you have the following installed on your host machine:

- [Node.js](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04)
- npm
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) (start the MongoDB service with `sudo service mongod start`)

## Client Setup

1. **Navigate to the Client Folder:**

   ```sh
   cd client
   ```

2. **Install Dependencies:**

   ```sh
   npm install
   ```

3. **Start the Client Application:**

   ```sh
   npm start
   ```

## Backend Setup

1. **Open a New Terminal and Navigate to the Backend Folder:**

   ```sh
   cd ../backend
   ```

2. **Install Dependencies:**

   ```sh
   npm install
   ```

3. **Start the Backend Application:**

   ```sh
   npm start
   ```

4. **Add a Product:**
   - The price field only accepts numeric input.

## YOLO Deployment

This project sets up a web application using Docker and Vagrant, consisting of a frontend client, a backend service, and a MongoDB database.

## Prerequisites

Ensure you have the following installed on your host machine:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/) (or another supported provider)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Project Structure

The project is organized as follows:

```
/path/to/project
├── Dockerfile.client            # Dockerfile for the client application
├── Dockerfile.backend           # Dockerfile for the backend service
├── docker-compose.yml           # Docker Compose configuration
├── inventory                    # Ansible inventory file
├── playbook.yml                 # Ansible playbook for provisioning
├── Vagrantfile                  # Vagrant configuration file
└── roles                        # Ansible roles
    ├── backend                  # Backend role
    ├── client                   # Client role
    ├── docker                   # Docker role
    ├── docker_network           # Docker network role
    └── mongodb                  # MongoDB role
```

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/mbuguajnr23/yolo.git
cd yolo
```

### 2. Set Up Vagrant

1. **Start the Vagrant Machine:**

   ```sh
   vagrant up
   ```

   This command sets up a virtual machine, installs necessary packages, and provisions it using Ansible.

### 3. Set Up Docker Containers

1. **SSH into the Vagrant Machine:**

   ```sh
   vagrant ssh
   ```

2. **Navigate to the Project Directory Inside the VM:**

   ```sh
   cd /vagrant
   ```

3. **Build and Start the Docker Containers:**

   ```sh
   docker-compose up --build
   ```

### 4. Access the Application

- **Frontend Client:** [http://localhost:3000](http://localhost:3000)
- **Backend API:** [http://localhost:5000](http://localhost:5000)
- **MongoDB:** Accessible at `localhost:27017` (for local development and testing)

### 5. Stopping the Application

1. **Stop the Docker Containers:**

   ```sh
   docker-compose down
   ```

2. **Halt the Vagrant Machine:**

   ```sh
   vagrant halt
   ```

## Troubleshooting

If you encounter issues:

- **Vagrant Provisioning:** Check the Vagrant provisioning logs for errors.
- **Docker Containers:** Check the logs of the Docker containers for issues.
- **Network Issues:** Ensure ports are properly forwarded and services are accessible.

## Contributing

Contributions are welcome! Please submit pull requests or open issues to contribute to the project.
