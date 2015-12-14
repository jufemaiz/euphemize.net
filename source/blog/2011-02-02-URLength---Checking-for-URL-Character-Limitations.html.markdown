---
title: URLength - Checking for URL Character Limitations
date: '2011-02-02 08:40:43'
tags:
- '3'
- ajax
- att
- bell
- character
- check
- code
- fido
- http-specification
- hutchison
- javascript
- length
- limit
- mobile-broadband
- mobile-telecommunications
- o2
- optus
- rogers
- telstra
- telus
- url
- urlength
- vodafone
---

I recently created a "small useful web-app" that provides the ability to check for any <a href="http://en.wikipedia.org/wiki/Uniform_Resource_Locator"><acronym title="Universal Resource Locator">URL</acronym> character length</a> as a result of issues being raised quite often on the <a href="http://flic.kr/help/forum/">Flickr Help Forum</a>.
<!--more-->
When trying to debug access problems associated with non-responsive javascript, it was found that some devices (and ISPs?) were preventing well formed, though verbose, <acronym title="Universal Resource Locator">URL</acronym>s from being requested. Flickr uses a smart concatenation technique to minimise the number of <acronym title="HyperText Transfer Protocol">HTTP</acronym> requests that are made and hence make the page load time (time until the Flickr page is ready for behaviour) faster for the user.

So without further ado I present: <a href="http://urlength.euphemize.net">urlength.euphemize.net</a>.

To date I've found the following issues.


<table border="0" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th>Nation</th>
			<th>Telco</th>
			<th>Device</th>
			<th>Method</th>
			<th>Character Limit</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Australia</th>
			<th>Telstra</th>
			<td>iPhone 3GS</td>
			<td>mobile safari</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Telstra</th>
			<td>iPhone 3GS</td>
			<td>Tethered</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Telstra</th>
			<td>iPhone 4G</td>
			<td>mobile safari</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Telstra</th>
			<td>iPhone 4G</td>
			<td>Tethered</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Telstra</th>
			<td>Bigpond Elite (Sierra) SW308 USB Wireless Card</td>
			<td>USB connected</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>3/Vodafone/Hutchison</th>
			<td>iPhone 3GS</td>
			<td>Mobile safari</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>3/Vodafone/Hutchison</th>
			<td>Blackberry Bold</td>
			<td>Native browser</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>3/Vodafone/Hutchison</th>
			<td>Samsung Android 2.2</td>
			<td>Native browser</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Optus</th>
			<td>Nokia N85 running Symbian S60</td>
			<td>Opera Mini 10.1</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Australia</th>
			<th>Unknown</th>
			<td>Unknown</td>
			<td>Unknown</td>
			<td>1937</td>
		</tr>
		<tr>
			<th>Canada</th>
			<th>Fido (runs on Rogers network)</th>
			<td>iPhone 4G</td>
			<td>mobile safari</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Canada</th>
			<th>Rogers</th>
			<td>Unknown</td>
			<td>Tethered</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>Canada</th>
			<th>Bell</th>
			<td><a href="http://www.ericssonw35.com/">Ericsson W-35</a> "Turbo Hub"</td>
			<td>Tethered through ethernet</td>
			<td><strong>1999</strong></td>
		</tr>
		<tr>
			<th>Canada</th>
			<th>Telus</th>
			<td>iPhone (Unknown model)</td>
			<td>Tethered</td>
			<td>1999</td>
		</tr>
		<tr>
			<th>United Kingdom</th>
			<th>O2</th>
			<td>iPhone (unknown model)</td>
			<td>mobile safari on GPRS network</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>United States of America</th>
			<th>AT&amp;T</th>
			<td>iPhone 4G</td>
			<td>Mobile safari</td>
			<td>no limit</td>
		</tr>
		<tr>
			<th>United States of America</th>
			<th>AT&amp;T</th>
			<td>Microcell 3G</td>
			<td>Unknown</td>
			<td>no limit</td>
		</tr>
	</tbody>
</table>

For those who check their device(s) could you please leave a comment and I'll try and keep this up to date too.
