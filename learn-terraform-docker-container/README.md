Now we've installed Terraform, we can provision an NGINX server in less than a minute using Docker on Mac. I tried this on my mac but the same script will work for windows and unix as well.

Prerequisite : Docker and terraform shouild be installed on your local machine 

step. 1. Crearte a working dirtectory named  learn-terraform-docker-container

    mkdir learn-terraform-docker-container
step. 2. Navigate into the working directory.

        cd learn-terraform-docker-container
step. 3. In the working directory, copy the main.tf

Step. 4. Initialize the project, which downloads a plugin called a provider that lets Terraform interact with Docker.

        terraform init

step. 5. Provision the NGINX server container with apply. When Terraform asks you to confirm type yes and press ENTER.

        terraform apply
step.6. Verify the existence of the NGINX container by visiting localhost:8000 in your web browser or running docker ps to see the container.


    ADMINs-MacBook-Pro:learn-terraform-docker-container admin$ docker ps -a
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
    f13d8f00fe3c   021283c8eb95   "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes   0.0.0.0:8000->80/tcp   tutorial

step. 7. To stop the container, run terraform destroy.

    terraform destroy
