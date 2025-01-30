# AWS ECR Tools

This repository contains tools and scripts to manage AWS Elastic Container Registry (ECR) resources.

## Prerequisites

- AWS CLI installed and configured
- Docker installed

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/cloudsteak/aws-tools.git
    cd aws-tools/ecr
    ```

2. Install dependencies (if any).

## Usage

### Login to ECR

To login to your ECR registry, run:
```sh
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
```

### Build and Push Docker Image

1. Build your Docker image:
    ```sh
    docker build -t <your-image-name> .
    ```

2. Tag your Docker image:
    ```sh
    docker tag <your-image-name>:latest <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-image-name>:latest
    ```

3. Push your Docker image to ECR:
    ```sh
    docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-image-name>:latest
    ```

## License

This project is licensed under the MIT License.