
FROM jfmatth/hugobuilder:v0.1 as HUGO

# Copy the contents of the current working directory to the static-site directory.
COPY . /static-site

# Command Hugo to build the static site from the source files,
# setting the destination to the public directory.
RUN hugo --logLevel debug --source=/static-site --destination=/static-site/public

# Install NGINX, remove the default NGINX index.html file, and
# copy the built static site files to the NGINX html directory.
FROM nginx
# FROM cgr.dev/chainguard/nginx:latest
COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/

expose 80