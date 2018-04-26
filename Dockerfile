FROM jenkins/jenkins:latest
USER root
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install sudo -y
RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=/sdk
RUN source /sdk/google-cloud-sdk/path.bash.inc && gcloud components install kubectl
RUN chown -R  jenkins:jenkins /sdk
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | sudo -u jenkins bash
RUN apt-get install vim  -y
RUN apt-get update
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN  lsb_release -cs
RUN apt-get update && apt-get install docker-ce gettext-base -y
RUN usermod -aG docker jenkins
ADD ./configure-init.sh .
RUN chown jenkins:jenkins /configure-init.sh && chmod +x /configure-init.sh
USER jenkins