FROM docker.io/jfmatth/hugobuilder:latest as HUGO

# Copy the contents of the current working directory to the static-site directory.
COPY hugo/. /static-site

# Command Hugo to build the static site from the source files,
# setting the destination to the public directory.
RUN hugo -D --source=/static-site -v

# Install NGINX, remove the default NGINX index.html file, and
# copy the built static site files to the NGINX html directory.
FROM nginx:stable-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=HUGO /static-site/public /usr/share/nginx/html/

# Instruct the container to listen for requests on port 80 (HTTP).
WORKDIR /usr/share/nginx/html