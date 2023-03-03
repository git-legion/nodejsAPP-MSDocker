## Time : 5 days (From Project 1-6)

# node-application
This is a API and microservices based Demo node application which contains separate Frontend Backend and the database used is mysql. 

## Project 1 
* task 1 : Go through the code of the application. understand about the ports to expose to connect the frontend backend and the database mysql.
### Note : Go through the code and understand about the port on which applications have been exposed .To establish successful connections make sure mysql container should get ready before the backend container , as backend will work only when it gets connected to mysql container
* task 2 : Run the application in local environment and check the connectivity with the database.
* task 3 : Create a repository on your github account and push the code there using cli.

## Project 2
* task 1 : Create dockerfile for frontend and backend and containerize the frontend and backend.
* task 2 : Run the containers on localhost. make sure that after running frontend backend and database of the application is running fine and the database is connected.
* task 3 : Push the Dockerfile on your github repository.
* task 4 : Attach volume with the containers.

## Project 3
* tast 1 : Create jenkins CI job to automate the build of image for frontend and backend and push it on docker hub whenever there is any change in the code the pipeline will triggered automatically.
* task 2 : Create jenkins CD jobs to host the application on local environment.
* task 3 : Link the jobs(up-stream and down-stream). If the build job successfully run the cd will trrigers automatically. 

## Project 4
* task 1 : Create manifest files to host the application on (k8s). Create seprate deployment and services for frontend, backend and mysql servers.
* task 2 : Host the application on kubernetes cluster.
* task 3 : Replicas of frontend are 10 and backend are 10 and one mysql database.
* task 4 : Make a new github repository and push the yamls on github repository.

## Project 5
* task 1 : Create jenkins CD jobs to host the application on a kubernetes cluster environment.

## Project 6
* task 1 : Clone the new version of the application v2 from the github repo https://github.com/sh-cmd/node-project-giit-v2.git .
* task 2 : Push the application in new branch named Dev
* task 3 : Create a dev environment for the application.
* task 4 : Update the virsion 2 of the application on the dev environment using k8s menifest file with the rolling update strategy. Make sure the minReadySeconds will be 10 sec and the maxUnavailable pods will be 2 and maxSurge will be 2.
* task 5 : If the application is updated with no downtime than update the application version v2 by merging the branch on master.

## Project 7
* task 1 : write a terraform to make ansible cluster on AWS EC2s with 1 master node and 3 worker node with best practice.

## Project 8
* task 1 : write ansible playbooks to automate the configuration k8s cluster with kubedeam.
