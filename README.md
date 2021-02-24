# Multi-arch Jekyll images

A lightweight image designed to run your Jekyll site for amd64, arm64, and armV7

# Why?

My homelab runs on a cluster containing amd64 and arm64 chips, but the official jekyll image only runs on amd64 so I figured Id take a crack at making my own multi-arch image that does EXACTLY what I want. 

# How do I use it? 

Note: You must already have your jekyll site ready to go. If you don't mount the path to your jekyll project directory with a Gemfile, this container will not run.

## docker run

```
docker run --name jekyll -d -p 4000:4000 -v /path/to/jekyll/root:/usr/src/app richardsoper/jekyll:latest
```

## docker-compose

docker-compose.yml
```
version: '3.7'

volumes:
  jekyll_data: {}

services:
  jekyll:
    image: richardsoper/jekyll:latest
    volumes:
      - jekyll_data:/usr/src/app
    ports:
      - 4000:4000
```
In the command line:
```
docker-compose up -d 
```

# Credit
This implementation was largely inspired by [Bret Fisher](https://github.com/BretFisher/jekyll-serve). 
