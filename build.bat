set /p version=<VERSION
set image=ghcr.io/jfmatth/justneverlift
podman login ghcr.io
podman build . -t %image%:%version%
podman push %image%:%version%