# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl git unzip wget build-essential lib32gcc-s1 jq \
    libstdc++6 \
    lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/* \
# Set workdir
WORKDIR /app

# Copy your SA:MP project
COPY . .

# Copy local sampctl and extract
COPY sampctl_1.11.3_linux_amd64.tar.gz /tmp/sampctl.tar.gz
RUN tar -xzf /tmp/sampctl.tar.gz -C /usr/local/bin && rm /tmp/sampctl.tar.gz

# Ensure dependencies and build
RUN sampctl ensure
RUN sampctl build

# Expose default SA:MP port
EXPOSE 7777/udp

# Start the server
CMD ["sampctl", "run"]
