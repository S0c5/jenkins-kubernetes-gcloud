#!/bin/bash
export $(envsubst < config.env | xargs) > /dev/null 2>&1
docker-compose -f docker-app.yml up --build -d