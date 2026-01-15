# justneverlift.com

This is my site for all things I do at NASA.  I'm not much of a blogger or writer but will try to put videos, thoughts, links, etc. here for everyone to enjoy.

## Development

### Local HUGO Server
- Make sure the latest HUGO is installed via winget  
- ```hugo server --log-level info``` does work on Powershell

### New posts

A generic post about something:
```
hugo new post\filename.md
``` 

A post for education:
```
hugo new education\filename.md
```

## Building the site
For each update:
- change the VERSION file to reflect the version of the container that runs the site.  I use the date format v.YYYY.MM.DD-#  
I only update the version for the content, not the Docker or other pipeline features.

- run ```build``` which should pickup my build script to build to the ```IMAGE:VERSION``` Docker image, add ```-push``` if you want to manually push, but GH Actions does that too

### Github Actions
- **drafts** branch will run spellcheck and test the build, but not push to registry  
- **master** branch will run spellcheck, build and push to registry  


## Flux info
If you make a change to the site, it might take up to 30m to push out, due to the timings I have in FLUX.  

To force it, after you commit the changes, do the following in powershell
```
flux reconcile source git flux-system -n flux-system
flux reconcile image repository justneverlift
flux reconcile helmrelease justneverlift -n justneverlift
```



## Major changes
01-04-2025 - Added spellcheck, very cool.  See ```buildimage.yaml``` for link to repo from action  
01-03-2026 - Happy New Year, working on using more Mainroad features, https://github.com/Vimux/Mainroad  
12-30-2025 - Updated for more automation with Flux, build and IMAGE:VERSION  
12-28-2025 - Tired of the original hugo theme changing and having to correct MY content.  Switched to mainroad theme instead.  