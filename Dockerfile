
FROM ghcr.io/jfmatth/hugobuilder:v0.2 as HUGO

# Copy the contents of the current working directory to the static-site directory.
COPY . /static-site

# Command Hugo to build the static site from the source files,
# setting the destination to the public directory.
RUN hugo --logLevel debug --source=/static-site --destination=/static-site/public

# Install NGINX, remove the default NGINX index.html file, and
# copy the built static site files to the NGINX html directory.
FROM docker.io/nginx
COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/

expose 80