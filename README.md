# Proxmox Autoinstall ISO Builder

## Build

`docker build -t ghcr.io/somanydoors/proxmox-autoinstall-iso-builder`

## Usage

1. Download the Proxmox 8 install ISO: https://www.proxmox.com/en/downloads/proxmox-virtual-environment/iso
2. Build the ISO

```bash
docker run \
	--name=proxmox-autoinstall-iso-builder \
	-it \
	-v $(pwd):/iso \
	ghcr.io/somanydoors/proxmox-autoinstall-iso-builder \
	prepare-iso /iso/proxmox-ve_8.2-1.iso \
	--fetch-from http \
	--url "https://10.0.0.100/get_answer/" \
	--cert-fingerprint "04:42:97:27:F6:29:2F:9F:3D:7F:13:11:C8:E2:F5:5F:84:03:95:D9:F5:14:72:7C:9E:90:47:03:D2:96:2B:EC"
	--output /iso/proxmox-ve_8.2-1-autoinstall.iso
```

More information about using the `proxmox-auto-install-assistant` tool can be found [in the Proxmox wiki](https://pve.proxmox.com/wiki/Automated_Installation).
