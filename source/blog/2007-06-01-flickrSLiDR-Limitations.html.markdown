---
title: flickrSLiDR Limitations
date: '2007-06-01 01:27:36'
tags:
- flickr
- flickrslidr
- iframe
- myspace
- paul-stamatiou
- photography
---

Let me first preface this by saying that <a href="http://paulstamatiou.com/">Paul Stamatiou</a> (<acronym title="also known as">aka</acronym> "<a href="http://www.google.com/search?q=stammy">stammy</a>") has done a great job delving into the slideshow for flickr users and enabling them to easily use it on their blog or site through his new assistive-application <a href="http://flickrslidr.com/">flickrSLiDR</a>. That said, it is not without limitations, and while not due to Paul I do believe that the way it works should have been explained.
<h3>Flickr Slideshow</h3>
The lovely ladies and gents at <a href="http://flickr.com">Flickr</a> (<a href="http://flickr.com/photos/jufemaiz/">my favourite photo community</a>) created the slideshow a few years back in September 2004 (<a href="http://blog.flickr.com/flickrblog/2004/09/introducing_sli.html">Introducing Slideshows - September 10, 2004</a>) and it was of course a great success. In spite of this there existed a major limitation, and that was in getting it to show anywhere but at flickr. Enter Paul Stamatiou.
<h3>Embedded Flickr Slideshow</h3>
In November of 2005 Stamatiou managed to determine a quick technique to embed slideshows in pages beyond flickr (see <a href="http://paulstamatiou.com/2005/11/19/how-to-quickie-embedded-flickr-slideshows/">HOW TO Quickie: Embedded Flickr Slideshows - November 19, 2005</a>), allowing flickr users to have the swish slideshow visible on their site with relevant tags, sets, groups and/or users acting as filters for the photos shown. I used this technique in a post showing the photos from my sisters high school graduation (see <a href="http://euphemize.net/blog/archives/2006/12/07/eliza-graduates-november-2006/">Eliza Graduates, November 2006</a>).
<p align="center"><a href="http://www.flickr.com/photos/jufemaiz/523233096/" title="Photo Sharing"><img src="http://farm1.static.flickr.com/241/523233096_adadbc0617.jpg" alt="Eliza Graduates, November 2006 at â€˜ju-fÉ™maiz" height="500" width="435" /></a></p>
<p align="center"><small>Use of the Quick Embedding of Flickr Slideshows courtesy of Paul Stamatiou</small></p>
The biggest issue is the use of <a href="http://en.wikipedia.org/wiki/Iframe">iframes</a> to embed the slideshow. Due to security restrictions on many free blogs and social sites iframes are prevented from being used. Despite the attention at the time, this was not a wide issue, since the uptake in the social sites was not as widespread as it is now, nor for that matter was flickr as popular.
<h3>flickrSLiDR</h3>
Enter Stamatiou's new assistive-application <a href="http://flickrslidr.com/">flickrSLiDR</a> - a tool to assist the creation of the code needed to embed the slideshow from flickr. Despite the upgrade to flickr's slideshow (see <a href="http://flickr.com/photos/jufemaiz/show/">flickr.com/photos/jufemaiz/show/</a>), Stamatiou has not yet been able to move to the new slideshow flash file. The same issues also remain regarding embedding options of the iframe with free blog software and many social sites (of which the main one that springs to mind would be the security-as-swiss-cheese <a href="http://myspace.com">MySpace</a>). Additionally, due to a wider audience than ever before, Stamatiou failed in his article to fully articulate what he was using and why these methods might fail (and the <a href="http://paulstamatiou.com/2007/05/18/flickrslidr-my-flickr-slideshow-embedding-tool/#comments">comments on his post</a> reflect that).

Unfortunately the misinformation goes further, with people not understanding that this is an implementation of flickr's own slideshow tool. With requests including: the ability to play mp3's; add titles and other information; change the colours; change the order of the slides; and randomisation, it is obvious that a disclaimer would be exceedingly useful to be displayed to ensure that people who read the article were not misled over the potential that the flash file may have.
<h3>Thanks Stamatiou</h3>
While this might seem a little rough on Stamatiou, I hope he doesn't take it as such. I was simply attempting to ensure that people were informed as to how the tool that he had worked on won't get negative publicity for limitations outside of his control. I also believe it would have been wise to ensure that the post included the information on the technical aspect, so it could be referred back to directly to show why the limitations exist (and help prevent rather silly feature requests).
