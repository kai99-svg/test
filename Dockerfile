# Base image with Docker daemon
FROM docker:24-dind

# Install required packages
RUN apk add --no-cache \
        bash \
        git \
        curl \
        python3 \
        py3-pip \
        jq \
        tar \
        gzip \
        unzip \
        openssh-client \
        bash-completion \
    && pip3 install --upgrade awscli \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/ \
    && curl -LO https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.12.0-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && rm -rf linux-amd64 helm-v3.12.0-linux-amd64.tar.gz

# Keep container running for Jenkins agent
# Docker daemon runs in background via dockerd-entrypoint.sh
ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD ["--host=unix:///var/run/docker.sock"]
