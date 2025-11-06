# Base image with Docker daemon
FROM docker:24-dind

# Install required packages
RUN apk add --no-cache \
        bash \
        git \
        curl \
        jq \
        tar \
        gzip \
        unzip \
        openssh-client \
        bash-completion \
        python3 \
        py3-virtualenv \
    && python3 -m ensurepip \
    && python3 -m pip install --upgrade pip

# Install AWS CLI v2 (avoids pip issues)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Install Helm
RUN curl -LO https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.12.0-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && rm -rf linux-amd64 helm-v3.12.0-linux-amd64.tar.gz

# Docker daemon runs in background via dockerd-entrypoint.sh
ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD ["--host=unix:///var/run/docker.sock"]
