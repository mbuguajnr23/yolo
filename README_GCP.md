# YOLO Application on GKE

This repository contains the Kubernetes manifests required to deploy the YOLO application on Google Kubernetes Engine (GKE).

## Live Application

Access the live application at: http://34.35.36.150/

## Deployment Steps

Clone the repository

 

## 1. Install the Google Cloud SDK

1. Make sure your system is up to date.<br>
```bash 
sudo apt update && sudo apt upgrade -y
```

2. Download the latest version of the Google Cloud SDK using curl.<br>

```bash
curl https://sdk.cloud.google.com | bash
```


3. After running the script, restart your shell to ensure the gcloud command is available:.<br>
`exec -l $SHELL`

4. Navigate to the extracted directory and run the installation script.<br>
`cd google-cloud-sdk`
`./install.sh`


5. Initialize the Google Cloud SDK on your directory.<br>
`gcloud init`
Log in to your Google account and select a default project.

6. To verify that the installation was successful, run the following command:<br>
`gcloud --version`


7. Add the SDK to Your PATH<br>
`echo 'export PATH=$PATH:/home/ziza/Desktop/DevOps/yolo/google-cloud-sdk/bin' >> ~/.bashrc`
`source ~/.bashrc`

9. After updating your PATH, try running the gcloud command again:<br>
`gcloud init`


## 2. Enable the Kubernetes Engine API
you can enable the API using the gcloud command:<br>
```bash
gcloud services enable container.googleapis.com
```

## 3.  Creating the GKE Cluster
```bash
     gcloud container clusters [project-ID] \--num-nodes=3 \--zone [Region]
```

**To use this cluster**
```bash
     gcloud container clusters get-credentials [project-ID] --zone [Region] --project 
```

**Verify the configuration**
```bash
       kubectl config current-context
```

## 4. Apply the Kubernetes Manifests
Navigate to the k8s folder and write this command:

```bash
     kubectl apply -f .
```
or

 ```bash
    kubectl apply -f mongo-pv.yaml
    kubectl apply -f mongo-pvc.yaml
    kubectl apply -f mongodb-statefulset.yaml
    kubectl apply -f mongodb-service.yaml
    kubectl apply -f backend-deployment.yaml
    kubectl apply -f backend-service.yaml
    kubectl apply -f frontend-deployment.yaml
    kubectl apply -f frontend-service.yaml
```

## 5. Verify the deployments

**Check Deployments**
check if it has been deployed
```bash
    kubectl get deployments
```

**Check pods**
This checks if the deployments are running
```bash
     kubectl get pods
```

**Check the status of the services**

    ```bash
      kubectl get services

    ```

    Ensure the `EXTERNAL-IP` is assigned to access the frontend and backend.

**Check for Statefulsets**
```bash
    kubectl get statefulsets
```

## 6. Kubernetes Resources

### a. MongoDB StatefulSet

The MongoDB StatefulSet ensures data persistence even if pods restart:

- **File**: `mongodb-statefulset.yaml`
- **Service**: `mongodb-service.yaml`

### 2. Backend Deployment

The backend service handles API requests:

- **File**: `backend-deployment.yaml`
- **Service**: `backend-service.yaml`

### 3. Frontend Deployment

The frontend serves the React application:

- **File**: `frontend-deployment.yaml`
- **Service**: `frontend-service.yaml`



















