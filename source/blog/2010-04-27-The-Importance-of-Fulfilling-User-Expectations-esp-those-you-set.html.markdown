---
title: The Importance of Fulfilling User Expectations (esp those you set)
date: '2010-04-27 21:29:23'
tags:
- design
- design
- elevators
- engineering
- opinion
- user
- user-centered-design
- user-experience
- user-interface
---

Over the past twelve months the elevators at work have been upgraded. The innards have been upgraded, but far from being purely cosmetic, the lift operations have also been upgraded - and judging by the amount of work being undertaken in the lift wells themselves a fair chunk of that time was devoted to maintenance and upgrades to the mechanical and electrical workings. In spite of all this, it is where the user experiences the lifts operations that has irked me the most.

<!--more-->

<h3>A Button and its Feedback</h3>

<div class="image">
	<a href="http://www.flickr.com/photos/meltedplastic/3991923080/" title="2009-09-27 - Central Square - 097 (by meltedplastic)"><img src="http://farm3.static.flickr.com/2554/3991923080_227f4aa6b8.jpg" title="2009-09-27 - Central Square - 097 (by meltedplastic)" alt="2009-09-27 - Central Square - 097 (by meltedplastic)" width="500" height="333" /></a>
	<p class="caption">Manual Elevator Control Panel (<a href="http://www.flickr.com/photos/meltedplastic/3991923080/" title="2009-09-27 - Central Square - 097 (by meltedplastic)">2009-09-27 - Central Square - 097 (by meltedplastic)</a>)</p>
</div>

Let me start where I did. After doing away with the permanent position of the lift operator in favour of an electronic, and in more modern times computer, driven system, the interface to select the floor you wish to proceed to has shifted to a button.

<div class="image">
	<a href="http://www.flickr.com/photos/kurafire/2642887467/" title="Bad elevator UI (by kurafire)"><img src="http://farm4.static.flickr.com/3189/2642887467_dd7ca9327e.jpg" title="Bad elevator UI (by kurafire)" alt="Bad elevator UI (by kurafire)" width="375" height="500" /></a>
	<p class="caption">Adding the buttons - not every decision is correct (<a href="http://www.flickr.com/photos/kurafire/2642887467/" title="Bad elevator UI (by kurafire)">Bad elevator UI (by kurafire)</a>)</p>
</div>

In general, the way a user uses them is to press the button and, after a short delay, the lift will take the occupant to floors in the building in the direction it is to head. If you're below the floor, and the lift is continuing down, you will have to await its turn-around point to head back to the floor you're after - thus the encouragement on each floor for the call-button to be split into two - one for <em>up</em> and one for <em>down</em>.

<div class="image">
	<a href="http://www.flickr.com/photos/lopolis/1528841741/" title="Elevator Interaction (by lopolis)"><img src="http://farm3.static.flickr.com/2114/1528841741_c1938b75c2.jpg" title="Elevator Interaction (by lopolis)" alt="Elevator Interaction (by lopolis)" width="333" height="500" /></a>
	<p class="caption">Up or down? (<a href="http://www.flickr.com/photos/lopolis/1528841741/" title="Elevator Interaction (by lopolis)">Elevator Interaction (by lopolis)</a>)</p>
</div>

So now we have buttons, however what we also need to do is give feedback to the elevator user about their interaction with the buttons.

<h4>Common Interaction Techniques</h4>

The most common interaction with a lift button is to simply <strong>light them up</strong> - for example, illuminating the button with a backlight. This should occur as confirmation that the system has received the button press and placed it in its state machine so as to ensure the user verification that their request has been processed.

An additional cue that can be made is an audible cue, ranging from a <strong>simple beep</strong> to a more complex <strong>computerised voice confirmation</strong>.

The case at work is that both are being used - the buttons themselves are illuminated and an audible <strong>beep</strong> is also sounded confirming to the user that their floor selection has been processed and the lift will soon stop at that floor.

<h4>&elipse; that we failed</h4>

The unfortunate aspect of the control panel as implemented is that the state change is not the trigger for either the button illumination nor audible beep. These occur not only separate to the elevators control system, but also separately to themselves.

The design of the system appears to be such that it is reliant on the physical construction of the button and its contact points to <em>first</em> cause the state to change in the control system and <em>then</em> provide the cues back to the user that their selection is now in the system. Where this breaks down is if the control panel's construction has not been up to scratch of if the connectivity with the control system breaks down. Where this occurs the illumination of the button does not continue, though the audible beep is still heard.

A minimum of half the refurbished lifts have this problem, which I can only guess will get worse with age until the next refurbishment.

<h3>Why is this relevant?</h3>

<acronym title="Asynchronous Javascript And XML">AJAX</acronym> is a technique that has gained a lot of attention in the web world - even more so in the enterprise. Unfortunately its implementation often makes poor assumptions on the state machine that it relates to.

When data posts or requests are made without page refreshes, designers need to be exceedingly careful about any any assumptions that they make in their state machines.

Case in point was an application that I am overseeing at work. New functionality includes the ability to favourite an asset, with the request fired using AJAX where this is available. The state on the page, however, changed before any response was received from the server - assuming continuous connectivity between the page and the server to exist. Tests, including server outage or removal of network access, revealed this quite quickly, however the base assumption of connectivity is one that should not have been made in the first place.

One should always <strong>place the request</strong> first, <strong>change state on response from remote system</strong> second.

<h3>A Further Note: Numbering Floors</h3>

The other area of failure that occurred is the numbering sequence that is used on the two panels.

[caption id="attachment_604" align="alignnone" width="375" caption="Elevator Refurbishment » Panel 1"]<a href="http://euphemize.net/blog/wp-content/uploads/IMG_0315.jpg"><img src="http://euphemize.net/blog/wp-content/uploads/IMG_0315.jpg" alt="Elevator Refurbishment » Panel 1" title="Elevator Refurbishment » Panel 1" width="375" height="500" class="size-full wp-image-604" /></a>[/caption]

The first panel is the same as traditional elevators in the West. Numbers start at the bottom for low floors proceeding up as you rise through the floors. Direction on each "layer" is, as per Western conventions, left to right.

[caption id="attachment_605" align="alignnone" width="500" caption="Elevator Refurbishment » Panel 2"]<a href="http://euphemize.net/blog/wp-content/uploads/IMG_0316.jpg"><img src="http://euphemize.net/blog/wp-content/uploads/IMG_0316.jpg" alt="Elevator Refurbishment » Panel 2" title="Elevator Refurbishment » Panel 2" width="500" height="375" class="size-full wp-image-605" /></a>[/caption]

The second panel, is a lower one installed predominantly for access by those in wheelchairs. Some bright spark decided that the order should be reversed on the lower panel. Thankfully the paradigm of bottom-to-top for floors was maintained, however, the left-to-right paradigm was ditched.

Why, I've got no idea. I've watched countless people go to push buttons based on where they <em>think</em> they should be through years of unconscious training of how the buttons are arranged in the lifts and find themselves hitting floors that they don't want. Not only that, due to the difference between the two, there is no longer a common arrangement used on the panels.

These are all small things, but it's the small things that count when you're talking about the difference between an easy and enjoyable experience and one that frustrates. On all counts, these new lifts are definitely failing at time of commissioning to meet the experience that they set out for their users to experience. One can only hope they do not deteriorate further over time.
