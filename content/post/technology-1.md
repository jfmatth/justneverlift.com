---
title: 'Technology behind justneverlift.com'
date: 2026-01-03T12:39:23-08:00
draft: false
categories: ['technology']
tags: ['hugo', 'kubernetes']
---

I wanted to start a category around Technology, so that anyone who's curious can see what I spend my time with when I'm not at the track.

Since I'm not much of a writer, more of a technologist, I wanted a very simple way to accomplish a few things:
- Have a simple place to put down my thoughts (in Markdown)  
- Host images for this or other sites  

I'll try to list out some of the technologies I use and built to make this all come together.  I hope you enjoy

## The site - justneverlift.com
This site is a [hugo](https://gohugo.io/) static website.  I love HUGO.  It's known as a "static site generator", meaning, you define a bunch of content in Markdown and it generates simple HTML using whatever theme you choose.  It's very very fast, writen in golang and runs on any platform (Windows, Mac, Linux).

All the content for this site is on my Github repo [justneverlift.com](https://github.com/jfmatth/justneverlift.com)  

### Building the site - a HUGO container
Once HUGO generates the HTML, then what?  HTML is great, but serving that on a webserver can be cumbersome; Enter **docker containers**.  

I have another project called [hugobuilder](https://github.com/jfmatth/hugobuilder) that takes in a hugo site (markdown, etc) and generates the HTML into a single container that you can 'host' on any container system.

```hugo contents``` ---> ```hugobuilder``` ---> Container using NGINX and HTML files

Building the container by hand would be manual, so I use Github Actions to build the containers to that repo everytime there is push to the Master branch (technospeak I won't explain).

## Hosting the site
There are lots of ways to host a HUGO site, even Github provides an easy way to host them, but that wasn't for me, I wanted my own infrastructure to play with, learn from and see it work.

### VPS provider (https://us.ovhcloud.com/)
I stumbled  onto OHV a few months back.  I like them because they are inexpensive and provide one of the best values I've found for personal VPS's (virtual private servers).  While most cloud providers charge the same (1x1 for $5/mo), OHV provides a 4x8 for just $5/mo, which is the best deal I've found.  Check them out if you need a personal VPS.

On a geeky note, looks like they use OpenStack as their hypervisor, which might be more efficient than other platforms.  

### Kubernetes - K3s
My VPS is running an Ubuntu 25.10 instance with K3s.  I love Kubernetes and K3s is perfect for a 1 or 2 node installation.  

I have a ton of other items that are installed on Kubernetes that I'll cover later, but suffice it to say, the container we made above for this site, is on Kubernetes (k3s) on my VPS.

### Hosting images
Every good site needs images.  While HUGO will allow images in the content stream, that wasn't what I wanted to do, so I created [ImageServer](https://github.com/jfmatth/tornado-imageserver) - I'll try to make a post on that too.

Images K3s, just another namespace.  


## Updating content
So in the end, I need a very very simple way to write posts like this and the above configuration does that for me.

My workflow for content is as follows:
- Run the local hugo server on my laptop (```hugo server --log-level info```)  
- Write Markdown files locally and save them  
- Preview locally on http://localhost:1313/  
- Update the ```VERSION``` file to make sure a new image tag is created  
- Commit changes to the repository and sync to Github  

From there, Github Actions takes over, builds the new image and then my other tech picks it up and deploys it to the actual site (takes ~20m due to my timings setup).

Hope you enjoyed learning about how this site and the tech it uses.
