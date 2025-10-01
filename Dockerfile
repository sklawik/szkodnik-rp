# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl git unzip wget build-essential lib32gcc-s1 jq \
    libstdc++6 lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy your SA:MP project
COPY . .

# Copy local pawncc compiler and make it executable
COPY pawncc /usr/local/bin/pawncc
RUN chmod +x /usr/local/bin/pawncc

# Optional: compile .pwn locally inside container
# If you already have .amx compiled, możesz pominąć
RUN /usr/local/bin/pawncc gamemodes/szkodnik-rp2.pwn

# Expose default SA:MP port
EXPOSE 7777/udp

# Start the SA:MP server directly
CMD ["./samp03svr"]
