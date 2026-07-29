# Base image
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    curl git unzip wget build-essential lib32gcc-s1 jq \
    libstdc++6 lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/*





COPY sampctl_1.11.3_linux_amd64.tar.gz /tmp/
RUN tar -xzf /tmp/sampctl_1.11.3_linux_amd64.tar.gz -C /tmp/ \
    && mv /tmp/sampctl /usr/local/bin/ \
    && chmod +x /usr/local/bin/sampctl \
    && rm /tmp/sampctl_1.11.3_linux_amd64.tar.gz

WORKDIR /app
COPY . .
RUN sampctl build --forceEnsure
# Expose default SA:MP port
EXPOSE 7777/udp


# Start the SA:MP server directly
CMD ["sampctl", "run"]


# docker run -d \
#   --name db \
#   -p 3306:3306 \
#   --default-authentication-plugin=mysql_native_password \
#   -e MYSQL_ROOT_PASSWORD=rootpassword \
#   -e MYSQL_DATABASE=szkodnikrp \
#   -e MYSQL_USER=www \
#   -e MYSQL_PASSWORD=123 \
#   mysql:8.0