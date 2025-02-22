set /p version=<VERSION
set image=ghcr.io/jfmatth/justneverlift.com
podman login ghcr.io
podman build . -t %image%:%version%