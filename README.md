# jenkins-kubernetes-gcloud
This repository has a container with a preconfigured jenkins with kubectl and gcloud tools.

![](https://github.com/JMGVDEV/jenkins-kubernetes-gcloud/blob/master/Cloud_Base.jpeg)

### Configure

1. Please edit config.env and add your custom domain for claim the ssl certificates with letsencrypt
2. crate a machine a config the env, you can do it with: 

```bash
  $ PROJECT_ID={YOUR_PROJECT_ID} INSTANCE_TYPE={INSTANCE_TYPE} INSTANCE_SIZE={INSTANCE_SIZE_IN_GBS} INSTANCE_NAME={INSTANCE_NAME} ./create-google-machine.sh
```

***Example***

```bash
  $ ROJECT_ID=a-fake-project INSTANCE_NAME=batman-ci-jenkins INSTANCE_TYPE=n1-standard-1 INSTANCE_SIZE=50 ./create-machine.sh
```

### RUN 

Now you can do the magic, run the container;

```bash
  $ make run 
```



## Contributions


Feel free to contribute to this project! 

happy hacking and devops!

