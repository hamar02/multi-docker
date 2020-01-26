FROM ubuntu:18.04 as builder
WORKDIR '/app'
EXPOSE 7000/udp
COPY ./LinuxServer/ ./
Run chmod -x MobileAFKMultiplayerServer.sh
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser
CMD sh MobileAFKMultiplayerServer.sh