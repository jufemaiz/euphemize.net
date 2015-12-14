---
title: Latest coding...
date: '2005-03-17 00:04:57'
tags:
- photography
---

So I had recently got the shits with part of my site. Nothing much really, just my photographs. When on the site, I want them clean and without borders, BUT, I want them to have a border when not being displayed as part of the website. How to do this without duplicity in images?

Along comes our trusty .htaccess (apache mod_rewrite). Basically, the gist of this is that it changes your url query at the back end (with or without showing you what it changed).

So this is how I did it. I want all jpeg's not called from THIS site to have an additional 15px (default) border. So I go and write a handy little function that will add a 15px white border to an image it is given. All good and well, but how do we get the image to go there when called by a user (such as when I post images on websites for critic). This is where mod_rewrite comes in:

<code>RewriteEngine on
RewriteCond %{HTTP_REFERER} !^http://(www.)?your_domain.blah/ [NC]
RewriteRule (.*)?.(jpe?g)$ your-image-manipulator.php?your_reference=$1.$2 [R]</code>

and you're away... easy eh...
