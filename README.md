# justneverlift.com

This is my site for all things I do at NASA.  I'm not much of a blogger or writer but will try to put videos, thoughts, links, etc. here for everyone to enjoy.

## Building the site
For each update:

- change the VERSION file to reflect the version of the container that runs the site.  I use the date format v.YYYY.MM.DD  
- Update the image version in the helm chart (_helm/values.yaml)  

- Deploy with helm to the jnl namespace from the root of this project
```
helm upgrade justneverlift -n jnl .\_helm\
```

Enjoy  