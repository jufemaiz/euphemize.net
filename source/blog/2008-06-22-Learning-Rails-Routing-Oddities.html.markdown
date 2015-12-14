---
title: 'Learning Rails: Routing Oddities'
date: '2008-06-22 19:21:03'
tags:
- general
published: false
---

As I've been playing more and more with <a href="http://rubyonrails.org">Ruby on Rails</a> I found some interesting issues with the routing when using nested routing.

<h3><code>:method => :delete</code></h3>
First up is the delete method. Normally you would use something like this:

<pre>< %= link_to 'Delete this <em>Thing', {:action => "destroy", :id => @thing}, :confirm => 'Are you sure you want to delete this "Thing"?' %></pre>

However, due to nested routing you actually need this:

<pre>< %= link_to 'Delete this <em>Thing', {:action => "destroy", :id => @thing}, :confirm => 'Are you sure you want to delete this "Thing"?', :method => :delete %></pre>

<h3><pre>:post</pre> and <pre>:put</pre></h3>

Semantically <pre>:post</pre> is meant to be used for the creation of a new element while <pre>:put</pre> should be used for updates to elements. Unfortunately that is not how things work if you happen to extend the standard RESTful routing in Rails 2+. You'll have to revert to <pre>:post</pre> instead to ensure that the routing doesn't become mixed up.
