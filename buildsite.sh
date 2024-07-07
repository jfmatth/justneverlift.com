export version=0.2
hugo --logLevel debug
docker build . -t jfmatth/justneverlift:$version
docker push jfmatth/justneverlift:$version