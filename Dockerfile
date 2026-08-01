FROM ubuntu:26.04

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libc6:i386 \
    libnss3:i386 \
    libnss-mdns:i386 \
    libnss-systemd:i386 \
    lib32z1 \
    lib32gcc-s1 \
    lib32stdc++6 \
    libatomic1:i386 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN bash compile.sh
COPY . .
RUN chmod +x omp-server

CMD ["./omp-server"]