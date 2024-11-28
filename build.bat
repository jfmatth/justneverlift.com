set version=0.21
set image=ghcr.io/jfmatth/justneverlift
podman build . -t %image%:%version%
podman push %image%:%version%