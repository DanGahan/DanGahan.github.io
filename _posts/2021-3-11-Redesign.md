---
layout: post
title: Redesign
---

I've decided to have a little redesign of my blog to make it easier to post from my iPad. 

The previous incarnation was written by hand and had a couple of dodgy bash scripts to convert from markdown to html when publishing. I was hosting that on a Linode VM using various containers to run a load balancer (ha-proxy) and a few backend servers (nginx). I'd build and deploy the containers via a GitLab CI pipeline. The infrastructure was far more interesting than anything I ever posted.

This redesign is much simpler. I've used Jekyll and Github pages to enable me to push articles in markdown format straight into the repo and Github then does the rest. No messing about. I use cloudflare to then enable connections from my custom gahan.me.uk domain and to provide TLS encryption.

Anyway, let's see how often I remember to post
