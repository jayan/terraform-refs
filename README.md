
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

# dockerrized it 
install a docker on  machine by using docker.sh file that i uploaded in repo located in installation directory.
And copy the all the files from the cloned reposity to a directory called devops-Capstone

```bash
  cp -r . /root/devops-capstone
```
create docker file to 
```bash
  nano dockerfile
```


After that Dockerize the application by creating a Dockerfile.


Create a docker-compose file to use the above image.

Bash Scripting:
Write 2 scripts
build.sh for building docker images.
deploy.sh for deploying the image to server.

Version Control:
Push the code to github to dev branch (use dockerignore & gitignore file).
Note: Use only CLI for related git commands.

Docker hub:
Create 2 repos "dev" and "prod" to push images.
"Prod" repo must be private and "dev" repo can be public.

Jenkins:
Install and configure jenkins build step as per needs to build, push & deploy the application.
Connect jenkins to the github repo with auto build trigger from both dev & master branch.
 If code pushed to dev branch, docker image must build and pushed to dev repo in docker hub.
If dev merged to master, then docker image must be pushed to prod repo in docker hub.

AWS:
Launch t2.micro instance and deploy the create application.
Configure SG as below:
Whoever has the ip address can access the application
Login to server can should be made only from your ip address



