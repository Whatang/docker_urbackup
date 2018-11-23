FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive
ARG VERSION=2.2.11
ENV VERSION ${VERSION}
ARG ARCH=amd64
ENV FILE urbackup-server_${VERSION}_${ARCH}.deb
ENV URL https://www.urbackup.org/downloads/Server/${VERSION}/${FILE}

ADD ${URL} /root/${FILE}

RUN apt-get update \
	&& echo "/var/urbackup" | apt-get install -y /root/${FILE} \
	&& rm /root/${FILE} && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623/udp

VOLUME [ "/var/urbackup", "/var/log", "/usr/share/urbackup" ]
ENTRYPOINT ["/usr/bin/urbackupsrv"]
CMD ["run"]
