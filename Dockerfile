# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    lib32gcc-s1 libstdc++6 lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy your SA:MP project (including compiled .amx files in gamemode and filterscripts)
COPY . .

# Expose default SA:MP port
EXPOSE 7777/udp

# Start the server directly
CMD ["./samp03svr"]
