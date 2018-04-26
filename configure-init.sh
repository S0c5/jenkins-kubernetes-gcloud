#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
echo -e "${GREEN}========= CONFIG JENKINS CONTAINER!! ==========${NC}"
echo "You are configuring your jenkins container, please remember"
echo "add a volume for keep it"
echo -e "${GREEN}===============================================${NC}"

sed -i '6,9 s/^/#/' /var/jenkins_home/.bashrc
echo "source /sdk/google-cloud-sdk/path.bash.inc" >> /var/jenkins_home/.bashrc
. /var/jenkins_home/.bashrc
gcloud auth login
gcloud components install kubectl
gcloud components install docker-credential-gcr
gcloud init
gcloud auth configure-docker

echo -e "${GREEN} =============== DONE! =================== ${NC}"
echo -e "If you want to configure kubernetes run: ${CYAN} gcloud container clusters get-credentials CLUSTER_NAME ${NC}"
echo -e "${GREEN} ========================================= ${NC}"