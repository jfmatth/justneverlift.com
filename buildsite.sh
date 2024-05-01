export version=0.1
hugo --logLevel debug
docker build . -t jfmatth/justneverlift:$version
docker push jfmatth/justneverlift:$version