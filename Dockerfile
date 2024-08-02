FROM debian:12

ADD --checksum=sha256:13a87cec79f2d05f40f125629e4b509080a5c0286608bea273e36be9809ecaba \
	--chmod=644 https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg \
	/etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

RUN echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

RUN apt-get -y update \
	&& apt-get -y install \
		proxmox-auto-install-assistant \
	&& apt-get clean

ENTRYPOINT ["proxmox-auto-install-assistant"]
