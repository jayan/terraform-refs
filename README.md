
# React deployment

Project Title: React Deployment Capstone Project
 
Application:-
clone the below repositry and deploy the application (Run     application in port 80)

Repo URL:- https://github.com/sriram-R-krishnan/devops-build

## git clone 

To clone the these 
```bash
  git clone https://github.com/sriram-R-krishnan/devops-build
```
Docker:
Dockerize the application by creating a Dockerfile.
Create a docker-compose file to use the above image.

# TO dockerzing the the application 
install a docker on  machine by using docker.sh file that i uploaded in repo located in installation directory.
And copy the all the files from the cloned reposity to a directory called devops-Capstone

```bash
  cp -r devops-build/build /root/devops-capstone
```
create docker file 
```bash
  nano dockerfile
```
heres the dockerfile content 
```bash
  # Use the official Ubuntu base image
  FROM nginx:latest
  COPY . /usr/share/nginx/html/
```
And create docker compose file to use the image 
```bash
  nano docker-compose.yaml
```
here is the docker compose-file content 
```bash
version: '3'
services:
  app:
    image: ${IMAGE_NAME} # here i utilized the environmental varible to get the image 
    ports:
      - "80:80"  
```


Bash Scripting:
Write 2 scripts
build.sh for building docker images.
deploy.sh for deploying the image to server.

# write a bash  scripting 
create a build.sh file to build an image 
```bash
  nano build.sh
```
here is the scripting file of bash.sh
```bash
#!/bin/bash

# Incremented count for image name
IMAGE_COUNT=$(($(docker images | grep -c "^react") + 1))

# Build and tag the Docker image without using cache
docker build --no-cache -t "react:${IMAGE_COUNT}" .

# Echo the image name
echo "Built Docker image: react:${IMAGE_COUNT}"
```
create a deploy.sh file  for deployment 

```bash
  nano deploy.sh
```

heres the deploy.sh file contnet 
```bash
 #!/bin/bash

# Docker Hub username
DOCKER_USERNAME="cjayanth"

# Check the argument passed
if [[ "$1" == "devchanged" ]]; then
    echo "Tagging and pushing image to dev repository..."
    IMAGE_COUNT="$2"  # Use the count passed as an argument
    docker tag "react:${IMAGE_COUNT}" "${DOCKER_USERNAME}/dev:Latest${IMAGE_COUNT}"
    docker push "${DOCKER_USERNAME}/dev:Latest${IMAGE_COUNT}"
    export IMAGE_NAME="react:${IMAGE_COUNT}"  # Export before running docker-compose
    docker compose up -d
elif [[ "$1" == "devmergedmaster" ]]; then
    echo "Tagging and pushing image to prod repository..."
    IMAGE_COUNT="$2"  # Use the count passed as an argument
    docker tag "react:${IMAGE_COUNT}" "${DOCKER_USERNAME}/prod:Latest${IMAGE_COUNT}"
    docker push "${DOCKER_USERNAME}/prod:Latest${IMAGE_COUNT}"
    docker push "${DOCKER_USERNAME}/dev:Latest${IMAGE_COUNT}"
    export IMAGE_NAME="react:${IMAGE_COUNT}"  # here Exported the image before running docker-compose
    docker compose up -d
else
    echo "Invalid argument. Please provide either 'devchanged' or 'devmergedmaster'."
    exit 1
fi
  
```

Version Control:
Push the code to github to dev branch (use dockerignore & gitignore file).
Note: Use only CLI for related git commands.

# create a repositry on git hub default should be master 

clone the repositry using 
```bash
  git clone https://github.com/jayan/final-project.git
```
copy all files and directories from devops-capstone to cloned repo
And use git commands to push the code to the git hub 
now  create a branch called dev  and chekout to dev
```bash
  git checkout -b dev
```
create .gitignore and .dockerignore file  in case want ignore particular files to prevent the push  to central repo
and use gitcommands to push all the files directory into a central  dev repo
```bash
  git add .
  git commit -m "commiting first time
  git origin push master
```







Docker hub:
Create 2 repos "dev" and "prod" to push images.
"Prod" repo must be private and "dev" repo can be public.

#Docker hub:
Create 2 repos "dev" and "prod" to push images.
"Prod" repo must be private and "dev" repo can be public.


Jenkins:
Install and configure jenkins build step as per needs to build, push & deploy the application.
Connect jenkins to the github repo with auto build trigger from both dev & master branch.
 If code pushed to dev branch, docker image must build and pushed to dev repo in docker hub.
If dev merged to master, then docker image must be pushed to prod repo in docker hub.

#jenkins installation 
install jenkins on machine by using jenkins.sh file that was uploaded in my repo located in installation directory run the jenkins.sh file directly by using 
```bash
  bash jenkins.sh
```
#configure the required plugins  according to the requirement

Connect jenkins to the github repo with auto build trigger from both dev & master branch



AWS:
Launch t2.micro instance and deploy the create application.
Configure SG as below:
Whoever has the ip address can access the application
Login to server can should be made only from your ip address



