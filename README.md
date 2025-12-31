# justneverlift.com

This is my site for all things I do at NASA.  I'm not much of a blogger or writer but will try to put videos, thoughts, links, etc. here for everyone to enjoy.

## Building the site
For each update:
- change the VERSION file to reflect the version of the container that runs the site.  I use the date format v.YYYY.MM.DD  

- run ```build``` which should pickup my build script to build to the ```IMAGE:VERSION``` Docker image, add ```-push``` if you wand to manually push, but GH Actions does that too


## Major changes
12-30-2025 - Updated for more automation with Flux, build and IMAGE:VERSION 
12-28-2025 - Tired of the original hugo theme changing and having to correct MY content.  Switched to mainroad theme instead.