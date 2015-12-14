---
title: jmc_event_manager
date: '2006-04-05 21:18:01'
tags: []
---

<h2>New Version - 0.3.1</h2>
<ul>
	<li><a href="http://files.euphemize.net/textpattern/jmc_event_manager/0.3.1/jmc_event_manager.0.3.1.php">Download backend (jmc_event_manager)</a></li>
	<li><a href="http://files.euphemize.net/textpattern/jmc_event_manager/0.3.1/jmc_event_display.0.3.1.php">Download frontend (jmc_event_viewer) </a></li>
</ul>
<h3>Older Version - 0.3</h3>
<ul>
	<li><a href="http://files.euphemize.net/textpattern/jmc_event_manager/jmc_event_manager.txt">Download backend (jmc_event_manager)</a></li>
	<li><a href="http://files.euphemize.net/textpattern/jmc_event_manager/jmc_event_display.txt">Download frontend (jmc_event_viewer) </a></li>
</ul>
<h3><a href="http://files.euphemize.net/textpattern/jmc_event_manager.txt">Download jmc_event_manager v0.2beta</a></h3>
<h2>Preamble</h2>
The jmc_event_manager is a plugin/hack for textpattern created to allow users to create events at various venues. It has been done so completely by 'ju:femaiz @ <a href="http://euphemize.net">euphemize.net</a>. Any comments or suggestions would be appreciated and the support thread at <a href="http://forum.textpattern.com">forum.textpattern.com</a> is <a href="http://forum.textpattern.com/viewtopic.php?id=11137">available here</a>. While this help file has attempted to be as thorough as possible, things do fall through the cracks. Since jmc_event_manager is (still) in a beta stage, there may exist some bugs in the operation. Additionally, the plugin/hack is an ongoing project and may be updated from time to time. To ensure that you have the most up to date version, please ensure you visit the <a href="http://forum.textpattern.com/viewtopic.php?id=11137">support forum thread</a> regularly.

jmc_event_manager is distributed under the GNU General Public License. For more information please visit <a href="http://www.gnu.org/copyleft/gpl.html">GNU General Public License</a>.
<h2>Installation</h2>
The installation package is a simple process. For those of you upgrading, there are additional requirements on your behalf due to the addition of categories to jmc_event_manager.
<h3>Fresh Install</h3>
For those undergoing a fresh install, please go through the following steps:
<ol>
	<li>Turn the plugin to active</li>
	<li>Go to Content and Event Manager tabs</li>
	<li>Do a little dance and you'll find that you're ready to go!</li>
</ol>
<h3>Upgrade on Past Version</h3>
As with all updates, please backup your database, then go through the following steps:
<ol>
	<li>Through your database admin, add the following columns to the
<pre>txp_jmc_event</pre>
and
<pre>txp_jmc_event_venue</pre>
set as NULL (or equivalent on your Textpattern installation)</li>
	<li>Activate plugin</li>
	<li>Go to Content and then Event Manager tab</li>
	<li>Do a little jig and you should be right + ready to go!</li>
</ol>
<h2>Introduction to the Event Manager</h2>
The event manager has two components - the admin side controls and the public side output. On installation it will ensure that a database exists, the tables exist, installing if they're missing, and that an entry exists in the tables associated with the event manager (in this way I consider it a hack).
<h2>Event Manager Tab</h2>
When you go to the event manager tab you will be presented with a list of events that have been entered. Currently, the "events per page" is a mirror of that used on the article page, and any alteration to the "events per page" will also alter the "articles per page" under the "articles tab".

There are currently four top level buttons for the Event Manager:
<ul>
	<li>Event Manager - Manages the actual events</li>
	<li>Venue Manager - Manages the venues for the events. Each event must be "at" a venue</li>
	<li>Category Manager - Manages the new categories available for the plugin</li>
	<li>RSS Feed - For future versions will allow access to alterations to the RSS format</li>
</ul>
<h3>Event Manager</h3>
The default page of the plugin's tab. Gives two options:
<ul>
	<li>Add Event</li>
	<li>Event Listing (default)</li>
</ul>
<h4>Add Event</h4>
Allows the administrator to add an event. Utilises <a href="http://microformats.org/">microformats</a> style <a href="http://microformats.org/wiki/hcalendar">hCalendar</a>.<a href="http://microformats.org/wiki/hcalendar"></a>

Optional:
<ul>
	<li>Category</li>
	<li>Event Name</li>
	<li>Price</li>
	<li>Other Bands</li>
	<li>Other Info</li>
</ul>
Required:
<ul>
	<li>Start Date + Time</li>
	<li>Finish Date + Time</li>
	<li>Venue</li>
</ul>
<strong>Note</strong>: Event must Finish <em>after</em> it begins.
<h4>Event Listing</h4>
Basic listing of all events past, present and future.
<h3>Venue Listing</h3>
Gives two options:
<ul>
	<li>Add Venue</li>
	<li>Venue Listing (default)</li>
</ul>
<h4>Add Venue</h4>
Allows the administrator to add a venue. Only the venue name is required. Utilises <a href="http://microformats.org/">microformat</a> style <a href="http://microformats.org/wiki/hcard">hCard</a>.
<h4>Venue Listing</h4>
Basic listing of all venues.
<h3>Category Manager</h3>
Gives two options:
<ul>
	<li>Add Category</li>
	<li>Category Listing (default)</li>
</ul>
<h4>Add Category</h4>
Allows the administrator to add an category. Only the category name is required.
<h4>Category Listing</h4>
Basic listing of all categories.
<h3>RSS Feed</h3>
Still to come in future updates. Unsure as of yet as to the design, layout and options. If you have ideas, please contact me through the <a href="http://forum.textpattern.com/viewtopic.php?id=11137">jmc_event_manager plugin forum thread</a>.
<h2>Creating Event Manager Output</h2>
The jmc_event_manager uses the forms in textpattern to create the template for the output. You may use any form you like, providing that it has the relevant details, i.e. you can call it from within an article, from a page or even from a form itself (<em>yet to be tested</em>).
<h3>Calling the Event Manager</h3>
In order to call the event manager, a simple Textpattern style tag is used:

<code>&lt; txp :jmc_events form="form_name" /&gt;</code>

<code>The form_name is the name of the form you would like to call as the template. jmc_events cycles through <em>all</em> events answering its restrictions, that is it cycles through each relevant entry.</code>

There are many options as to how to limit the number and type of events being called. The following are the options, given with details also of the default (if any).

Formatting for venues is done independently of, or within, the event form.
<h4>limit</h4>
Used to restrict the number of events.

Example usage:

<dl> <dt>Limit to ten events:</dt> <dd><code>&lt; txp :jmc_events form="form_name" limit="10" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>0|1</pre>
</dd> <dt>Default:</dt> <dd>
<pre>1</pre>
</dd> </dl>
<h4>future</h4>
Used to restrict the events to those that will start in the future.

Example usage:

<dl> <dt>Limit to future:</dt> <dd><code>&lt; txp :jmc_events form="form_name" future="1" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>0|1</pre>
</dd> <dt>Default:</dt> <dd>
<pre>1</pre>
</dd> </dl>
<h4>past</h4>
Used to restrict the events to those that will start in the past.

Example usage:

<dl> <dt>Past only:</dt> <dd><code>&lt; txp :jmc_events form="form_name" past="1" future="0" /&gt;</code></dd> <dt>Past and future:</dt> <dd><code>&lt; txp :jmc_events form="form_name" past="1" future="0" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>0|1</pre>
</dd> <dt>Default:</dt> <dd>
<pre>1</pre>
</dd> </dl>
<h4>current</h4>
Used to restrict the events to those that will have started, but have not yet finished.

Example usage:

<dl> <dt>Current only:</dt> <dd><code>&lt; txp :jmc_events form="form_name" current="1" future="0" /&gt;</code></dd> <dt>Current and Future:</dt> <dd><code>&lt; txp :jmc_events form="form_name" current="1" future="1" /&gt;</code></dd> <dt>Current and Past:</dt> <dd><code>&lt; txp :jmc_events form="form_name" current="1" past="1" future="0" /&gt;</code></dd> <dt>Current, Past and future:</dt> <dd><code>&lt; txp :jmc_events form="form_name" current="1" past="1" future="1" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>0|1</pre>
</dd> <dt>Default:</dt> <dd>
<pre>1</pre>
</dd> </dl>
<h4>category_id</h4>
Used to restrict the events to those of a particular category or categories.

Example usage:

<dl> <dt>Single category (where category's ID=2):</dt> <dd><code>&lt; txp :jmc_events form="form_name" category_id="2" /&gt;</code></dd> <dt>Multiple categories (where category's ID is in array(2,4)):</dt> <dd><code>&lt; txp :jmc_events form="form_name" category_id="2,4" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>Valid ID from txp_jmc_event_category</pre>
</dd> <dt>Default:</dt> <dd>
<pre>NULL</pre>
</dd> </dl>
<h4>venue_id</h4>
Used to restrict the events to those that will occur at a specified venue or venues.

Example usage:

<dl> <dt>Single venue (where venueâ€™s ID=2):</dt> <dd><code>&lt; txp :jmc_events form="form_name" venue_id="2" /&gt;</code></dd> <dt>Multiple venues (where venueâ€™s ID is in array(2,4)):</dt> <dd><code>&lt; txp :jmc_events form="form_name" venue_id="2,4" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>Valid ID from txp_jmc_event_venue</pre>
</dd> <dt>Default:</dt> <dd>
<pre>NULL</pre>
</dd> </dl>
<h4>event_id</h4>
Used to restrict the events to a particular event or group of events. Please note that this overrides <strong>all</strong> other variables!

Example usage:

<dl> <dt>Single event (where eventâ€™s ID=2):</dt> <dd><code>&lt; txp :jmc_events form="form_name" event_id="2" /&gt;</code></dd> <dt>Multiple events (where eventâ€™s ID is in array(2,4)):</dt> <dd><code>&lt; txp :jmc_events form="form_name" event_id="2,4" /&gt;</code></dd> <dt>Values:</dt> <dd>
<pre>Valid ID from txp_jmc_event</pre>
</dd> <dt>Default:</dt> <dd>
<pre>NULL</pre>
</dd> </dl>
<h4>sort_by</h4>
Puts in place the MySQL sort by a variable name. Used in conjunction with sort_order.

<dl> <dt>Values:</dt> <dd>
<pre>ID | name | start_DateTime | finish_DateTime | AuthorID | LastModID | VenueID | Price | OtherBands | OtherBands_html | OtherInfo |OtherInfo_html | CategoryID</pre>
</dd> <dt>Default:</dt> <dd>
<pre>start_DateTime</pre>
</dd> </dl>
<h4>sort_order</h4>
Determings the order in which the events will be displayed.

<dl> <dt>Values:</dt> <dd>
<pre>asc|desc</pre>
</dd> <dt>Default:</dt> <dd>
<pre>asc</pre>
</dd> </dl>
<h2>Forms</h2>
Events and venues each have their own forms with their own variables.
<h3>Event Forms</h3>
<h4>Event Name</h4>
&#60;txp :jmc_event_name /&#62;
<h4>Event ID</h4>
&#60;txp :jmc_event_id /&#62;
<h4>Event Price</h4>
&#60;txp :jmc_event_price /&#62;
<h4>Other Bands</h4>
Inserts the html for other band information.
&#60;txp :jmc_event_otherbands /&#62;
<h4>Other Information</h4>
&#60;txp :jmc_event_otherinfo /&#62;
<h3>Venue Forms</h3>
Venue form options can be called either from the event form directly, or from a separate form using the tag: &#60;txp :jmc_venue form=&#8220;form_name&#8221; /&#62;
<h4>Venue Name</h4>
&#60;txp :jmc_venue_name /&#62;
<h4>Venue ID</h4>
&#60;txp :jmc_venue_id /&#62;
<h4>Venue Address 1</h4>
&#60;txp :jmc_venue_address1 /&#62;
<h4>Venue Address 2</h4>
&#60;txp :jmc_venue_address2 /&#62;
<h4>Venue Suburb</h4>
&#60;txp :jmc_venue_suburb /&#62;
<h4>Venue State</h4>
&#60;txp :jmc_venue_state /&#62;
<h4>Venue Country</h4>
&#60;txp :jmc_venue_country /&#62;
<h4>Venue Postcode</h4>
&#60;txp :jmc_venue_postcode /&#62;
<h4>Venue Phone</h4>
&#60;txp :jmc_venue_phone /&#62;
<h4>Venue <span class="caps">URL</span></h4>
&#60;txp :jmc_venue_url /&#62;
<h4>Venue Email</h4>
&#60;txp :jmc_venue_email /&#62;
<h4>Venue Other Information</h4>
&#60;txp :jmc_venue_otherinfo /&#62;
<h3>Useful Function</h3>
In order to execute a few more options, there is a requirement to manipulate things such as dates.
<h4>Event Times</h4>
Event times give output of either the start or finish date and time of an event and uses the <a href="http://www.php.net/datetime">PHP DateTime functionality</a> for formatting. <code>&lt; txp :jmc_event_time php_date="phpDateFunction" /&gt;</code>

Options:

<strong>start</strong> (if start=0 then gives finish time)

<dl> <dt>Values</dt> <dd>
<pre>0|1</pre>
</dd> <dt>Default</dt> <dd>
<pre>1</pre>
</dd> </dl>
<h4>If Variable</h4>
Checks to see if a variable exists. If it does not, then deletes what the tags enclose.
<p style="border: 1px solid red; margin: 10px 50px; padding: 10px; background: #ffeeee none repeat scroll 0% 50%; color: darkred; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial"><strong>Warning</strong>: Experimental (still, sorry guys o=) )</p>
<code>&lt; txp :jmc_if_variable variable="variableName"&gt;&lt; / txp :jmc_if_variable&gt;</code>Options:

<strong>variable</strong>

<dl> <dt>Values:</dt> <dd>
<pre>any in the database for a particular event or venue</pre>
</dd> <dt>Default:</dt> <dd>
<pre>NULL</pre>
</dd> </dl>
<h2>Future Updates</h2>
The following future updates are being considered or worked on:
<ul>
	<li>RSS feed for the Event Manager (many of you will find this a big bonus!)</li>
	<li>Proper Admin Panel (this will deal with some time issues, where currently have allowed only 00, 15, 30 and 45 minutes for the time, future options will allow the administrators to decided how they want the minutes to be limited).</li>
	<li>Venue dropdown and lists by <em>country</em> then <em>state</em> (where applicable).</li>
	<li>Dropdown in Add Venue to use <em>country codes</em></li>
	<li>Install pack(s) with New South Wales and Victorian live music venues (I'm an aussie after all!).</li>
</ul>
<h2>Additional Features and Bug Fixes</h2>
The following bugs have been fixed and features added:
<h3>v0.2 beta</h3>
<ul>
	<li>Categories</li>
	<li>Current event option for calling of</li>
</ul>
