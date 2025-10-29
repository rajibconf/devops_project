FROM ubuntu:22.04

LABEL maintainer="Rajib Mahmud"

RUN apt-get update && apt-get install -y \
    curl \
    git \
    nano && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]
