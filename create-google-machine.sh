#!/bin/bash
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${GREEN}================ PROVISIONING ================${NC}"
echo  "You are creating a instance ($INSTANCE_NAME) with $INSTANCE_SIZE Gbs"
echo "for project $PROJECT_ID with Google Driver"
echo -e "${GREEN}==============================================${NC}"

docker-machine create --driver google \
  --google-project $PROJECT_ID \
  --google-zone us-west1-a \
  --google-machine-type $INSTANCE_TYPE  \
  --google-disk-size $INSTANCE_SIZE \
  $INSTANCE_NAME

echo -e "${GREEN}================ ALMOST DONE ================${NC}"
echo "Setting up your env and connecting with docker-machine ${INSTANCE_NAME}"
eval $(docker-machine env $INSTANCE_NAME)
echo "ready! please EDIT config.env and add your host_name and email for"
echo "issue your ssl certificates."
echo -e "${CYAN} next steps:  ${NC}"
echo -e "${CYAN} 1. ${NC} make letsencrypt"
echo -e "${CYAN} 2. ${NC} make run"
echo -e "${CYAN} 3. ${NC} docker exec -ti jenkins_app /configure-init.sh"
echo -e "${GREEN}==============================================${NC}"