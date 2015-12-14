---
title: ASP.NET - Not a Real Choice for Web Development
date: '2007-09-11 21:07:47'
tags:
- code
- django
- file-management
- microsoft
- newcastle
- opinion
- proof-of-concept
- python
- ruby
- ruby-on-rails
- sdk
- software-development-kits
- software-development-team
- technology
- web-application-development
---

Recently I've spent a large amount of time working on a project for my employer. The group I was collaborating with were already using, with good reasons, the Microsoft Visual Studio tool kit for their application development process, predominantly with the <abbr title="C-sharp">C#</abbr> language set. They had thus also decided to use this for their first foray into web applications, of which their first application had been deployed and been in use for a few months prior to my arrival with the section. When I first touched the application I began to scribble down suggestions for improvement. What I was to discover has since turned me off almost everything ASP.NET has to offer in terms of web development.

Much of the reasoning behind the philosophies employed in ASP.NET comes from not wanting to scare traditional desktop application developers, or require them to understand the new(er) technology of web applications, before they even attempt to develop a web (be it intranet or internet) based application. Instead Microsoft has done their very best to shove a very square plug into a rather round hole, and the results, unsurprisingly, aren't very good.

I'm sure this critique will have the standard chorus of "but X and Y use it - there mustn't be anything wrong with it". I'm not saying that everything is bad, there are a couple of redeeming features in amongst the package, however at the end of the day I don't believe that ASP.NET is a good choice for web application development at this stage. Perhaps the next version will be better, though I won't hold my breath given the paradigm shift in thinking that this would entail at the Redmond behemoth. The following is by no means a complete listing of the issues I've found, but rather a few highlighted issues.
<h3>The Good</h3>
That I have discovered that I am not a fan is not that unusual after delving into commentary on the web from developers who come form a web standards approach. That said, the language (I would not call it a framework in the true sense of the word, it's just an extended language set, like PHP, Ruby, Python or Perl - it's not Rails, CakePHP or Django at all) does have some benefits to offer.

ASP.NET is most definitely an Object Oriented Language. This is one of its key strengths. One of the other benefits of using not so much ASP.NET but Visual Studio is the "intellisense" - the string completion tool that enables you to easily access members and functions of classes without having to memorise everything.
<h3>The Bad</h3>
<h4>Your <abbr title="identification">id</abbr> Attribute is <strong>not</strong> Yours</h4>
One of the worst parts about ASP.NET is its appropriation of <acronym title="eXtensible/HyperText Markup Language">x/html</acronym> elements, or to be more precise their identification attribute, as a reference to the "backend code" where they contain an attribute <code>runat="server"</code>. While this does enable some alterations to be made to the other attributes of that particular element, and other options such as with form elements, the attributes available do not follow the <acronym title="World Wide Web Consortium">W3C</acronym> standards that have been around for around a decade.

What makes this even worse when using a "User Web Control" - essentially a library element that can be implemented wherever one desires. When an id is used via a <em>User Web Control</em> the identification attributes value is altered to be a concatenated version - containing a reference identification value from the <em>User Web Control</em> connected to the original attribute value via an underscore, thus making the consistency of markup beyond difficult and cultivating a reliance on inline styling as opposed to the widely accepted separation of styling from markup. It also makes the use of behaviour (essentially javascript manipulation of the <acronym title="Document Object Model">DOM</acronym>) incredibly hard if one wishes to separate it too from the markup.
<h4>Optgroups? What are they?</h4>
One of the most annoying parts of the forms as ASP.NET has you use is when trying to implemement anything that their obese library hasn't thought of. The issue in point here is the availability of optgroups for select elements (created either using the standard <acronym title="eXtensible/HyperText Markup Language">x/html</acronym> <code>select</code> element or the proprietary <code>DropDownList</code> object that creates a select element so that desktop application developers don't have to understand the web in order to build on it) - or rather the complete lack of support for an element that has been in the standards for some time. I've come across a few examples of how to extend the select item, however, once you start burying yourself in the code it comes evident very quickly that what one might think should be trivial is far from, due to all the models built in functions that need to be overridden. I am still to find a standards compliant example that can guide me through to something that will work. if I can find it this will save me, and I hazard a guess a large portion of the ASP.NET web development community, a lot of hassle.
<h4>Master Pages</h4>
Master Pages looked like a good way for me to obtain something approaching a template that would save me a lot of effort with updating the mainly generic framework that sits around each page - the head section, with its links to <acronym title="Cascade Style Sheets">CSS</acronym>, javascript files and meta data, the main framework of the body and <abbr title="document type">doctype</abbr> declarations.

What I found when I attempted to implement it was that it wasn't as smart as it should have been. Links to javascript and css files would never be right as the relative path was determined based on the location of the Master Page rather than the page using the Master Page. Without this ability I had to write off Master Pages straight away, meaning far more difficult updates in the future.

So from this bit of fun it's essentially just a glorified method of an "include" as used in both ASP and PHP, where the code behind (which is included too) is also available (the one small bonus).
<h3>The Ugly</h3>
<h4>The Singular Universal Form</h4>
The method of using forms is one of the most ugly and incompetently implemented "features" of ASP.NET. The <acronym title="eXtensible/HyperText Markup Language">x/html</acronym> form element is logically defined as a container for a form, however Microsoft has deemed a form to be far more like the forms used in desktop application screens. The web is a completely different beast. For a single page it can make sense to have plenty of forms with inputs for different things (both login and sign ups are just one classic example, each heading directly to different locations).
<h4>You Will Love Tables</h4>
I will say this once and hope it gets through the heads of people out there.

<p align="center">
<blockquote>Tables are for <strong>tabular</strong> data - they should not be used for layout</blockquote>
The use of tables is ubiquitous within the development tool and I blame this on providing developers with a "<acronym title="What You See Is What You Get">WYSIWYG</acronym>" (and to be truthful it should be referred to as <em>What You See Is Rarely What You'll Get</em>) which desktop developers jump straight into, and the more experienced web developers will immediately place in the "recycle bin" on the desktop. The reason? Desktop developers have had absolute control over their user interface - pixel perfect control. The web is not like this - it is a far more fluid affair. Web users, rightly, demand the option of altering font sizes (far more easily achieved in Mozilla, Opera, Firefox, Safari and Internet Exporer 7 than Internet Explorer 6 and it's predecessors which are generally the favoured tool for developers).

Anyone who has undertaken any web development with web standards in mind will understand that tables are exceedingly useful tools - for tabular data. Other data is best represented with a myriad of other elements such as:
<ul>
	<li>ordered lists</li>
	<li>unordered lists (such as this one)</li>
	<li>Definition lists - enabling terms and descriptions to be linked</li>
</ul>
These are sorely missing in the generic proprietary elements, or controllers, that ASP.NET implements. They use one thing only - you guessed it, tables. They do not however give you access to all table elements - you don't have access to <abbr title="table header"><code>th</code></abbr> elements that are used as headers for rows or columns of data (as defined by an attribute), <code>thead</code>, <code>tbody</code> and more. For anything that could be construed as vaguely semantic one needs to revert to the vanilla controller - the repeater. You can do whatever you want with a repeater and I found that it was one of my most used elements outside of form items. It is, however, no match for something like Ruby on Rails output using standard <code>if</code>, <code>if-else</code>, <code>for</code> style repetition. The dexterity of control is just far greater than the repeater element can be, and the only alternative is to create a custom controller which involves a far greater amount of effort than the few lines of code it can be achieved in through other true frameworks.
<h3>Conclusion</h3>
While I do believe that Visual Studio, the development environment, is a brilliant tool, I would also claim that the team behind ASP.NET has failed to grasp a large portion of the methodology and concepts that firmly make the base of web development today. Attempting to make web development "easy" for existing desktop application developers has left the .NET Development team with a product that doesn't make developing web applications with standards and separation of markup, style and behaviour an easy task and encourages poorly developed sites reliant on embedded styling and behaviour and with little room for semantics the status quo.

With Ruby on Rails, Django, CakePHP and more nipping at the heels of the most cashed up player in the market the team would do well to heed comments made elsewhere on the failures of ASP.NET to be a true web development platform. The efforts of third parties to bring some of the genius of Rails to the <abbr title="C-sharp">C#</abbr> language for those that must live in the land of ASP.NET will no doubt be a godsend for those who care about their final product. I do hope that the brains behind decide to ditch the pandering to the desktop development crowd and recognise that web development is a very different beast.

I should say that one <em>can</em> undertake quality web development with ASP.NET, as has been demonstrated by the very high quality ladies and gents from CampaignMonitor, so to say it's impossible would be to speak mistruths. Rather I would claim that the tools that the .NET team have provided developers with, and the desktop development paradigm, make it exceedingly difficult and time consuming. The web is supposed to be agile, to be both proactive and reactive and update problems at a moments notice, to deploy new features quickly, much unlike the desktop (even with the ability to "push" updates through to users). Perhaps Microsoft might want to realise this and give the world a true web development platform - not one compromised to meet the demands of people not willing to undertake professional training to create products  in an area they know, or possibly care, little about.</p>
